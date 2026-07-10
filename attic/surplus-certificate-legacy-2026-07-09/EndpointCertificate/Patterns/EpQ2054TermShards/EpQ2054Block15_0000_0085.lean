/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 15:0-85

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_15_0000_0085 : Poly :=
[
  term (2 : Rat) [(2, 1), (6, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0000 : Poly :=
[
  term ((-1540360451811 : Rat) / 90066973034) []
]

/-- Partial product 0 for generator 15. -/
def ep_Q2_054_partial_15_0000 : Poly :=
[
  term ((-1540360451811 : Rat) / 45033486517) [(2, 1), (6, 1)],
  term ((1540360451811 : Rat) / 90066973034) [(2, 2)],
  term ((-1540360451811 : Rat) / 45033486517) [(3, 1), (7, 1)],
  term ((1540360451811 : Rat) / 90066973034) [(3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 15. -/
theorem ep_Q2_054_partial_15_0000_valid :
    mulPoly ep_Q2_054_coefficient_15_0000
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0001 : Poly :=
[
  term ((4688710779591 : Rat) / 45033486517) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 1 for generator 15. -/
def ep_Q2_054_partial_15_0001 : Poly :=
[
  term ((9377421559182 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1)],
  term ((-4688710779591 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((9377421559182 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (15, 1)],
  term ((-4688710779591 : Rat) / 45033486517) [(0, 1), (3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 15. -/
theorem ep_Q2_054_partial_15_0001_valid :
    mulPoly ep_Q2_054_coefficient_15_0001
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0002 : Poly :=
[
  term ((-177407343612 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 2 for generator 15. -/
def ep_Q2_054_partial_15_0002 : Poly :=
[
  term ((-354814687224 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((177407343612 : Rat) / 45033486517) [(0, 1), (2, 2), (8, 1), (12, 1), (16, 1)],
  term ((-354814687224 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((177407343612 : Rat) / 45033486517) [(0, 1), (3, 2), (8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 15. -/
theorem ep_Q2_054_partial_15_0002_valid :
    mulPoly ep_Q2_054_coefficient_15_0002
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0003 : Poly :=
[
  term ((354814687224 : Rat) / 45033486517) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 15. -/
def ep_Q2_054_partial_15_0003 : Poly :=
[
  term ((709629374448 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-354814687224 : Rat) / 45033486517) [(0, 1), (2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((709629374448 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-354814687224 : Rat) / 45033486517) [(0, 1), (3, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 15. -/
theorem ep_Q2_054_partial_15_0003_valid :
    mulPoly ep_Q2_054_coefficient_15_0003
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0004 : Poly :=
[
  term ((118271562408 : Rat) / 45033486517) [(0, 1), (8, 1), (16, 1)]
]

/-- Partial product 4 for generator 15. -/
def ep_Q2_054_partial_15_0004 : Poly :=
[
  term ((236543124816 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (8, 1), (16, 1)],
  term ((-118271562408 : Rat) / 45033486517) [(0, 1), (2, 2), (8, 1), (16, 1)],
  term ((236543124816 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (16, 1)],
  term ((-118271562408 : Rat) / 45033486517) [(0, 1), (3, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 15. -/
theorem ep_Q2_054_partial_15_0004_valid :
    mulPoly ep_Q2_054_coefficient_15_0004
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0005 : Poly :=
[
  term ((24639759306 : Rat) / 45033486517) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 5 for generator 15. -/
def ep_Q2_054_partial_15_0005 : Poly :=
[
  term ((49279518612 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (12, 1), (16, 1)],
  term ((-24639759306 : Rat) / 45033486517) [(0, 1), (2, 2), (12, 1), (16, 1)],
  term ((49279518612 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-24639759306 : Rat) / 45033486517) [(0, 1), (3, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 15. -/
theorem ep_Q2_054_partial_15_0005_valid :
    mulPoly ep_Q2_054_coefficient_15_0005
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0006 : Poly :=
[
  term ((-3839665223268 : Rat) / 45033486517) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 6 for generator 15. -/
def ep_Q2_054_partial_15_0006 : Poly :=
[
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 15. -/
theorem ep_Q2_054_partial_15_0006_valid :
    mulPoly ep_Q2_054_coefficient_15_0006
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0007 : Poly :=
[
  term ((-49279518612 : Rat) / 45033486517) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 15. -/
def ep_Q2_054_partial_15_0007 : Poly :=
[
  term ((-98559037224 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((49279518612 : Rat) / 45033486517) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-98559037224 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((49279518612 : Rat) / 45033486517) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 15. -/
theorem ep_Q2_054_partial_15_0007_valid :
    mulPoly ep_Q2_054_coefficient_15_0007
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0008 : Poly :=
[
  term ((4846640305266 : Rat) / 45033486517) [(0, 1), (15, 2)]
]

/-- Partial product 8 for generator 15. -/
def ep_Q2_054_partial_15_0008 : Poly :=
[
  term ((9693280610532 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (15, 2)],
  term ((-4846640305266 : Rat) / 45033486517) [(0, 1), (2, 2), (15, 2)],
  term ((9693280610532 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((-4846640305266 : Rat) / 45033486517) [(0, 1), (3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 15. -/
theorem ep_Q2_054_partial_15_0008_valid :
    mulPoly ep_Q2_054_coefficient_15_0008
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0009 : Poly :=
[
  term ((-16426506204 : Rat) / 45033486517) [(0, 1), (16, 1)]
]

/-- Partial product 9 for generator 15. -/
def ep_Q2_054_partial_15_0009 : Poly :=
[
  term ((-32853012408 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (16, 1)],
  term ((16426506204 : Rat) / 45033486517) [(0, 1), (2, 2), (16, 1)],
  term ((-32853012408 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (16, 1)],
  term ((16426506204 : Rat) / 45033486517) [(0, 1), (3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 15. -/
theorem ep_Q2_054_partial_15_0009_valid :
    mulPoly ep_Q2_054_coefficient_15_0009
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0010 : Poly :=
[
  term ((-329471550000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 10 for generator 15. -/
def ep_Q2_054_partial_15_0010 : Poly :=
[
  term ((-658943100000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 2), (12, 1), (16, 1)],
  term ((329471550000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (12, 1), (16, 1)],
  term ((-658943100000 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((329471550000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 15. -/
theorem ep_Q2_054_partial_15_0010_valid :
    mulPoly ep_Q2_054_coefficient_15_0010
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0011 : Poly :=
[
  term ((658943100000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 15. -/
def ep_Q2_054_partial_15_0011 : Poly :=
[
  term ((1317886200000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-658943100000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1317886200000 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-658943100000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 15. -/
theorem ep_Q2_054_partial_15_0011_valid :
    mulPoly ep_Q2_054_coefficient_15_0011
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0012 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (16, 1)]
]

/-- Partial product 12 for generator 15. -/
def ep_Q2_054_partial_15_0012 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 2), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (7, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 15. -/
theorem ep_Q2_054_partial_15_0012_valid :
    mulPoly ep_Q2_054_coefficient_15_0012
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0013 : Poly :=
[
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 15. -/
def ep_Q2_054_partial_15_0013 : Poly :=
[
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 15. -/
theorem ep_Q2_054_partial_15_0013_valid :
    mulPoly ep_Q2_054_coefficient_15_0013
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0014 : Poly :=
[
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 14 for generator 15. -/
def ep_Q2_054_partial_15_0014 : Poly :=
[
  term ((-21763554491520 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((-21763554491520 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 15. -/
theorem ep_Q2_054_partial_15_0014_valid :
    mulPoly ep_Q2_054_coefficient_15_0014
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0015 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 15. -/
def ep_Q2_054_partial_15_0015 : Poly :=
[
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 15. -/
theorem ep_Q2_054_partial_15_0015_valid :
    mulPoly ep_Q2_054_coefficient_15_0015
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0016 : Poly :=
[
  term ((-5128006179591 : Rat) / 90066973034) [(1, 1), (7, 1)]
]

/-- Partial product 16 for generator 15. -/
def ep_Q2_054_partial_15_0016 : Poly :=
[
  term ((-5128006179591 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1)],
  term ((5128006179591 : Rat) / 90066973034) [(1, 1), (2, 2), (7, 1)],
  term ((-5128006179591 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2)],
  term ((5128006179591 : Rat) / 90066973034) [(1, 1), (3, 2), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 15. -/
theorem ep_Q2_054_partial_15_0016_valid :
    mulPoly ep_Q2_054_coefficient_15_0016
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0017 : Poly :=
[
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 17 for generator 15. -/
def ep_Q2_054_partial_15_0017 : Poly :=
[
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (12, 1), (16, 1)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (12, 1), (16, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 15. -/
theorem ep_Q2_054_partial_15_0017_valid :
    mulPoly ep_Q2_054_coefficient_15_0017
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0018 : Poly :=
[
  term ((-585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 15. -/
def ep_Q2_054_partial_15_0018 : Poly :=
[
  term ((-1171454400000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1171454400000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 15. -/
theorem ep_Q2_054_partial_15_0018_valid :
    mulPoly ep_Q2_054_coefficient_15_0018
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0019 : Poly :=
[
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 19 for generator 15. -/
def ep_Q2_054_partial_15_0019 : Poly :=
[
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 15. -/
theorem ep_Q2_054_partial_15_0019_valid :
    mulPoly ep_Q2_054_coefficient_15_0019
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0020 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 15. -/
def ep_Q2_054_partial_15_0020 : Poly :=
[
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 15. -/
theorem ep_Q2_054_partial_15_0020_valid :
    mulPoly ep_Q2_054_coefficient_15_0020
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0021 : Poly :=
[
  term ((1919832611634 : Rat) / 45033486517) [(1, 1), (13, 1)]
]

/-- Partial product 21 for generator 15. -/
def ep_Q2_054_partial_15_0021 : Poly :=
[
  term ((3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((-1919832611634 : Rat) / 45033486517) [(1, 1), (2, 2), (13, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-1919832611634 : Rat) / 45033486517) [(1, 1), (3, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 15. -/
theorem ep_Q2_054_partial_15_0021_valid :
    mulPoly ep_Q2_054_coefficient_15_0021
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0022 : Poly :=
[
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 22 for generator 15. -/
def ep_Q2_054_partial_15_0022 : Poly :=
[
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 15. -/
theorem ep_Q2_054_partial_15_0022_valid :
    mulPoly ep_Q2_054_coefficient_15_0022
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0023 : Poly :=
[
  term ((1203938929287 : Rat) / 45033486517) [(1, 1), (15, 1)]
]

/-- Partial product 23 for generator 15. -/
def ep_Q2_054_partial_15_0023 : Poly :=
[
  term ((2407877858574 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-1203938929287 : Rat) / 45033486517) [(1, 1), (2, 2), (15, 1)],
  term ((2407877858574 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-1203938929287 : Rat) / 45033486517) [(1, 1), (3, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 15. -/
theorem ep_Q2_054_partial_15_0023_valid :
    mulPoly ep_Q2_054_coefficient_15_0023
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0024 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 15. -/
def ep_Q2_054_partial_15_0024 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (3, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 15. -/
theorem ep_Q2_054_partial_15_0024_valid :
    mulPoly ep_Q2_054_coefficient_15_0024
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0025 : Poly :=
[
  term ((54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 25 for generator 15. -/
def ep_Q2_054_partial_15_0025 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 2), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 3), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 15. -/
theorem ep_Q2_054_partial_15_0025_valid :
    mulPoly ep_Q2_054_coefficient_15_0025
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0026 : Poly :=
[
  term ((54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 15. -/
def ep_Q2_054_partial_15_0026 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 15. -/
theorem ep_Q2_054_partial_15_0026_valid :
    mulPoly ep_Q2_054_coefficient_15_0026
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0027 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 15. -/
def ep_Q2_054_partial_15_0027 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 15. -/
theorem ep_Q2_054_partial_15_0027_valid :
    mulPoly ep_Q2_054_coefficient_15_0027
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0028 : Poly :=
[
  term ((781416132165 : Rat) / 90066973034) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 28 for generator 15. -/
def ep_Q2_054_partial_15_0028 : Poly :=
[
  term ((781416132165 : Rat) / 45033486517) [(2, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-781416132165 : Rat) / 90066973034) [(2, 1), (3, 2), (12, 1), (16, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 2), (6, 1), (12, 1), (16, 1)],
  term ((-781416132165 : Rat) / 90066973034) [(2, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 15. -/
theorem ep_Q2_054_partial_15_0028_valid :
    mulPoly ep_Q2_054_coefficient_15_0028
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0029 : Poly :=
[
  term ((-781416132165 : Rat) / 45033486517) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 15. -/
def ep_Q2_054_partial_15_0029 : Poly :=
[
  term ((-1562832264330 : Rat) / 45033486517) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1562832264330 : Rat) / 45033486517) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 15. -/
theorem ep_Q2_054_partial_15_0029_valid :
    mulPoly ep_Q2_054_coefficient_15_0029
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0030 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 30 for generator 15. -/
def ep_Q2_054_partial_15_0030 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 15. -/
theorem ep_Q2_054_partial_15_0030_valid :
    mulPoly ep_Q2_054_coefficient_15_0030
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0031 : Poly :=
[
  term ((-260472044055 : Rat) / 45033486517) [(2, 1), (16, 1)]
]

/-- Partial product 31 for generator 15. -/
def ep_Q2_054_partial_15_0031 : Poly :=
[
  term ((-520944088110 : Rat) / 45033486517) [(2, 1), (3, 1), (7, 1), (16, 1)],
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (3, 2), (16, 1)],
  term ((-520944088110 : Rat) / 45033486517) [(2, 2), (6, 1), (16, 1)],
  term ((260472044055 : Rat) / 45033486517) [(2, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 15. -/
theorem ep_Q2_054_partial_15_0031_valid :
    mulPoly ep_Q2_054_coefficient_15_0031
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0032 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 32 for generator 15. -/
def ep_Q2_054_partial_15_0032 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 2), (7, 2), (12, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 3), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 15. -/
theorem ep_Q2_054_partial_15_0032_valid :
    mulPoly ep_Q2_054_coefficient_15_0032
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0033 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 15. -/
def ep_Q2_054_partial_15_0033 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 3), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 15. -/
theorem ep_Q2_054_partial_15_0033_valid :
    mulPoly ep_Q2_054_coefficient_15_0033
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0034 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 34 for generator 15. -/
def ep_Q2_054_partial_15_0034 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 2), (7, 2), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 15. -/
theorem ep_Q2_054_partial_15_0034_valid :
    mulPoly ep_Q2_054_coefficient_15_0034
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0035 : Poly :=
[
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 15. -/
def ep_Q2_054_partial_15_0035 : Poly :=
[
  term ((604543180320 : Rat) / 45033486517) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 15. -/
theorem ep_Q2_054_partial_15_0035_valid :
    mulPoly ep_Q2_054_coefficient_15_0035
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0036 : Poly :=
[
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 36 for generator 15. -/
def ep_Q2_054_partial_15_0036 : Poly :=
[
  term ((-1209086360640 : Rat) / 45033486517) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((604543180320 : Rat) / 45033486517) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 15. -/
theorem ep_Q2_054_partial_15_0036_valid :
    mulPoly ep_Q2_054_coefficient_15_0036
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0037 : Poly :=
[
  term ((-41799546105 : Rat) / 45033486517) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 15. -/
def ep_Q2_054_partial_15_0037 : Poly :=
[
  term ((-83599092210 : Rat) / 45033486517) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((41799546105 : Rat) / 45033486517) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-83599092210 : Rat) / 45033486517) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((41799546105 : Rat) / 45033486517) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 15. -/
theorem ep_Q2_054_partial_15_0037_valid :
    mulPoly ep_Q2_054_coefficient_15_0037
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0038 : Poly :=
[
  term ((-9706893109182 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 38 for generator 15. -/
def ep_Q2_054_partial_15_0038 : Poly :=
[
  term ((-19413786218364 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (9, 1)],
  term ((9706893109182 : Rat) / 45033486517) [(2, 2), (6, 1), (7, 1), (9, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (9, 1)],
  term ((9706893109182 : Rat) / 45033486517) [(3, 2), (6, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 15. -/
theorem ep_Q2_054_partial_15_0038_valid :
    mulPoly ep_Q2_054_coefficient_15_0038
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0039 : Poly :=
[
  term ((-7679330446536 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 39 for generator 15. -/
def ep_Q2_054_partial_15_0039 : Poly :=
[
  term ((-15358660893072 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(2, 2), (6, 1), (7, 1), (13, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(3, 2), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 15. -/
theorem ep_Q2_054_partial_15_0039_valid :
    mulPoly ep_Q2_054_coefficient_15_0039
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0040 : Poly :=
[
  term ((4252391987652 : Rat) / 45033486517) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 40 for generator 15. -/
def ep_Q2_054_partial_15_0040 : Poly :=
[
  term ((8504783975304 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (15, 1)],
  term ((-4252391987652 : Rat) / 45033486517) [(2, 2), (6, 1), (7, 1), (15, 1)],
  term ((8504783975304 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (15, 1)],
  term ((-4252391987652 : Rat) / 45033486517) [(3, 2), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 15. -/
theorem ep_Q2_054_partial_15_0040_valid :
    mulPoly ep_Q2_054_coefficient_15_0040
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0041 : Poly :=
[
  term ((9706893109182 : Rat) / 45033486517) [(6, 1), (7, 2)]
]

/-- Partial product 41 for generator 15. -/
def ep_Q2_054_partial_15_0041 : Poly :=
[
  term ((19413786218364 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 2)],
  term ((-9706893109182 : Rat) / 45033486517) [(2, 2), (6, 1), (7, 2)],
  term ((19413786218364 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 3)],
  term ((-9706893109182 : Rat) / 45033486517) [(3, 2), (6, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 15. -/
theorem ep_Q2_054_partial_15_0041_valid :
    mulPoly ep_Q2_054_coefficient_15_0041
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0042 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 42 for generator 15. -/
def ep_Q2_054_partial_15_0042 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (6, 2), (8, 1), (12, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(2, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 2), (6, 1), (8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 15. -/
theorem ep_Q2_054_partial_15_0042_valid :
    mulPoly ep_Q2_054_coefficient_15_0042
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0043 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 15. -/
def ep_Q2_054_partial_15_0043 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 15. -/
theorem ep_Q2_054_partial_15_0043_valid :
    mulPoly ep_Q2_054_coefficient_15_0043
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0044 : Poly :=
[
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 44 for generator 15. -/
def ep_Q2_054_partial_15_0044 : Poly :=
[
  term ((24405300000 : Rat) / 45033486517) [(2, 1), (6, 2), (8, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(2, 2), (6, 1), (8, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(3, 2), (6, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 15. -/
theorem ep_Q2_054_partial_15_0044_valid :
    mulPoly ep_Q2_054_coefficient_15_0044
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0045 : Poly :=
[
  term ((7679330446536 : Rat) / 45033486517) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 45 for generator 15. -/
def ep_Q2_054_partial_15_0045 : Poly :=
[
  term ((15358660893072 : Rat) / 45033486517) [(2, 1), (6, 2), (9, 1), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(2, 2), (6, 1), (9, 1), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(3, 2), (6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 15. -/
theorem ep_Q2_054_partial_15_0045_valid :
    mulPoly ep_Q2_054_coefficient_15_0045
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0046 : Poly :=
[
  term ((-4252391987652 : Rat) / 45033486517) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 46 for generator 15. -/
def ep_Q2_054_partial_15_0046 : Poly :=
[
  term ((-8504783975304 : Rat) / 45033486517) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((4252391987652 : Rat) / 45033486517) [(2, 2), (6, 1), (9, 1), (15, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((4252391987652 : Rat) / 45033486517) [(3, 2), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 15. -/
theorem ep_Q2_054_partial_15_0046_valid :
    mulPoly ep_Q2_054_coefficient_15_0046
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0047 : Poly :=
[
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 15. -/
def ep_Q2_054_partial_15_0047 : Poly :=
[
  term ((-1269540678672 : Rat) / 45033486517) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((634770339336 : Rat) / 45033486517) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1269540678672 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((634770339336 : Rat) / 45033486517) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 15. -/
theorem ep_Q2_054_partial_15_0047_valid :
    mulPoly ep_Q2_054_coefficient_15_0047
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0048 : Poly :=
[
  term ((-1420928166735 : Rat) / 45033486517) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 48 for generator 15. -/
def ep_Q2_054_partial_15_0048 : Poly :=
[
  term ((-2841856333470 : Rat) / 45033486517) [(2, 1), (6, 2), (12, 1), (16, 1)],
  term ((1420928166735 : Rat) / 45033486517) [(2, 2), (6, 1), (12, 1), (16, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((1420928166735 : Rat) / 45033486517) [(3, 2), (6, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 15. -/
theorem ep_Q2_054_partial_15_0048_valid :
    mulPoly ep_Q2_054_coefficient_15_0048
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0049 : Poly :=
[
  term ((2841856333470 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 15. -/
def ep_Q2_054_partial_15_0049 : Poly :=
[
  term ((5683712666940 : Rat) / 45033486517) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((5683712666940 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 15. -/
theorem ep_Q2_054_partial_15_0049_valid :
    mulPoly ep_Q2_054_coefficient_15_0049
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0050 : Poly :=
[
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 50 for generator 15. -/
def ep_Q2_054_partial_15_0050 : Poly :=
[
  term ((-1269540678672 : Rat) / 45033486517) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((634770339336 : Rat) / 45033486517) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((-1269540678672 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((634770339336 : Rat) / 45033486517) [(3, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 15. -/
theorem ep_Q2_054_partial_15_0050_valid :
    mulPoly ep_Q2_054_coefficient_15_0050
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0051 : Poly :=
[
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (16, 1)]
]

/-- Partial product 51 for generator 15. -/
def ep_Q2_054_partial_15_0051 : Poly :=
[
  term ((1894570888980 : Rat) / 45033486517) [(2, 1), (6, 2), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(2, 2), (6, 1), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(3, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 15. -/
theorem ep_Q2_054_partial_15_0051_valid :
    mulPoly ep_Q2_054_coefficient_15_0051
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0052 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 52 for generator 15. -/
def ep_Q2_054_partial_15_0052 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(2, 2), (7, 1), (8, 1), (11, 1)],
  term ((219647700000 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (11, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(3, 2), (7, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 15. -/
theorem ep_Q2_054_partial_15_0052_valid :
    mulPoly ep_Q2_054_coefficient_15_0052
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0053 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 53 for generator 15. -/
def ep_Q2_054_partial_15_0053 : Poly :=
[
  term ((146431800000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(2, 2), (7, 1), (8, 1), (13, 1)],
  term ((146431800000 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (13, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 2), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 15. -/
theorem ep_Q2_054_partial_15_0053_valid :
    mulPoly ep_Q2_054_coefficient_15_0053
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0054 : Poly :=
[
  term ((3355300289079 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 54 for generator 15. -/
def ep_Q2_054_partial_15_0054 : Poly :=
[
  term ((6710600578158 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-3355300289079 : Rat) / 45033486517) [(2, 2), (7, 1), (8, 1), (15, 1)],
  term ((6710600578158 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (15, 1)],
  term ((-3355300289079 : Rat) / 45033486517) [(3, 2), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 15. -/
theorem ep_Q2_054_partial_15_0054_valid :
    mulPoly ep_Q2_054_coefficient_15_0054
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0055 : Poly :=
[
  term ((-54911925000 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 55 for generator 15. -/
def ep_Q2_054_partial_15_0055 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 15. -/
theorem ep_Q2_054_partial_15_0055_valid :
    mulPoly ep_Q2_054_coefficient_15_0055
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0056 : Poly :=
[
  term ((1871279436213 : Rat) / 90066973034) [(7, 1), (9, 1)]
]

/-- Partial product 56 for generator 15. -/
def ep_Q2_054_partial_15_0056 : Poly :=
[
  term ((1871279436213 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (9, 1)],
  term ((-1871279436213 : Rat) / 90066973034) [(2, 2), (7, 1), (9, 1)],
  term ((1871279436213 : Rat) / 45033486517) [(3, 1), (7, 2), (9, 1)],
  term ((-1871279436213 : Rat) / 90066973034) [(3, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 15. -/
theorem ep_Q2_054_partial_15_0056_valid :
    mulPoly ep_Q2_054_coefficient_15_0056
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0057 : Poly :=
[
  term ((3050662500 : Rat) / 45033486517) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 57 for generator 15. -/
def ep_Q2_054_partial_15_0057 : Poly :=
[
  term ((6101325000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term ((6101325000 : Rat) / 45033486517) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(3, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 15. -/
theorem ep_Q2_054_partial_15_0057_valid :
    mulPoly ep_Q2_054_coefficient_15_0057
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0058 : Poly :=
[
  term ((4488761414646 : Rat) / 45033486517) [(7, 1), (11, 1)]
]

/-- Partial product 58 for generator 15. -/
def ep_Q2_054_partial_15_0058 : Poly :=
[
  term ((8977522829292 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (11, 1)],
  term ((-4488761414646 : Rat) / 45033486517) [(2, 2), (7, 1), (11, 1)],
  term ((8977522829292 : Rat) / 45033486517) [(3, 1), (7, 2), (11, 1)],
  term ((-4488761414646 : Rat) / 45033486517) [(3, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 15. -/
theorem ep_Q2_054_partial_15_0058_valid :
    mulPoly ep_Q2_054_coefficient_15_0058
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0059 : Poly :=
[
  term ((-208118815077 : Rat) / 45033486517) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 59 for generator 15. -/
def ep_Q2_054_partial_15_0059 : Poly :=
[
  term ((-416237630154 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((208118815077 : Rat) / 45033486517) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-416237630154 : Rat) / 45033486517) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((208118815077 : Rat) / 45033486517) [(3, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 15. -/
theorem ep_Q2_054_partial_15_0059_valid :
    mulPoly ep_Q2_054_coefficient_15_0059
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0060 : Poly :=
[
  term ((1279888407756 : Rat) / 45033486517) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 60 for generator 15. -/
def ep_Q2_054_partial_15_0060 : Poly :=
[
  term ((2559776815512 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-1279888407756 : Rat) / 45033486517) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((2559776815512 : Rat) / 45033486517) [(3, 1), (7, 2), (12, 1), (15, 1)],
  term ((-1279888407756 : Rat) / 45033486517) [(3, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 15. -/
theorem ep_Q2_054_partial_15_0060_valid :
    mulPoly ep_Q2_054_coefficient_15_0060
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0061 : Poly :=
[
  term ((5722889884902 : Rat) / 45033486517) [(7, 1), (13, 1)]
]

/-- Partial product 61 for generator 15. -/
def ep_Q2_054_partial_15_0061 : Poly :=
[
  term ((11445779769804 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term ((-5722889884902 : Rat) / 45033486517) [(2, 2), (7, 1), (13, 1)],
  term ((11445779769804 : Rat) / 45033486517) [(3, 1), (7, 2), (13, 1)],
  term ((-5722889884902 : Rat) / 45033486517) [(3, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 15. -/
theorem ep_Q2_054_partial_15_0061_valid :
    mulPoly ep_Q2_054_coefficient_15_0061
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0062 : Poly :=
[
  term ((-12545797189329 : Rat) / 45033486517) [(7, 1), (15, 1)]
]

/-- Partial product 62 for generator 15. -/
def ep_Q2_054_partial_15_0062 : Poly :=
[
  term ((-25091594378658 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((12545797189329 : Rat) / 45033486517) [(2, 2), (7, 1), (15, 1)],
  term ((-25091594378658 : Rat) / 45033486517) [(3, 1), (7, 2), (15, 1)],
  term ((12545797189329 : Rat) / 45033486517) [(3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 15. -/
theorem ep_Q2_054_partial_15_0062_valid :
    mulPoly ep_Q2_054_coefficient_15_0062
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0063 : Poly :=
[
  term ((-644554082082 : Rat) / 45033486517) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 15. -/
def ep_Q2_054_partial_15_0063 : Poly :=
[
  term ((-1289108164164 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((644554082082 : Rat) / 45033486517) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1289108164164 : Rat) / 45033486517) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((644554082082 : Rat) / 45033486517) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 15. -/
theorem ep_Q2_054_partial_15_0063_valid :
    mulPoly ep_Q2_054_coefficient_15_0063
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0064 : Poly :=
[
  term ((384383475000 : Rat) / 45033486517) [(7, 2)]
]

/-- Partial product 64 for generator 15. -/
def ep_Q2_054_partial_15_0064 : Poly :=
[
  term ((768766950000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 2)],
  term ((-384383475000 : Rat) / 45033486517) [(2, 2), (7, 2)],
  term ((768766950000 : Rat) / 45033486517) [(3, 1), (7, 3)],
  term ((-384383475000 : Rat) / 45033486517) [(3, 2), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 15. -/
theorem ep_Q2_054_partial_15_0064_valid :
    mulPoly ep_Q2_054_coefficient_15_0064
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0065 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(7, 2), (16, 1)]
]

/-- Partial product 65 for generator 15. -/
def ep_Q2_054_partial_15_0065 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 2), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(2, 2), (7, 2), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 3), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 15. -/
theorem ep_Q2_054_partial_15_0065_valid :
    mulPoly ep_Q2_054_coefficient_15_0065
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0066 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 66 for generator 15. -/
def ep_Q2_054_partial_15_0066 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(3, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 15. -/
theorem ep_Q2_054_partial_15_0066_valid :
    mulPoly ep_Q2_054_coefficient_15_0066
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0067 : Poly :=
[
  term ((-301737198393 : Rat) / 90066973034) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 67 for generator 15. -/
def ep_Q2_054_partial_15_0067 : Poly :=
[
  term ((-301737198393 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((301737198393 : Rat) / 90066973034) [(2, 2), (8, 1), (12, 1), (16, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((301737198393 : Rat) / 90066973034) [(3, 2), (8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 15. -/
theorem ep_Q2_054_partial_15_0067_valid :
    mulPoly ep_Q2_054_coefficient_15_0067
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0068 : Poly :=
[
  term ((-5048751583908 : Rat) / 45033486517) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 68 for generator 15. -/
def ep_Q2_054_partial_15_0068 : Poly :=
[
  term ((-10097503167816 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((5048751583908 : Rat) / 45033486517) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((-10097503167816 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((5048751583908 : Rat) / 45033486517) [(3, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 15. -/
theorem ep_Q2_054_partial_15_0068_valid :
    mulPoly ep_Q2_054_coefficient_15_0068
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0069 : Poly :=
[
  term ((301737198393 : Rat) / 45033486517) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 15. -/
def ep_Q2_054_partial_15_0069 : Poly :=
[
  term ((603474396786 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((603474396786 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 15. -/
theorem ep_Q2_054_partial_15_0069_valid :
    mulPoly ep_Q2_054_coefficient_15_0069
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0070 : Poly :=
[
  term ((-15718122688320 : Rat) / 45033486517) [(8, 1), (15, 2)]
]

/-- Partial product 70 for generator 15. -/
def ep_Q2_054_partial_15_0070 : Poly :=
[
  term ((-31436245376640 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (15, 2)],
  term ((15718122688320 : Rat) / 45033486517) [(2, 2), (8, 1), (15, 2)],
  term ((-31436245376640 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (15, 2)],
  term ((15718122688320 : Rat) / 45033486517) [(3, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 15. -/
theorem ep_Q2_054_partial_15_0070_valid :
    mulPoly ep_Q2_054_coefficient_15_0070
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0071 : Poly :=
[
  term ((-1437433626015 : Rat) / 45033486517) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 71 for generator 15. -/
def ep_Q2_054_partial_15_0071 : Poly :=
[
  term ((-2874867252030 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((1437433626015 : Rat) / 45033486517) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2874867252030 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((1437433626015 : Rat) / 45033486517) [(3, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 15. -/
theorem ep_Q2_054_partial_15_0071_valid :
    mulPoly ep_Q2_054_coefficient_15_0071
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0072 : Poly :=
[
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (16, 1)]
]

/-- Partial product 72 for generator 15. -/
def ep_Q2_054_partial_15_0072 : Poly :=
[
  term ((201158132262 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(2, 2), (8, 1), (16, 1)],
  term ((201158132262 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(3, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 15. -/
theorem ep_Q2_054_partial_15_0072_valid :
    mulPoly ep_Q2_054_coefficient_15_0072
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0073 : Poly :=
[
  term ((-5915781061335 : Rat) / 45033486517) [(9, 1), (13, 1)]
]

/-- Partial product 73 for generator 15. -/
def ep_Q2_054_partial_15_0073 : Poly :=
[
  term ((-11831562122670 : Rat) / 45033486517) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((5915781061335 : Rat) / 45033486517) [(2, 2), (9, 1), (13, 1)],
  term ((-11831562122670 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term ((5915781061335 : Rat) / 45033486517) [(3, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 15. -/
theorem ep_Q2_054_partial_15_0073_valid :
    mulPoly ep_Q2_054_coefficient_15_0073
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0074 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(9, 1), (15, 1)]
]

/-- Partial product 74 for generator 15. -/
def ep_Q2_054_partial_15_0074 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 2), (9, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 15. -/
theorem ep_Q2_054_partial_15_0074_valid :
    mulPoly ep_Q2_054_coefficient_15_0074
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0075 : Poly :=
[
  term ((159714847335 : Rat) / 90066973034) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 15. -/
def ep_Q2_054_partial_15_0075 : Poly :=
[
  term ((159714847335 : Rat) / 45033486517) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((159714847335 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 15. -/
theorem ep_Q2_054_partial_15_0075_valid :
    mulPoly ep_Q2_054_coefficient_15_0075
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0076 : Poly :=
[
  term ((-999247302231 : Rat) / 90066973034) [(11, 1), (15, 1)]
]

/-- Partial product 76 for generator 15. -/
def ep_Q2_054_partial_15_0076 : Poly :=
[
  term ((-999247302231 : Rat) / 45033486517) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((999247302231 : Rat) / 90066973034) [(2, 2), (11, 1), (15, 1)],
  term ((-999247302231 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((999247302231 : Rat) / 90066973034) [(3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 15. -/
theorem ep_Q2_054_partial_15_0076_valid :
    mulPoly ep_Q2_054_coefficient_15_0076
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0077 : Poly :=
[
  term ((883122138717 : Rat) / 90066973034) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 15. -/
def ep_Q2_054_partial_15_0077 : Poly :=
[
  term ((883122138717 : Rat) / 45033486517) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-883122138717 : Rat) / 90066973034) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((883122138717 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-883122138717 : Rat) / 90066973034) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 15. -/
theorem ep_Q2_054_partial_15_0077_valid :
    mulPoly ep_Q2_054_coefficient_15_0077
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0078 : Poly :=
[
  term ((938437253395 : Rat) / 45033486517) [(12, 1)]
]

/-- Partial product 78 for generator 15. -/
def ep_Q2_054_partial_15_0078 : Poly :=
[
  term ((1876874506790 : Rat) / 45033486517) [(2, 1), (6, 1), (12, 1)],
  term ((-938437253395 : Rat) / 45033486517) [(2, 2), (12, 1)],
  term ((1876874506790 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1)],
  term ((-938437253395 : Rat) / 45033486517) [(3, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 15. -/
theorem ep_Q2_054_partial_15_0078_valid :
    mulPoly ep_Q2_054_coefficient_15_0078
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0079 : Poly :=
[
  term ((156283226433 : Rat) / 45033486517) [(12, 1), (15, 2)]
]

/-- Partial product 79 for generator 15. -/
def ep_Q2_054_partial_15_0079 : Poly :=
[
  term ((312566452866 : Rat) / 45033486517) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((-156283226433 : Rat) / 45033486517) [(2, 2), (12, 1), (15, 2)],
  term ((312566452866 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-156283226433 : Rat) / 45033486517) [(3, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 15. -/
theorem ep_Q2_054_partial_15_0079_valid :
    mulPoly ep_Q2_054_coefficient_15_0079
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0080 : Poly :=
[
  term ((-45403677525 : Rat) / 45033486517) [(12, 1), (16, 1)]
]

/-- Partial product 80 for generator 15. -/
def ep_Q2_054_partial_15_0080 : Poly :=
[
  term ((-90807355050 : Rat) / 45033486517) [(2, 1), (6, 1), (12, 1), (16, 1)],
  term ((45403677525 : Rat) / 45033486517) [(2, 2), (12, 1), (16, 1)],
  term ((-90807355050 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (16, 1)],
  term ((45403677525 : Rat) / 45033486517) [(3, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 15. -/
theorem ep_Q2_054_partial_15_0080_valid :
    mulPoly ep_Q2_054_coefficient_15_0080
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0081 : Poly :=
[
  term ((483963841871 : Rat) / 90066973034) [(13, 1), (15, 1)]
]

/-- Partial product 81 for generator 15. -/
def ep_Q2_054_partial_15_0081 : Poly :=
[
  term ((483963841871 : Rat) / 45033486517) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-483963841871 : Rat) / 90066973034) [(2, 2), (13, 1), (15, 1)],
  term ((483963841871 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-483963841871 : Rat) / 90066973034) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 15. -/
theorem ep_Q2_054_partial_15_0081_valid :
    mulPoly ep_Q2_054_coefficient_15_0081
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0082 : Poly :=
[
  term ((90807355050 : Rat) / 45033486517) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 15. -/
def ep_Q2_054_partial_15_0082 : Poly :=
[
  term ((181614710100 : Rat) / 45033486517) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-90807355050 : Rat) / 45033486517) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((181614710100 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-90807355050 : Rat) / 45033486517) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 15. -/
theorem ep_Q2_054_partial_15_0082_valid :
    mulPoly ep_Q2_054_coefficient_15_0082
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0083 : Poly :=
[
  term ((22420007015741 : Rat) / 90066973034) [(15, 2)]
]

/-- Partial product 83 for generator 15. -/
def ep_Q2_054_partial_15_0083 : Poly :=
[
  term ((22420007015741 : Rat) / 45033486517) [(2, 1), (6, 1), (15, 2)],
  term ((-22420007015741 : Rat) / 90066973034) [(2, 2), (15, 2)],
  term ((22420007015741 : Rat) / 45033486517) [(3, 1), (7, 1), (15, 2)],
  term ((-22420007015741 : Rat) / 90066973034) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 15. -/
theorem ep_Q2_054_partial_15_0083_valid :
    mulPoly ep_Q2_054_coefficient_15_0083
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0084 : Poly :=
[
  term ((3119130001407 : Rat) / 90066973034) [(15, 2), (16, 1)]
]

/-- Partial product 84 for generator 15. -/
def ep_Q2_054_partial_15_0084 : Poly :=
[
  term ((3119130001407 : Rat) / 45033486517) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-3119130001407 : Rat) / 90066973034) [(2, 2), (15, 2), (16, 1)],
  term ((3119130001407 : Rat) / 45033486517) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-3119130001407 : Rat) / 90066973034) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 15. -/
theorem ep_Q2_054_partial_15_0084_valid :
    mulPoly ep_Q2_054_coefficient_15_0084
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 15. -/
def ep_Q2_054_coefficient_15_0085 : Poly :=
[
  term ((30269118350 : Rat) / 45033486517) [(16, 1)]
]

/-- Partial product 85 for generator 15. -/
def ep_Q2_054_partial_15_0085 : Poly :=
[
  term ((60538236700 : Rat) / 45033486517) [(2, 1), (6, 1), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(2, 2), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(3, 1), (7, 1), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 15. -/
theorem ep_Q2_054_partial_15_0085_valid :
    mulPoly ep_Q2_054_coefficient_15_0085
        ep_Q2_054_generator_15_0000_0085 =
      ep_Q2_054_partial_15_0085 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_15_0000_0085 : List Poly :=
[
  ep_Q2_054_partial_15_0000,
  ep_Q2_054_partial_15_0001,
  ep_Q2_054_partial_15_0002,
  ep_Q2_054_partial_15_0003,
  ep_Q2_054_partial_15_0004,
  ep_Q2_054_partial_15_0005,
  ep_Q2_054_partial_15_0006,
  ep_Q2_054_partial_15_0007,
  ep_Q2_054_partial_15_0008,
  ep_Q2_054_partial_15_0009,
  ep_Q2_054_partial_15_0010,
  ep_Q2_054_partial_15_0011,
  ep_Q2_054_partial_15_0012,
  ep_Q2_054_partial_15_0013,
  ep_Q2_054_partial_15_0014,
  ep_Q2_054_partial_15_0015,
  ep_Q2_054_partial_15_0016,
  ep_Q2_054_partial_15_0017,
  ep_Q2_054_partial_15_0018,
  ep_Q2_054_partial_15_0019,
  ep_Q2_054_partial_15_0020,
  ep_Q2_054_partial_15_0021,
  ep_Q2_054_partial_15_0022,
  ep_Q2_054_partial_15_0023,
  ep_Q2_054_partial_15_0024,
  ep_Q2_054_partial_15_0025,
  ep_Q2_054_partial_15_0026,
  ep_Q2_054_partial_15_0027,
  ep_Q2_054_partial_15_0028,
  ep_Q2_054_partial_15_0029,
  ep_Q2_054_partial_15_0030,
  ep_Q2_054_partial_15_0031,
  ep_Q2_054_partial_15_0032,
  ep_Q2_054_partial_15_0033,
  ep_Q2_054_partial_15_0034,
  ep_Q2_054_partial_15_0035,
  ep_Q2_054_partial_15_0036,
  ep_Q2_054_partial_15_0037,
  ep_Q2_054_partial_15_0038,
  ep_Q2_054_partial_15_0039,
  ep_Q2_054_partial_15_0040,
  ep_Q2_054_partial_15_0041,
  ep_Q2_054_partial_15_0042,
  ep_Q2_054_partial_15_0043,
  ep_Q2_054_partial_15_0044,
  ep_Q2_054_partial_15_0045,
  ep_Q2_054_partial_15_0046,
  ep_Q2_054_partial_15_0047,
  ep_Q2_054_partial_15_0048,
  ep_Q2_054_partial_15_0049,
  ep_Q2_054_partial_15_0050,
  ep_Q2_054_partial_15_0051,
  ep_Q2_054_partial_15_0052,
  ep_Q2_054_partial_15_0053,
  ep_Q2_054_partial_15_0054,
  ep_Q2_054_partial_15_0055,
  ep_Q2_054_partial_15_0056,
  ep_Q2_054_partial_15_0057,
  ep_Q2_054_partial_15_0058,
  ep_Q2_054_partial_15_0059,
  ep_Q2_054_partial_15_0060,
  ep_Q2_054_partial_15_0061,
  ep_Q2_054_partial_15_0062,
  ep_Q2_054_partial_15_0063,
  ep_Q2_054_partial_15_0064,
  ep_Q2_054_partial_15_0065,
  ep_Q2_054_partial_15_0066,
  ep_Q2_054_partial_15_0067,
  ep_Q2_054_partial_15_0068,
  ep_Q2_054_partial_15_0069,
  ep_Q2_054_partial_15_0070,
  ep_Q2_054_partial_15_0071,
  ep_Q2_054_partial_15_0072,
  ep_Q2_054_partial_15_0073,
  ep_Q2_054_partial_15_0074,
  ep_Q2_054_partial_15_0075,
  ep_Q2_054_partial_15_0076,
  ep_Q2_054_partial_15_0077,
  ep_Q2_054_partial_15_0078,
  ep_Q2_054_partial_15_0079,
  ep_Q2_054_partial_15_0080,
  ep_Q2_054_partial_15_0081,
  ep_Q2_054_partial_15_0082,
  ep_Q2_054_partial_15_0083,
  ep_Q2_054_partial_15_0084,
  ep_Q2_054_partial_15_0085
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_15_0000_0085 : Poly :=
[
  term ((9377421559182 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1)],
  term ((-354814687224 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((709629374448 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((236543124816 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (8, 1), (16, 1)],
  term ((49279518612 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (12, 1), (16, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-98559037224 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((9693280610532 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (15, 2)],
  term ((-32853012408 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (16, 1)],
  term ((-4688710779591 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((177407343612 : Rat) / 45033486517) [(0, 1), (2, 2), (8, 1), (12, 1), (16, 1)],
  term ((-354814687224 : Rat) / 45033486517) [(0, 1), (2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-118271562408 : Rat) / 45033486517) [(0, 1), (2, 2), (8, 1), (16, 1)],
  term ((-24639759306 : Rat) / 45033486517) [(0, 1), (2, 2), (12, 1), (16, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((49279518612 : Rat) / 45033486517) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4846640305266 : Rat) / 45033486517) [(0, 1), (2, 2), (15, 2)],
  term ((16426506204 : Rat) / 45033486517) [(0, 1), (2, 2), (16, 1)],
  term ((-354814687224 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((709629374448 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((236543124816 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (16, 1)],
  term ((49279518612 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-98559037224 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((9693280610532 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((-32853012408 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (16, 1)],
  term ((9377421559182 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (15, 1)],
  term ((-4688710779591 : Rat) / 45033486517) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((177407343612 : Rat) / 45033486517) [(0, 1), (3, 2), (8, 1), (12, 1), (16, 1)],
  term ((-354814687224 : Rat) / 45033486517) [(0, 1), (3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-118271562408 : Rat) / 45033486517) [(0, 1), (3, 2), (8, 1), (16, 1)],
  term ((-24639759306 : Rat) / 45033486517) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((49279518612 : Rat) / 45033486517) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4846640305266 : Rat) / 45033486517) [(0, 1), (3, 2), (15, 2)],
  term ((16426506204 : Rat) / 45033486517) [(0, 1), (3, 2), (16, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21763554491520 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-658943100000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 2), (12, 1), (16, 1)],
  term ((1317886200000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 2), (16, 1)],
  term ((329471550000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (12, 1), (16, 1)],
  term ((-658943100000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((-5128006179591 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((-1171454400000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((2407877858574 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-658943100000 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((1317886200000 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (7, 1), (16, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21763554491520 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((5128006179591 : Rat) / 90066973034) [(1, 1), (2, 2), (7, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (12, 1), (16, 1)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1919832611634 : Rat) / 45033486517) [(1, 1), (2, 2), (13, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1203938929287 : Rat) / 45033486517) [(1, 1), (2, 2), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((329471550000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (12, 1), (16, 1)],
  term ((-658943100000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 3), (12, 1), (15, 1), (16, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 3), (13, 1), (15, 2), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((2407877858574 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-5128006179591 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (12, 1), (16, 1)],
  term ((-1171454400000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((5128006179591 : Rat) / 90066973034) [(1, 1), (3, 2), (7, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (12, 1), (16, 1)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1919832611634 : Rat) / 45033486517) [(1, 1), (3, 2), (13, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1203938929287 : Rat) / 45033486517) [(1, 1), (3, 2), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((604543180320 : Rat) / 45033486517) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-83599092210 : Rat) / 45033486517) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-1562832264330 : Rat) / 45033486517) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-520944088110 : Rat) / 45033486517) [(2, 1), (3, 1), (7, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-781416132165 : Rat) / 90066973034) [(2, 1), (3, 2), (12, 1), (16, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (3, 2), (16, 1)],
  term ((-1540360451811 : Rat) / 45033486517) [(2, 1), (6, 1)],
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((146431800000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((6710600578158 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1871279436213 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (9, 1)],
  term ((6101325000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((8977522829292 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (11, 1)],
  term ((-416237630154 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((2559776815512 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((11445779769804 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term ((-25091594378658 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((-1289108164164 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((768766950000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 2)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-10097503167816 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((603474396786 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31436245376640 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (15, 2)],
  term ((-2874867252030 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((201158132262 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (16, 1)],
  term ((-11831562122670 : Rat) / 45033486517) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((159714847335 : Rat) / 45033486517) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-999247302231 : Rat) / 45033486517) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((883122138717 : Rat) / 45033486517) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1876874506790 : Rat) / 45033486517) [(2, 1), (6, 1), (12, 1)],
  term ((312566452866 : Rat) / 45033486517) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((-90807355050 : Rat) / 45033486517) [(2, 1), (6, 1), (12, 1), (16, 1)],
  term ((483963841871 : Rat) / 45033486517) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((181614710100 : Rat) / 45033486517) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((22420007015741 : Rat) / 45033486517) [(2, 1), (6, 1), (15, 2)],
  term ((3119130001407 : Rat) / 45033486517) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(2, 1), (6, 1), (16, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (9, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (13, 1)],
  term ((8504783975304 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (15, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 2)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (6, 2), (8, 1), (12, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(2, 1), (6, 2), (8, 1), (16, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(2, 1), (6, 2), (9, 1), (13, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((-1269540678672 : Rat) / 45033486517) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(2, 1), (6, 2), (12, 1), (16, 1)],
  term ((5683712666940 : Rat) / 45033486517) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1269540678672 : Rat) / 45033486517) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(2, 1), (6, 2), (16, 1)],
  term ((1540360451811 : Rat) / 90066973034) [(2, 2)],
  term ((18303975000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((604543180320 : Rat) / 45033486517) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((41799546105 : Rat) / 45033486517) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((9706893109182 : Rat) / 45033486517) [(2, 2), (6, 1), (7, 1), (9, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 2), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(2, 2), (6, 1), (7, 1), (13, 1)],
  term ((-4252391987652 : Rat) / 45033486517) [(2, 2), (6, 1), (7, 1), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-9706893109182 : Rat) / 45033486517) [(2, 2), (6, 1), (7, 2)],
  term ((18303975000 : Rat) / 45033486517) [(2, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(2, 2), (6, 1), (8, 1), (16, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(2, 2), (6, 1), (9, 1), (13, 1)],
  term ((4252391987652 : Rat) / 45033486517) [(2, 2), (6, 1), (9, 1), (15, 1)],
  term ((-1178859201624 : Rat) / 45033486517) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((2202344298900 : Rat) / 45033486517) [(2, 2), (6, 1), (12, 1), (16, 1)],
  term ((-4404688597800 : Rat) / 45033486517) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1178859201624 : Rat) / 45033486517) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((-1468229532600 : Rat) / 45033486517) [(2, 2), (6, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(2, 2), (7, 1), (8, 1), (11, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(2, 2), (7, 1), (8, 1), (13, 1)],
  term ((-3355300289079 : Rat) / 45033486517) [(2, 2), (7, 1), (8, 1), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1871279436213 : Rat) / 90066973034) [(2, 2), (7, 1), (9, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term ((-4488761414646 : Rat) / 45033486517) [(2, 2), (7, 1), (11, 1)],
  term ((208118815077 : Rat) / 45033486517) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-1279888407756 : Rat) / 45033486517) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-5722889884902 : Rat) / 45033486517) [(2, 2), (7, 1), (13, 1)],
  term ((12545797189329 : Rat) / 45033486517) [(2, 2), (7, 1), (15, 1)],
  term ((644554082082 : Rat) / 45033486517) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(2, 2), (7, 2)],
  term ((18303975000 : Rat) / 45033486517) [(2, 2), (7, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((301737198393 : Rat) / 90066973034) [(2, 2), (8, 1), (12, 1), (16, 1)],
  term ((5048751583908 : Rat) / 45033486517) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((15718122688320 : Rat) / 45033486517) [(2, 2), (8, 1), (15, 2)],
  term ((1437433626015 : Rat) / 45033486517) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(2, 2), (8, 1), (16, 1)],
  term ((5915781061335 : Rat) / 45033486517) [(2, 2), (9, 1), (13, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 2), (9, 1), (15, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((999247302231 : Rat) / 90066973034) [(2, 2), (11, 1), (15, 1)],
  term ((-883122138717 : Rat) / 90066973034) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-938437253395 : Rat) / 45033486517) [(2, 2), (12, 1)],
  term ((-156283226433 : Rat) / 45033486517) [(2, 2), (12, 1), (15, 2)],
  term ((45403677525 : Rat) / 45033486517) [(2, 2), (12, 1), (16, 1)],
  term ((-483963841871 : Rat) / 90066973034) [(2, 2), (13, 1), (15, 1)],
  term ((-90807355050 : Rat) / 45033486517) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-22420007015741 : Rat) / 90066973034) [(2, 2), (15, 2)],
  term ((-3119130001407 : Rat) / 90066973034) [(2, 2), (15, 2), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(2, 2), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 3), (7, 1), (11, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 3), (7, 1), (15, 1), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 3), (11, 1), (15, 1), (16, 1)],
  term ((-781416132165 : Rat) / 90066973034) [(2, 3), (12, 1), (16, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 3), (13, 1), (15, 1), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 3), (15, 2), (16, 1)],
  term ((260472044055 : Rat) / 45033486517) [(2, 3), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((-1269540678672 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((5683712666940 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1269540678672 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (16, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (9, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (13, 1)],
  term ((8504783975304 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (15, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 3)],
  term ((-1540360451811 : Rat) / 45033486517) [(3, 1), (7, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-10097503167816 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((603474396786 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31436245376640 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (15, 2)],
  term ((-2874867252030 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((201158132262 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (16, 1)],
  term ((-11831562122670 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((159714847335 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-999247302231 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((883122138717 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1876874506790 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1)],
  term ((312566452866 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-90807355050 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (16, 1)],
  term ((483963841871 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((181614710100 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((22420007015741 : Rat) / 45033486517) [(3, 1), (7, 1), (15, 2)],
  term ((3119130001407 : Rat) / 45033486517) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(3, 1), (7, 1), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (11, 1)],
  term ((146431800000 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (13, 1)],
  term ((6710600578158 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((1871279436213 : Rat) / 45033486517) [(3, 1), (7, 2), (9, 1)],
  term ((6101325000 : Rat) / 45033486517) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((8977522829292 : Rat) / 45033486517) [(3, 1), (7, 2), (11, 1)],
  term ((-416237630154 : Rat) / 45033486517) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((2559776815512 : Rat) / 45033486517) [(3, 1), (7, 2), (12, 1), (15, 1)],
  term ((11445779769804 : Rat) / 45033486517) [(3, 1), (7, 2), (13, 1)],
  term ((-25091594378658 : Rat) / 45033486517) [(3, 1), (7, 2), (15, 1)],
  term ((-1289108164164 : Rat) / 45033486517) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((768766950000 : Rat) / 45033486517) [(3, 1), (7, 3)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 3), (16, 1)],
  term ((1540360451811 : Rat) / 90066973034) [(3, 2)],
  term ((9706893109182 : Rat) / 45033486517) [(3, 2), (6, 1), (7, 1), (9, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(3, 2), (6, 1), (7, 1), (13, 1)],
  term ((-4252391987652 : Rat) / 45033486517) [(3, 2), (6, 1), (7, 1), (15, 1)],
  term ((-9706893109182 : Rat) / 45033486517) [(3, 2), (6, 1), (7, 2)],
  term ((18303975000 : Rat) / 45033486517) [(3, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(3, 2), (6, 1), (8, 1), (16, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(3, 2), (6, 1), (9, 1), (13, 1)],
  term ((4252391987652 : Rat) / 45033486517) [(3, 2), (6, 1), (9, 1), (15, 1)],
  term ((634770339336 : Rat) / 45033486517) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1420928166735 : Rat) / 45033486517) [(3, 2), (6, 1), (12, 1), (16, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((634770339336 : Rat) / 45033486517) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(3, 2), (6, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(3, 2), (7, 1), (8, 1), (11, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 2), (7, 1), (8, 1), (13, 1)],
  term ((-3355300289079 : Rat) / 45033486517) [(3, 2), (7, 1), (8, 1), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1871279436213 : Rat) / 90066973034) [(3, 2), (7, 1), (9, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-4488761414646 : Rat) / 45033486517) [(3, 2), (7, 1), (11, 1)],
  term ((208118815077 : Rat) / 45033486517) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-1279888407756 : Rat) / 45033486517) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5722889884902 : Rat) / 45033486517) [(3, 2), (7, 1), (13, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((12545797189329 : Rat) / 45033486517) [(3, 2), (7, 1), (15, 1)],
  term ((560954989872 : Rat) / 45033486517) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(3, 2), (7, 2)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 2), (7, 2), (12, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(3, 2), (7, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((301737198393 : Rat) / 90066973034) [(3, 2), (8, 1), (12, 1), (16, 1)],
  term ((5048751583908 : Rat) / 45033486517) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((15718122688320 : Rat) / 45033486517) [(3, 2), (8, 1), (15, 2)],
  term ((1437433626015 : Rat) / 45033486517) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(3, 2), (8, 1), (16, 1)],
  term ((5915781061335 : Rat) / 45033486517) [(3, 2), (9, 1), (13, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(3, 2), (9, 1), (15, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((999247302231 : Rat) / 90066973034) [(3, 2), (11, 1), (15, 1)],
  term ((-883122138717 : Rat) / 90066973034) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-938437253395 : Rat) / 45033486517) [(3, 2), (12, 1)],
  term ((-156283226433 : Rat) / 45033486517) [(3, 2), (12, 1), (15, 2)],
  term ((45403677525 : Rat) / 45033486517) [(3, 2), (12, 1), (16, 1)],
  term ((-483963841871 : Rat) / 90066973034) [(3, 2), (13, 1), (15, 1)],
  term ((-90807355050 : Rat) / 45033486517) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-22420007015741 : Rat) / 90066973034) [(3, 2), (15, 2)],
  term ((-3119130001407 : Rat) / 90066973034) [(3, 2), (15, 2), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(3, 2), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 3), (7, 1), (12, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 3), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 3), (7, 1), (16, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 3), (12, 1), (15, 1), (16, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 3), (13, 1), (15, 2), (16, 1)],
  term ((41799546105 : Rat) / 45033486517) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 0 through 85. -/
theorem ep_Q2_054_block_15_0000_0085_valid :
    checkProductSumEq ep_Q2_054_partials_15_0000_0085
      ep_Q2_054_block_15_0000_0085 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
