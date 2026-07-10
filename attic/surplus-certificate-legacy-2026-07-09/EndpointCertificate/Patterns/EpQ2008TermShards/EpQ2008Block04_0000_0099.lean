/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 4:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 4 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_04_0000_0099 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0000 : Poly :=
[
  term ((160786571772802500 : Rat) / 692956453614176359) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 4. -/
def ep_Q2_008_partial_04_0000 : Poly :=
[
  term ((160786571772802500 : Rat) / 692956453614176359) [(0, 1), (2, 2), (5, 1), (11, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(0, 1), (3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-160786571772802500 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-160786571772802500 : Rat) / 692956453614176359) [(0, 1), (5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 4. -/
theorem ep_Q2_008_partial_04_0000_valid :
    mulPoly ep_Q2_008_coefficient_04_0000
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0001 : Poly :=
[
  term ((-25038660808027332193634360516732089864500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 4. -/
def ep_Q2_008_partial_04_0001 : Poly :=
[
  term ((-25038660808027332193634360516732089864500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-25038660808027332193634360516732089864500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((25038660808027332193634360516732089864500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((25038660808027332193634360516732089864500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 4. -/
theorem ep_Q2_008_partial_04_0001_valid :
    mulPoly ep_Q2_008_coefficient_04_0001
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0002 : Poly :=
[
  term ((514517029672968000 : Rat) / 692956453614176359) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 2 for generator 4. -/
def ep_Q2_008_partial_04_0002 : Poly :=
[
  term ((514517029672968000 : Rat) / 692956453614176359) [(0, 1), (2, 2), (6, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(0, 1), (3, 2), (6, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(0, 1), (6, 1), (10, 2), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(0, 1), (6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 4. -/
theorem ep_Q2_008_partial_04_0002_valid :
    mulPoly ep_Q2_008_coefficient_04_0002
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0003 : Poly :=
[
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 3 for generator 4. -/
def ep_Q2_008_partial_04_0003 : Poly :=
[
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (2, 2), (7, 1), (11, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 4. -/
theorem ep_Q2_008_partial_04_0003_valid :
    mulPoly ep_Q2_008_coefficient_04_0003
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0004 : Poly :=
[
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 4. -/
def ep_Q2_008_partial_04_0004 : Poly :=
[
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 4. -/
theorem ep_Q2_008_partial_04_0004_valid :
    mulPoly ep_Q2_008_coefficient_04_0004
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0005 : Poly :=
[
  term ((39086433493068362523020532831011537838600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 4. -/
def ep_Q2_008_partial_04_0005 : Poly :=
[
  term ((39086433493068362523020532831011537838600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((39086433493068362523020532831011537838600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-39086433493068362523020532831011537838600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-39086433493068362523020532831011537838600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 4. -/
theorem ep_Q2_008_partial_04_0005_valid :
    mulPoly ep_Q2_008_coefficient_04_0005
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0006 : Poly :=
[
  term ((-257258514836484000 : Rat) / 692956453614176359) [(0, 1), (10, 1), (16, 1)]
]

/-- Partial product 6 for generator 4. -/
def ep_Q2_008_partial_04_0006 : Poly :=
[
  term ((-257258514836484000 : Rat) / 692956453614176359) [(0, 1), (2, 2), (10, 1), (16, 1)],
  term ((-257258514836484000 : Rat) / 692956453614176359) [(0, 1), (3, 2), (10, 1), (16, 1)],
  term ((257258514836484000 : Rat) / 692956453614176359) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((257258514836484000 : Rat) / 692956453614176359) [(0, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 4. -/
theorem ep_Q2_008_partial_04_0006_valid :
    mulPoly ep_Q2_008_coefficient_04_0006
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0007 : Poly :=
[
  term ((747955311654222000 : Rat) / 692956453614176359) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 7 for generator 4. -/
def ep_Q2_008_partial_04_0007 : Poly :=
[
  term ((747955311654222000 : Rat) / 692956453614176359) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((747955311654222000 : Rat) / 692956453614176359) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-747955311654222000 : Rat) / 692956453614176359) [(0, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-747955311654222000 : Rat) / 692956453614176359) [(0, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 4. -/
theorem ep_Q2_008_partial_04_0007_valid :
    mulPoly ep_Q2_008_coefficient_04_0007
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0008 : Poly :=
[
  term ((-3719915033536521311186866396402824981300 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 4. -/
def ep_Q2_008_partial_04_0008 : Poly :=
[
  term ((-3719915033536521311186866396402824981300 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3719915033536521311186866396402824981300 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((3719915033536521311186866396402824981300 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((3719915033536521311186866396402824981300 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 4. -/
theorem ep_Q2_008_partial_04_0008_valid :
    mulPoly ep_Q2_008_coefficient_04_0008
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0009 : Poly :=
[
  term ((-131011280703765000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 9 for generator 4. -/
def ep_Q2_008_partial_04_0009 : Poly :=
[
  term ((-131011280703765000 : Rat) / 692956453614176359) [(0, 1), (2, 2), (11, 2), (16, 1)],
  term ((-131011280703765000 : Rat) / 692956453614176359) [(0, 1), (3, 2), (11, 2), (16, 1)],
  term ((131011280703765000 : Rat) / 692956453614176359) [(0, 1), (10, 2), (11, 2), (16, 1)],
  term ((131011280703765000 : Rat) / 692956453614176359) [(0, 1), (11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 4. -/
theorem ep_Q2_008_partial_04_0009_valid :
    mulPoly ep_Q2_008_coefficient_04_0009
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0010 : Poly :=
[
  term ((-16768314054960611887143539262127087116300 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 4. -/
def ep_Q2_008_partial_04_0010 : Poly :=
[
  term ((-16768314054960611887143539262127087116300 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16768314054960611887143539262127087116300 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((16768314054960611887143539262127087116300 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((16768314054960611887143539262127087116300 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 4. -/
theorem ep_Q2_008_partial_04_0010_valid :
    mulPoly ep_Q2_008_coefficient_04_0010
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0011 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(0, 1), (13, 2), (16, 1)]
]

/-- Partial product 11 for generator 4. -/
def ep_Q2_008_partial_04_0011 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(0, 1), (2, 2), (13, 2), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(0, 1), (3, 2), (13, 2), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(0, 1), (10, 2), (13, 2), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 4. -/
theorem ep_Q2_008_partial_04_0011_valid :
    mulPoly ep_Q2_008_coefficient_04_0011
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0012 : Poly :=
[
  term ((9469059765741736983 : Rat) / 5543651628913410872) [(0, 1), (16, 1)]
]

/-- Partial product 12 for generator 4. -/
def ep_Q2_008_partial_04_0012 : Poly :=
[
  term ((9469059765741736983 : Rat) / 5543651628913410872) [(0, 1), (2, 2), (16, 1)],
  term ((9469059765741736983 : Rat) / 5543651628913410872) [(0, 1), (3, 2), (16, 1)],
  term ((-9469059765741736983 : Rat) / 5543651628913410872) [(0, 1), (10, 2), (16, 1)],
  term ((-9469059765741736983 : Rat) / 5543651628913410872) [(0, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 4. -/
theorem ep_Q2_008_partial_04_0012_valid :
    mulPoly ep_Q2_008_coefficient_04_0012
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0013 : Poly :=
[
  term ((-160786571772802500 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 13 for generator 4. -/
def ep_Q2_008_partial_04_0013 : Poly :=
[
  term ((-160786571772802500 : Rat) / 692956453614176359) [(1, 1), (2, 2), (4, 1), (11, 1), (16, 1)],
  term ((-160786571772802500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (4, 1), (11, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 2), (11, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 4. -/
theorem ep_Q2_008_partial_04_0013_valid :
    mulPoly ep_Q2_008_coefficient_04_0013
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0014 : Poly :=
[
  term ((25038660808027332193634360516732089864500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 4. -/
def ep_Q2_008_partial_04_0014 : Poly :=
[
  term ((25038660808027332193634360516732089864500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((25038660808027332193634360516732089864500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((-25038660808027332193634360516732089864500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (10, 2), (15, 1), (16, 1)],
  term ((-25038660808027332193634360516732089864500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 4. -/
theorem ep_Q2_008_partial_04_0014_valid :
    mulPoly ep_Q2_008_coefficient_04_0014
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0015 : Poly :=
[
  term ((-11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 15 for generator 4. -/
def ep_Q2_008_partial_04_0015 : Poly :=
[
  term ((-11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (10, 2), (16, 1)],
  term ((11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 4. -/
theorem ep_Q2_008_partial_04_0015_valid :
    mulPoly ep_Q2_008_coefficient_04_0015
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0016 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 16 for generator 4. -/
def ep_Q2_008_partial_04_0016 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (11, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (11, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 2), (11, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 4. -/
theorem ep_Q2_008_partial_04_0016_valid :
    mulPoly ep_Q2_008_coefficient_04_0016
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0017 : Poly :=
[
  term ((1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 17 for generator 4. -/
def ep_Q2_008_partial_04_0017 : Poly :=
[
  term ((1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (13, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (13, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 4. -/
theorem ep_Q2_008_partial_04_0017_valid :
    mulPoly ep_Q2_008_coefficient_04_0017
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0018 : Poly :=
[
  term ((-39086433493068362523020532831011537838600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 4. -/
def ep_Q2_008_partial_04_0018 : Poly :=
[
  term ((-39086433493068362523020532831011537838600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((-39086433493068362523020532831011537838600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((39086433493068362523020532831011537838600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((39086433493068362523020532831011537838600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 4. -/
theorem ep_Q2_008_partial_04_0018_valid :
    mulPoly ep_Q2_008_coefficient_04_0018
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0019 : Poly :=
[
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 19 for generator 4. -/
def ep_Q2_008_partial_04_0019 : Poly :=
[
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 4. -/
theorem ep_Q2_008_partial_04_0019_valid :
    mulPoly ep_Q2_008_coefficient_04_0019
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0020 : Poly :=
[
  term ((131011280703765000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 20 for generator 4. -/
def ep_Q2_008_partial_04_0020 : Poly :=
[
  term ((131011280703765000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (10, 1), (11, 1), (16, 1)],
  term ((131011280703765000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (10, 1), (11, 1), (16, 1)],
  term ((-131011280703765000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 3), (16, 1)],
  term ((-131011280703765000 : Rat) / 692956453614176359) [(1, 1), (10, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 4. -/
theorem ep_Q2_008_partial_04_0020_valid :
    mulPoly ep_Q2_008_coefficient_04_0020
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0021 : Poly :=
[
  term ((-771775544509452000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 21 for generator 4. -/
def ep_Q2_008_partial_04_0021 : Poly :=
[
  term ((-771775544509452000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 4. -/
theorem ep_Q2_008_partial_04_0021_valid :
    mulPoly ep_Q2_008_coefficient_04_0021
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0022 : Poly :=
[
  term ((3719915033536521311186866396402824981300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 4. -/
def ep_Q2_008_partial_04_0022 : Poly :=
[
  term ((3719915033536521311186866396402824981300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((3719915033536521311186866396402824981300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((-3719915033536521311186866396402824981300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3719915033536521311186866396402824981300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 4. -/
theorem ep_Q2_008_partial_04_0022_valid :
    mulPoly ep_Q2_008_coefficient_04_0022
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0023 : Poly :=
[
  term ((23820232855230000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 23 for generator 4. -/
def ep_Q2_008_partial_04_0023 : Poly :=
[
  term ((23820232855230000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (11, 1), (12, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((-23820232855230000 : Rat) / 692956453614176359) [(1, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((-23820232855230000 : Rat) / 692956453614176359) [(1, 1), (11, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 4. -/
theorem ep_Q2_008_partial_04_0023_valid :
    mulPoly ep_Q2_008_coefficient_04_0023
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0024 : Poly :=
[
  term ((-203662990912216500 : Rat) / 692956453614176359) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 24 for generator 4. -/
def ep_Q2_008_partial_04_0024 : Poly :=
[
  term ((-203662990912216500 : Rat) / 692956453614176359) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-203662990912216500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((203662990912216500 : Rat) / 692956453614176359) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((203662990912216500 : Rat) / 692956453614176359) [(1, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 4. -/
theorem ep_Q2_008_partial_04_0024_valid :
    mulPoly ep_Q2_008_coefficient_04_0024
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0025 : Poly :=
[
  term ((-771775544509452000 : Rat) / 692956453614176359) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 25 for generator 4. -/
def ep_Q2_008_partial_04_0025 : Poly :=
[
  term ((-771775544509452000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (12, 1), (13, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (11, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 4. -/
theorem ep_Q2_008_partial_04_0025_valid :
    mulPoly ep_Q2_008_coefficient_04_0025
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0026 : Poly :=
[
  term ((16768314054960611887143539262127087116300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 4. -/
def ep_Q2_008_partial_04_0026 : Poly :=
[
  term ((16768314054960611887143539262127087116300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((16768314054960611887143539262127087116300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-16768314054960611887143539262127087116300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-16768314054960611887143539262127087116300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 4. -/
theorem ep_Q2_008_partial_04_0026_valid :
    mulPoly ep_Q2_008_coefficient_04_0026
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0027 : Poly :=
[
  term ((83743107255942419034103088611666944000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 4. -/
def ep_Q2_008_partial_04_0027 : Poly :=
[
  term ((83743107255942419034103088611666944000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((83743107255942419034103088611666944000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-83743107255942419034103088611666944000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-83743107255942419034103088611666944000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 4. -/
theorem ep_Q2_008_partial_04_0027_valid :
    mulPoly ep_Q2_008_coefficient_04_0027
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0028 : Poly :=
[
  term ((-77415756779497500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 28 for generator 4. -/
def ep_Q2_008_partial_04_0028 : Poly :=
[
  term ((-77415756779497500 : Rat) / 692956453614176359) [(2, 2), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((77415756779497500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 2), (11, 1), (16, 1)],
  term ((77415756779497500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 3), (16, 1)],
  term ((-77415756779497500 : Rat) / 692956453614176359) [(3, 3), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 4. -/
theorem ep_Q2_008_partial_04_0028_valid :
    mulPoly ep_Q2_008_coefficient_04_0028
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0029 : Poly :=
[
  term ((244293712003370549631544627149109440000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 29 for generator 4. -/
def ep_Q2_008_partial_04_0029 : Poly :=
[
  term ((244293712003370549631544627149109440000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-244293712003370549631544627149109440000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-244293712003370549631544627149109440000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((244293712003370549631544627149109440000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (4, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 4. -/
theorem ep_Q2_008_partial_04_0029_valid :
    mulPoly ep_Q2_008_coefficient_04_0029
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0030 : Poly :=
[
  term ((4445152409672299125 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 4. -/
def ep_Q2_008_partial_04_0030 : Poly :=
[
  term ((4445152409672299125 : Rat) / 1385912907228352718) [(2, 2), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-4445152409672299125 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (10, 2), (13, 1), (16, 1)],
  term ((-4445152409672299125 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (11, 2), (13, 1), (16, 1)],
  term ((4445152409672299125 : Rat) / 1385912907228352718) [(3, 3), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 4. -/
theorem ep_Q2_008_partial_04_0030_valid :
    mulPoly ep_Q2_008_coefficient_04_0030
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0031 : Poly :=
[
  term ((-282490367997479199819108683876281612800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 4. -/
def ep_Q2_008_partial_04_0031 : Poly :=
[
  term ((-282490367997479199819108683876281612800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((282490367997479199819108683876281612800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((282490367997479199819108683876281612800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-282490367997479199819108683876281612800 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (4, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 4. -/
theorem ep_Q2_008_partial_04_0031_valid :
    mulPoly ep_Q2_008_coefficient_04_0031
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0032 : Poly :=
[
  term ((-50520893495468214211857875336424483244275 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 4. -/
def ep_Q2_008_partial_04_0032 : Poly :=
[
  term ((-50520893495468214211857875336424483244275 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((50520893495468214211857875336424483244275 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 2), (15, 1), (16, 1)],
  term ((50520893495468214211857875336424483244275 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((-50520893495468214211857875336424483244275 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 4. -/
theorem ep_Q2_008_partial_04_0032_valid :
    mulPoly ep_Q2_008_coefficient_04_0032
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0033 : Poly :=
[
  term ((65505640351882500 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 33 for generator 4. -/
def ep_Q2_008_partial_04_0033 : Poly :=
[
  term ((65505640351882500 : Rat) / 692956453614176359) [(2, 2), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-65505640351882500 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 2), (11, 1), (16, 1)],
  term ((-65505640351882500 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 3), (16, 1)],
  term ((65505640351882500 : Rat) / 692956453614176359) [(3, 3), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 4. -/
theorem ep_Q2_008_partial_04_0033_valid :
    mulPoly ep_Q2_008_coefficient_04_0033
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0034 : Poly :=
[
  term ((-89574361067902534864899696621340128000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 34 for generator 4. -/
def ep_Q2_008_partial_04_0034 : Poly :=
[
  term ((-89574361067902534864899696621340128000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((89574361067902534864899696621340128000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((89574361067902534864899696621340128000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-89574361067902534864899696621340128000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 4. -/
theorem ep_Q2_008_partial_04_0034_valid :
    mulPoly ep_Q2_008_coefficient_04_0034
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0035 : Poly :=
[
  term ((-1344309255493660125 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 35 for generator 4. -/
def ep_Q2_008_partial_04_0035 : Poly :=
[
  term ((-1344309255493660125 : Rat) / 1385912907228352718) [(2, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((1344309255493660125 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((1344309255493660125 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1344309255493660125 : Rat) / 1385912907228352718) [(3, 3), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 4. -/
theorem ep_Q2_008_partial_04_0035_valid :
    mulPoly ep_Q2_008_coefficient_04_0035
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0036 : Poly :=
[
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 4. -/
def ep_Q2_008_partial_04_0036 : Poly :=
[
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 4. -/
theorem ep_Q2_008_partial_04_0036_valid :
    mulPoly ep_Q2_008_coefficient_04_0036
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0037 : Poly :=
[
  term ((11731350826100487515654405226480972413175 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 4. -/
def ep_Q2_008_partial_04_0037 : Poly :=
[
  term ((11731350826100487515654405226480972413175 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-11731350826100487515654405226480972413175 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((-11731350826100487515654405226480972413175 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((11731350826100487515654405226480972413175 : Rat) / 168707601851329515375740828258983054697998) [(3, 3), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 4. -/
theorem ep_Q2_008_partial_04_0037_valid :
    mulPoly ep_Q2_008_coefficient_04_0037
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0038 : Poly :=
[
  term ((8932587320711250 : Rat) / 692956453614176359) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 38 for generator 4. -/
def ep_Q2_008_partial_04_0038 : Poly :=
[
  term ((8932587320711250 : Rat) / 692956453614176359) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((-8932587320711250 : Rat) / 692956453614176359) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term ((-8932587320711250 : Rat) / 692956453614176359) [(3, 1), (11, 3), (16, 1)],
  term ((8932587320711250 : Rat) / 692956453614176359) [(3, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 4. -/
theorem ep_Q2_008_partial_04_0038_valid :
    mulPoly ep_Q2_008_coefficient_04_0038
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0039 : Poly :=
[
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 39 for generator 4. -/
def ep_Q2_008_partial_04_0039 : Poly :=
[
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 4. -/
theorem ep_Q2_008_partial_04_0039_valid :
    mulPoly ep_Q2_008_coefficient_04_0039
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0040 : Poly :=
[
  term ((590855012505316125 : Rat) / 692956453614176359) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 40 for generator 4. -/
def ep_Q2_008_partial_04_0040 : Poly :=
[
  term ((590855012505316125 : Rat) / 692956453614176359) [(2, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-590855012505316125 : Rat) / 692956453614176359) [(3, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-590855012505316125 : Rat) / 692956453614176359) [(3, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((590855012505316125 : Rat) / 692956453614176359) [(3, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 4. -/
theorem ep_Q2_008_partial_04_0040_valid :
    mulPoly ep_Q2_008_coefficient_04_0040
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0041 : Poly :=
[
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 4. -/
def ep_Q2_008_partial_04_0041 : Poly :=
[
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 4. -/
theorem ep_Q2_008_partial_04_0041_valid :
    mulPoly ep_Q2_008_coefficient_04_0041
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0042 : Poly :=
[
  term ((-27531816602288522072571425264257936942875 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 4. -/
def ep_Q2_008_partial_04_0042 : Poly :=
[
  term ((-27531816602288522072571425264257936942875 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((27531816602288522072571425264257936942875 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((27531816602288522072571425264257936942875 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-27531816602288522072571425264257936942875 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 4. -/
theorem ep_Q2_008_partial_04_0042_valid :
    mulPoly ep_Q2_008_coefficient_04_0042
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0043 : Poly :=
[
  term ((61073428000842637407886156787277360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 43 for generator 4. -/
def ep_Q2_008_partial_04_0043 : Poly :=
[
  term ((61073428000842637407886156787277360000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-61073428000842637407886156787277360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-61073428000842637407886156787277360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((61073428000842637407886156787277360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 4. -/
theorem ep_Q2_008_partial_04_0043_valid :
    mulPoly ep_Q2_008_coefficient_04_0043
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0044 : Poly :=
[
  term ((-1167969048869801250 : Rat) / 692956453614176359) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 44 for generator 4. -/
def ep_Q2_008_partial_04_0044 : Poly :=
[
  term ((-1167969048869801250 : Rat) / 692956453614176359) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((1167969048869801250 : Rat) / 692956453614176359) [(3, 1), (10, 2), (13, 1), (16, 1)],
  term ((1167969048869801250 : Rat) / 692956453614176359) [(3, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1167969048869801250 : Rat) / 692956453614176359) [(3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 4. -/
theorem ep_Q2_008_partial_04_0044_valid :
    mulPoly ep_Q2_008_coefficient_04_0044
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0045 : Poly :=
[
  term ((782281019069942399499070201503549081600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 4. -/
def ep_Q2_008_partial_04_0045 : Poly :=
[
  term ((782281019069942399499070201503549081600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-782281019069942399499070201503549081600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-782281019069942399499070201503549081600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((782281019069942399499070201503549081600 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 4. -/
theorem ep_Q2_008_partial_04_0045_valid :
    mulPoly ep_Q2_008_coefficient_04_0045
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0046 : Poly :=
[
  term ((146136185653143702802592564144982933848325 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 4. -/
def ep_Q2_008_partial_04_0046 : Poly :=
[
  term ((146136185653143702802592564144982933848325 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-146136185653143702802592564144982933848325 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-146136185653143702802592564144982933848325 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((146136185653143702802592564144982933848325 : Rat) / 337415203702659030751481656517966109395996) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 4. -/
theorem ep_Q2_008_partial_04_0046_valid :
    mulPoly ep_Q2_008_coefficient_04_0046
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0047 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 4. -/
def ep_Q2_008_partial_04_0047 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 4. -/
theorem ep_Q2_008_partial_04_0047_valid :
    mulPoly ep_Q2_008_coefficient_04_0047
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0048 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 48 for generator 4. -/
def ep_Q2_008_partial_04_0048 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (10, 2), (13, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 4. -/
theorem ep_Q2_008_partial_04_0048_valid :
    mulPoly ep_Q2_008_coefficient_04_0048
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0049 : Poly :=
[
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 4. -/
def ep_Q2_008_partial_04_0049 : Poly :=
[
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 4. -/
theorem ep_Q2_008_partial_04_0049_valid :
    mulPoly ep_Q2_008_coefficient_04_0049
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0050 : Poly :=
[
  term ((-3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 4. -/
def ep_Q2_008_partial_04_0050 : Poly :=
[
  term ((-3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 4. -/
theorem ep_Q2_008_partial_04_0050_valid :
    mulPoly ep_Q2_008_coefficient_04_0050
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0051 : Poly :=
[
  term ((-692576845212253500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 51 for generator 4. -/
def ep_Q2_008_partial_04_0051 : Poly :=
[
  term ((-692576845212253500 : Rat) / 692956453614176359) [(2, 2), (4, 1), (6, 1), (16, 1)],
  term ((-692576845212253500 : Rat) / 692956453614176359) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 2), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 4. -/
theorem ep_Q2_008_partial_04_0051_valid :
    mulPoly ep_Q2_008_coefficient_04_0051
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0052 : Poly :=
[
  term ((11910116427615000 : Rat) / 692956453614176359) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 52 for generator 4. -/
def ep_Q2_008_partial_04_0052 : Poly :=
[
  term ((11910116427615000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((11910116427615000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-11910116427615000 : Rat) / 692956453614176359) [(4, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-11910116427615000 : Rat) / 692956453614176359) [(4, 1), (7, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 4. -/
theorem ep_Q2_008_partial_04_0052_valid :
    mulPoly ep_Q2_008_coefficient_04_0052
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0053 : Poly :=
[
  term ((-33544681786106127 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 53 for generator 4. -/
def ep_Q2_008_partial_04_0053 : Poly :=
[
  term ((-33544681786106127 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-33544681786106127 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((33544681786106127 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((33544681786106127 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 4. -/
theorem ep_Q2_008_partial_04_0053_valid :
    mulPoly ep_Q2_008_coefficient_04_0053
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0054 : Poly :=
[
  term ((292487975299185726763880141278367433600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 4. -/
def ep_Q2_008_partial_04_0054 : Poly :=
[
  term ((292487975299185726763880141278367433600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((292487975299185726763880141278367433600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-292487975299185726763880141278367433600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-292487975299185726763880141278367433600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 4. -/
theorem ep_Q2_008_partial_04_0054_valid :
    mulPoly ep_Q2_008_coefficient_04_0054
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0055 : Poly :=
[
  term ((10643590132327670684291519070096197474400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 55 for generator 4. -/
def ep_Q2_008_partial_04_0055 : Poly :=
[
  term ((10643590132327670684291519070096197474400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((10643590132327670684291519070096197474400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-10643590132327670684291519070096197474400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-10643590132327670684291519070096197474400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 4. -/
theorem ep_Q2_008_partial_04_0055_valid :
    mulPoly ep_Q2_008_coefficient_04_0055
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0056 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 4. -/
def ep_Q2_008_partial_04_0056 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 4. -/
theorem ep_Q2_008_partial_04_0056_valid :
    mulPoly ep_Q2_008_coefficient_04_0056
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0057 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 57 for generator 4. -/
def ep_Q2_008_partial_04_0057 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 4. -/
theorem ep_Q2_008_partial_04_0057_valid :
    mulPoly ep_Q2_008_coefficient_04_0057
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0058 : Poly :=
[
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 58 for generator 4. -/
def ep_Q2_008_partial_04_0058 : Poly :=
[
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 4. -/
theorem ep_Q2_008_partial_04_0058_valid :
    mulPoly ep_Q2_008_coefficient_04_0058
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0059 : Poly :=
[
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 59 for generator 4. -/
def ep_Q2_008_partial_04_0059 : Poly :=
[
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 4. -/
theorem ep_Q2_008_partial_04_0059_valid :
    mulPoly ep_Q2_008_coefficient_04_0059
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0060 : Poly :=
[
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 4. -/
def ep_Q2_008_partial_04_0060 : Poly :=
[
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 4. -/
theorem ep_Q2_008_partial_04_0060_valid :
    mulPoly ep_Q2_008_coefficient_04_0060
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0061 : Poly :=
[
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 4. -/
def ep_Q2_008_partial_04_0061 : Poly :=
[
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 4. -/
theorem ep_Q2_008_partial_04_0061_valid :
    mulPoly ep_Q2_008_coefficient_04_0061
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0062 : Poly :=
[
  term ((2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 4. -/
def ep_Q2_008_partial_04_0062 : Poly :=
[
  term ((2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 4. -/
theorem ep_Q2_008_partial_04_0062_valid :
    mulPoly ep_Q2_008_coefficient_04_0062
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0063 : Poly :=
[
  term ((519432633909190125 : Rat) / 692956453614176359) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 63 for generator 4. -/
def ep_Q2_008_partial_04_0063 : Poly :=
[
  term ((519432633909190125 : Rat) / 692956453614176359) [(2, 2), (4, 1), (10, 1), (16, 1)],
  term ((519432633909190125 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (16, 1)],
  term ((-519432633909190125 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 2), (16, 1)],
  term ((-519432633909190125 : Rat) / 692956453614176359) [(4, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 4. -/
theorem ep_Q2_008_partial_04_0063_valid :
    mulPoly ep_Q2_008_coefficient_04_0063
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0064 : Poly :=
[
  term ((1183003274989443375 : Rat) / 1385912907228352718) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 64 for generator 4. -/
def ep_Q2_008_partial_04_0064 : Poly :=
[
  term ((1183003274989443375 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((1183003274989443375 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1183003274989443375 : Rat) / 1385912907228352718) [(4, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1183003274989443375 : Rat) / 1385912907228352718) [(4, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 4. -/
theorem ep_Q2_008_partial_04_0064_valid :
    mulPoly ep_Q2_008_coefficient_04_0064
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0065 : Poly :=
[
  term ((2620606629610106333514019741360892313600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 65 for generator 4. -/
def ep_Q2_008_partial_04_0065 : Poly :=
[
  term ((2620606629610106333514019741360892313600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2620606629610106333514019741360892313600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2620606629610106333514019741360892313600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2620606629610106333514019741360892313600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 4. -/
theorem ep_Q2_008_partial_04_0065_valid :
    mulPoly ep_Q2_008_coefficient_04_0065
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0066 : Poly :=
[
  term ((-23859475368263646098316398113043793497400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 66 for generator 4. -/
def ep_Q2_008_partial_04_0066 : Poly :=
[
  term ((-23859475368263646098316398113043793497400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-23859475368263646098316398113043793497400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((23859475368263646098316398113043793497400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((23859475368263646098316398113043793497400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 4. -/
theorem ep_Q2_008_partial_04_0066_valid :
    mulPoly ep_Q2_008_coefficient_04_0066
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0067 : Poly :=
[
  term ((95280931420920000 : Rat) / 692956453614176359) [(4, 1), (11, 2), (16, 1)]
]

/-- Partial product 67 for generator 4. -/
def ep_Q2_008_partial_04_0067 : Poly :=
[
  term ((95280931420920000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (11, 2), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (11, 2), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(4, 1), (10, 2), (11, 2), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(4, 1), (11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 4. -/
theorem ep_Q2_008_partial_04_0067_valid :
    mulPoly ep_Q2_008_coefficient_04_0067
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0068 : Poly :=
[
  term ((46159879862899259818870757373387368281575 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 4. -/
def ep_Q2_008_partial_04_0068 : Poly :=
[
  term ((46159879862899259818870757373387368281575 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((46159879862899259818870757373387368281575 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-46159879862899259818870757373387368281575 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-46159879862899259818870757373387368281575 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 4. -/
theorem ep_Q2_008_partial_04_0068_valid :
    mulPoly ep_Q2_008_coefficient_04_0068
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0069 : Poly :=
[
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 69 for generator 4. -/
def ep_Q2_008_partial_04_0069 : Poly :=
[
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 2), (13, 2), (15, 2), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 4. -/
theorem ep_Q2_008_partial_04_0069_valid :
    mulPoly ep_Q2_008_coefficient_04_0069
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0070 : Poly :=
[
  term ((6238639034625375 : Rat) / 23895050124626771) [(4, 1), (13, 2), (16, 1)]
]

/-- Partial product 70 for generator 4. -/
def ep_Q2_008_partial_04_0070 : Poly :=
[
  term ((6238639034625375 : Rat) / 23895050124626771) [(2, 2), (4, 1), (13, 2), (16, 1)],
  term ((6238639034625375 : Rat) / 23895050124626771) [(3, 2), (4, 1), (13, 2), (16, 1)],
  term ((-6238639034625375 : Rat) / 23895050124626771) [(4, 1), (10, 2), (13, 2), (16, 1)],
  term ((-6238639034625375 : Rat) / 23895050124626771) [(4, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 4. -/
theorem ep_Q2_008_partial_04_0070_valid :
    mulPoly ep_Q2_008_coefficient_04_0070
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0071 : Poly :=
[
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 4. -/
def ep_Q2_008_partial_04_0071 : Poly :=
[
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 2), (13, 3), (15, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 4. -/
theorem ep_Q2_008_partial_04_0071_valid :
    mulPoly ep_Q2_008_coefficient_04_0071
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0072 : Poly :=
[
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 72 for generator 4. -/
def ep_Q2_008_partial_04_0072 : Poly :=
[
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (10, 2), (15, 2), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 4. -/
theorem ep_Q2_008_partial_04_0072_valid :
    mulPoly ep_Q2_008_coefficient_04_0072
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0073 : Poly :=
[
  term ((12583541156078964483 : Rat) / 5543651628913410872) [(4, 1), (16, 1)]
]

/-- Partial product 73 for generator 4. -/
def ep_Q2_008_partial_04_0073 : Poly :=
[
  term ((12583541156078964483 : Rat) / 5543651628913410872) [(2, 2), (4, 1), (16, 1)],
  term ((12583541156078964483 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (16, 1)],
  term ((-12583541156078964483 : Rat) / 5543651628913410872) [(4, 1), (10, 2), (16, 1)],
  term ((-12583541156078964483 : Rat) / 5543651628913410872) [(4, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 4. -/
theorem ep_Q2_008_partial_04_0073_valid :
    mulPoly ep_Q2_008_coefficient_04_0073
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0074 : Poly :=
[
  term ((-3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 74 for generator 4. -/
def ep_Q2_008_partial_04_0074 : Poly :=
[
  term ((-3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 4. -/
theorem ep_Q2_008_partial_04_0074_valid :
    mulPoly ep_Q2_008_coefficient_04_0074
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0075 : Poly :=
[
  term ((-692576845212253500 : Rat) / 692956453614176359) [(4, 2), (16, 1)]
]

/-- Partial product 75 for generator 4. -/
def ep_Q2_008_partial_04_0075 : Poly :=
[
  term ((-692576845212253500 : Rat) / 692956453614176359) [(2, 2), (4, 2), (16, 1)],
  term ((-692576845212253500 : Rat) / 692956453614176359) [(3, 2), (4, 2), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 2), (10, 2), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 4. -/
theorem ep_Q2_008_partial_04_0075_valid :
    mulPoly ep_Q2_008_coefficient_04_0075
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0076 : Poly :=
[
  term ((-11910116427615000 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 76 for generator 4. -/
def ep_Q2_008_partial_04_0076 : Poly :=
[
  term ((-11910116427615000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-11910116427615000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((11910116427615000 : Rat) / 692956453614176359) [(5, 1), (6, 1), (10, 2), (11, 1), (16, 1)],
  term ((11910116427615000 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 4. -/
theorem ep_Q2_008_partial_04_0076_valid :
    mulPoly ep_Q2_008_coefficient_04_0076
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0077 : Poly :=
[
  term ((199241833525243875 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 77 for generator 4. -/
def ep_Q2_008_partial_04_0077 : Poly :=
[
  term ((199241833525243875 : Rat) / 1385912907228352718) [(2, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((199241833525243875 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 4. -/
theorem ep_Q2_008_partial_04_0077_valid :
    mulPoly ep_Q2_008_coefficient_04_0077
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0078 : Poly :=
[
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 4. -/
def ep_Q2_008_partial_04_0078 : Poly :=
[
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 4. -/
theorem ep_Q2_008_partial_04_0078_valid :
    mulPoly ep_Q2_008_coefficient_04_0078
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0079 : Poly :=
[
  term ((-10643590132327670684291519070096197474400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 4. -/
def ep_Q2_008_partial_04_0079 : Poly :=
[
  term ((-10643590132327670684291519070096197474400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-10643590132327670684291519070096197474400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((10643590132327670684291519070096197474400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((10643590132327670684291519070096197474400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 4. -/
theorem ep_Q2_008_partial_04_0079_valid :
    mulPoly ep_Q2_008_coefficient_04_0079
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0080 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 80 for generator 4. -/
def ep_Q2_008_partial_04_0080 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 4. -/
theorem ep_Q2_008_partial_04_0080_valid :
    mulPoly ep_Q2_008_coefficient_04_0080
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0081 : Poly :=
[
  term ((37714816138910486320246469920115502556503 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 4. -/
def ep_Q2_008_partial_04_0081 : Poly :=
[
  term ((37714816138910486320246469920115502556503 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((37714816138910486320246469920115502556503 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37714816138910486320246469920115502556503 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-37714816138910486320246469920115502556503 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 4. -/
theorem ep_Q2_008_partial_04_0081_valid :
    mulPoly ep_Q2_008_coefficient_04_0081
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0082 : Poly :=
[
  term ((3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 82 for generator 4. -/
def ep_Q2_008_partial_04_0082 : Poly :=
[
  term ((3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 2), (13, 2), (15, 2), (16, 1)],
  term ((-3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 4. -/
theorem ep_Q2_008_partial_04_0082_valid :
    mulPoly ep_Q2_008_coefficient_04_0082
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0083 : Poly :=
[
  term ((-2365851673277656875 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 83 for generator 4. -/
def ep_Q2_008_partial_04_0083 : Poly :=
[
  term ((-2365851673277656875 : Rat) / 1385912907228352718) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((-2365851673277656875 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((2365851673277656875 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (10, 2), (16, 1)],
  term ((2365851673277656875 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 4. -/
theorem ep_Q2_008_partial_04_0083_valid :
    mulPoly ep_Q2_008_coefficient_04_0083
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0084 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 84 for generator 4. -/
def ep_Q2_008_partial_04_0084 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 4. -/
theorem ep_Q2_008_partial_04_0084_valid :
    mulPoly ep_Q2_008_coefficient_04_0084
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0085 : Poly :=
[
  term ((-95280931420920000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 85 for generator 4. -/
def ep_Q2_008_partial_04_0085 : Poly :=
[
  term ((-95280931420920000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 3), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(5, 1), (10, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 4. -/
theorem ep_Q2_008_partial_04_0085_valid :
    mulPoly ep_Q2_008_coefficient_04_0085
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0086 : Poly :=
[
  term ((-199241833525243875 : Rat) / 1385912907228352718) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 86 for generator 4. -/
def ep_Q2_008_partial_04_0086 : Poly :=
[
  term ((-199241833525243875 : Rat) / 1385912907228352718) [(2, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((199241833525243875 : Rat) / 1385912907228352718) [(5, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((199241833525243875 : Rat) / 1385912907228352718) [(5, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 4. -/
theorem ep_Q2_008_partial_04_0086_valid :
    mulPoly ep_Q2_008_coefficient_04_0086
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0087 : Poly :=
[
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 4. -/
def ep_Q2_008_partial_04_0087 : Poly :=
[
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 4. -/
theorem ep_Q2_008_partial_04_0087_valid :
    mulPoly ep_Q2_008_coefficient_04_0087
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0088 : Poly :=
[
  term ((23859475368263646098316398113043793497400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 4. -/
def ep_Q2_008_partial_04_0088 : Poly :=
[
  term ((23859475368263646098316398113043793497400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((23859475368263646098316398113043793497400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-23859475368263646098316398113043793497400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-23859475368263646098316398113043793497400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 4. -/
theorem ep_Q2_008_partial_04_0088_valid :
    mulPoly ep_Q2_008_coefficient_04_0088
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0089 : Poly :=
[
  term ((-23820232855230000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 89 for generator 4. -/
def ep_Q2_008_partial_04_0089 : Poly :=
[
  term ((-23820232855230000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-23820232855230000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(5, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(5, 1), (11, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 4. -/
theorem ep_Q2_008_partial_04_0089_valid :
    mulPoly ep_Q2_008_coefficient_04_0089
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0090 : Poly :=
[
  term ((1031401907174659500 : Rat) / 692956453614176359) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 90 for generator 4. -/
def ep_Q2_008_partial_04_0090 : Poly :=
[
  term ((1031401907174659500 : Rat) / 692956453614176359) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1031401907174659500 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(5, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 4. -/
theorem ep_Q2_008_partial_04_0090_valid :
    mulPoly ep_Q2_008_coefficient_04_0090
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0091 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 91 for generator 4. -/
def ep_Q2_008_partial_04_0091 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 4. -/
theorem ep_Q2_008_partial_04_0091_valid :
    mulPoly ep_Q2_008_coefficient_04_0091
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0092 : Poly :=
[
  term ((11680568176427951733 : Rat) / 2771825814456705436) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 92 for generator 4. -/
def ep_Q2_008_partial_04_0092 : Poly :=
[
  term ((11680568176427951733 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((11680568176427951733 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-11680568176427951733 : Rat) / 2771825814456705436) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-11680568176427951733 : Rat) / 2771825814456705436) [(5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 4. -/
theorem ep_Q2_008_partial_04_0092_valid :
    mulPoly ep_Q2_008_coefficient_04_0092
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0093 : Poly :=
[
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 93 for generator 4. -/
def ep_Q2_008_partial_04_0093 : Poly :=
[
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 4. -/
theorem ep_Q2_008_partial_04_0093_valid :
    mulPoly ep_Q2_008_coefficient_04_0093
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0094 : Poly :=
[
  term ((-5201065597248128112 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 94 for generator 4. -/
def ep_Q2_008_partial_04_0094 : Poly :=
[
  term ((-5201065597248128112 : Rat) / 692956453614176359) [(2, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5201065597248128112 : Rat) / 692956453614176359) [(3, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((5201065597248128112 : Rat) / 692956453614176359) [(5, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((5201065597248128112 : Rat) / 692956453614176359) [(5, 1), (11, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 4. -/
theorem ep_Q2_008_partial_04_0094_valid :
    mulPoly ep_Q2_008_coefficient_04_0094
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0095 : Poly :=
[
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 4. -/
def ep_Q2_008_partial_04_0095 : Poly :=
[
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 4. -/
theorem ep_Q2_008_partial_04_0095_valid :
    mulPoly ep_Q2_008_coefficient_04_0095
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0096 : Poly :=
[
  term ((10705546255533894149481371457057731079375 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 96 for generator 4. -/
def ep_Q2_008_partial_04_0096 : Poly :=
[
  term ((10705546255533894149481371457057731079375 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((10705546255533894149481371457057731079375 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10705546255533894149481371457057731079375 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-10705546255533894149481371457057731079375 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 4. -/
theorem ep_Q2_008_partial_04_0096_valid :
    mulPoly ep_Q2_008_coefficient_04_0096
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0097 : Poly :=
[
  term ((67907457316262153643943569222281059969200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 97 for generator 4. -/
def ep_Q2_008_partial_04_0097 : Poly :=
[
  term ((67907457316262153643943569222281059969200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((67907457316262153643943569222281059969200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-67907457316262153643943569222281059969200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-67907457316262153643943569222281059969200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 4. -/
theorem ep_Q2_008_partial_04_0097_valid :
    mulPoly ep_Q2_008_coefficient_04_0097
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0098 : Poly :=
[
  term ((5582279361602808987 : Rat) / 692956453614176359) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 98 for generator 4. -/
def ep_Q2_008_partial_04_0098 : Poly :=
[
  term ((5582279361602808987 : Rat) / 692956453614176359) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((5582279361602808987 : Rat) / 692956453614176359) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-5582279361602808987 : Rat) / 692956453614176359) [(5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-5582279361602808987 : Rat) / 692956453614176359) [(5, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 4. -/
theorem ep_Q2_008_partial_04_0098_valid :
    mulPoly ep_Q2_008_coefficient_04_0098
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0099 : Poly :=
[
  term ((1309057482486834014511518631105489557551014 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 99 for generator 4. -/
def ep_Q2_008_partial_04_0099 : Poly :=
[
  term ((1309057482486834014511518631105489557551014 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((1309057482486834014511518631105489557551014 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1309057482486834014511518631105489557551014 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1309057482486834014511518631105489557551014 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 4. -/
theorem ep_Q2_008_partial_04_0099_valid :
    mulPoly ep_Q2_008_coefficient_04_0099
        ep_Q2_008_generator_04_0000_0099 =
      ep_Q2_008_partial_04_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_04_0000_0099 : List Poly :=
[
  ep_Q2_008_partial_04_0000,
  ep_Q2_008_partial_04_0001,
  ep_Q2_008_partial_04_0002,
  ep_Q2_008_partial_04_0003,
  ep_Q2_008_partial_04_0004,
  ep_Q2_008_partial_04_0005,
  ep_Q2_008_partial_04_0006,
  ep_Q2_008_partial_04_0007,
  ep_Q2_008_partial_04_0008,
  ep_Q2_008_partial_04_0009,
  ep_Q2_008_partial_04_0010,
  ep_Q2_008_partial_04_0011,
  ep_Q2_008_partial_04_0012,
  ep_Q2_008_partial_04_0013,
  ep_Q2_008_partial_04_0014,
  ep_Q2_008_partial_04_0015,
  ep_Q2_008_partial_04_0016,
  ep_Q2_008_partial_04_0017,
  ep_Q2_008_partial_04_0018,
  ep_Q2_008_partial_04_0019,
  ep_Q2_008_partial_04_0020,
  ep_Q2_008_partial_04_0021,
  ep_Q2_008_partial_04_0022,
  ep_Q2_008_partial_04_0023,
  ep_Q2_008_partial_04_0024,
  ep_Q2_008_partial_04_0025,
  ep_Q2_008_partial_04_0026,
  ep_Q2_008_partial_04_0027,
  ep_Q2_008_partial_04_0028,
  ep_Q2_008_partial_04_0029,
  ep_Q2_008_partial_04_0030,
  ep_Q2_008_partial_04_0031,
  ep_Q2_008_partial_04_0032,
  ep_Q2_008_partial_04_0033,
  ep_Q2_008_partial_04_0034,
  ep_Q2_008_partial_04_0035,
  ep_Q2_008_partial_04_0036,
  ep_Q2_008_partial_04_0037,
  ep_Q2_008_partial_04_0038,
  ep_Q2_008_partial_04_0039,
  ep_Q2_008_partial_04_0040,
  ep_Q2_008_partial_04_0041,
  ep_Q2_008_partial_04_0042,
  ep_Q2_008_partial_04_0043,
  ep_Q2_008_partial_04_0044,
  ep_Q2_008_partial_04_0045,
  ep_Q2_008_partial_04_0046,
  ep_Q2_008_partial_04_0047,
  ep_Q2_008_partial_04_0048,
  ep_Q2_008_partial_04_0049,
  ep_Q2_008_partial_04_0050,
  ep_Q2_008_partial_04_0051,
  ep_Q2_008_partial_04_0052,
  ep_Q2_008_partial_04_0053,
  ep_Q2_008_partial_04_0054,
  ep_Q2_008_partial_04_0055,
  ep_Q2_008_partial_04_0056,
  ep_Q2_008_partial_04_0057,
  ep_Q2_008_partial_04_0058,
  ep_Q2_008_partial_04_0059,
  ep_Q2_008_partial_04_0060,
  ep_Q2_008_partial_04_0061,
  ep_Q2_008_partial_04_0062,
  ep_Q2_008_partial_04_0063,
  ep_Q2_008_partial_04_0064,
  ep_Q2_008_partial_04_0065,
  ep_Q2_008_partial_04_0066,
  ep_Q2_008_partial_04_0067,
  ep_Q2_008_partial_04_0068,
  ep_Q2_008_partial_04_0069,
  ep_Q2_008_partial_04_0070,
  ep_Q2_008_partial_04_0071,
  ep_Q2_008_partial_04_0072,
  ep_Q2_008_partial_04_0073,
  ep_Q2_008_partial_04_0074,
  ep_Q2_008_partial_04_0075,
  ep_Q2_008_partial_04_0076,
  ep_Q2_008_partial_04_0077,
  ep_Q2_008_partial_04_0078,
  ep_Q2_008_partial_04_0079,
  ep_Q2_008_partial_04_0080,
  ep_Q2_008_partial_04_0081,
  ep_Q2_008_partial_04_0082,
  ep_Q2_008_partial_04_0083,
  ep_Q2_008_partial_04_0084,
  ep_Q2_008_partial_04_0085,
  ep_Q2_008_partial_04_0086,
  ep_Q2_008_partial_04_0087,
  ep_Q2_008_partial_04_0088,
  ep_Q2_008_partial_04_0089,
  ep_Q2_008_partial_04_0090,
  ep_Q2_008_partial_04_0091,
  ep_Q2_008_partial_04_0092,
  ep_Q2_008_partial_04_0093,
  ep_Q2_008_partial_04_0094,
  ep_Q2_008_partial_04_0095,
  ep_Q2_008_partial_04_0096,
  ep_Q2_008_partial_04_0097,
  ep_Q2_008_partial_04_0098,
  ep_Q2_008_partial_04_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_04_0000_0099 : Poly :=
[
  term ((160786571772802500 : Rat) / 692956453614176359) [(0, 1), (2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-25038660808027332193634360516732089864500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(0, 1), (2, 2), (6, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (2, 2), (7, 1), (13, 1), (16, 1)],
  term ((39086433493068362523020532831011537838600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-257258514836484000 : Rat) / 692956453614176359) [(0, 1), (2, 2), (10, 1), (16, 1)],
  term ((747955311654222000 : Rat) / 692956453614176359) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3719915033536521311186866396402824981300 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-131011280703765000 : Rat) / 692956453614176359) [(0, 1), (2, 2), (11, 2), (16, 1)],
  term ((-16768314054960611887143539262127087116300 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(0, 1), (2, 2), (13, 2), (16, 1)],
  term ((9469059765741736983 : Rat) / 5543651628913410872) [(0, 1), (2, 2), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(0, 1), (3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-25038660808027332193634360516732089864500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(0, 1), (3, 2), (6, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((39086433493068362523020532831011537838600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-257258514836484000 : Rat) / 692956453614176359) [(0, 1), (3, 2), (10, 1), (16, 1)],
  term ((747955311654222000 : Rat) / 692956453614176359) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3719915033536521311186866396402824981300 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-131011280703765000 : Rat) / 692956453614176359) [(0, 1), (3, 2), (11, 2), (16, 1)],
  term ((-16768314054960611887143539262127087116300 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(0, 1), (3, 2), (13, 2), (16, 1)],
  term ((9469059765741736983 : Rat) / 5543651628913410872) [(0, 1), (3, 2), (16, 1)],
  term ((-160786571772802500 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 2), (11, 1), (16, 1)],
  term ((25038660808027332193634360516732089864500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((25038660808027332193634360516732089864500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-160786571772802500 : Rat) / 692956453614176359) [(0, 1), (5, 1), (11, 3), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(0, 1), (6, 1), (10, 2), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-39086433493068362523020532831011537838600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-39086433493068362523020532831011537838600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 3), (16, 1)],
  term ((257258514836484000 : Rat) / 692956453614176359) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((-747955311654222000 : Rat) / 692956453614176359) [(0, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((3719915033536521311186866396402824981300 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((131011280703765000 : Rat) / 692956453614176359) [(0, 1), (10, 2), (11, 2), (16, 1)],
  term ((16768314054960611887143539262127087116300 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(0, 1), (10, 2), (13, 2), (16, 1)],
  term ((-9469059765741736983 : Rat) / 5543651628913410872) [(0, 1), (10, 2), (16, 1)],
  term ((257258514836484000 : Rat) / 692956453614176359) [(0, 1), (10, 3), (16, 1)],
  term ((16768314054960611887143539262127087116300 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (13, 2), (16, 1)],
  term ((-9469059765741736983 : Rat) / 5543651628913410872) [(0, 1), (11, 2), (16, 1)],
  term ((-747955311654222000 : Rat) / 692956453614176359) [(0, 1), (11, 3), (13, 1), (16, 1)],
  term ((3719915033536521311186866396402824981300 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((131011280703765000 : Rat) / 692956453614176359) [(0, 1), (11, 4), (16, 1)],
  term ((-160786571772802500 : Rat) / 692956453614176359) [(1, 1), (2, 2), (4, 1), (11, 1), (16, 1)],
  term ((25038660808027332193634360516732089864500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((-11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (11, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (13, 1), (16, 1)],
  term ((-39086433493068362523020532831011537838600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((131011280703765000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (10, 1), (11, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((3719915033536521311186866396402824981300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (11, 1), (12, 1), (16, 1)],
  term ((-203662990912216500 : Rat) / 692956453614176359) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (12, 1), (13, 1), (16, 1)],
  term ((16768314054960611887143539262127087116300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((83743107255942419034103088611666944000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-160786571772802500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (4, 1), (11, 1), (16, 1)],
  term ((25038660808027332193634360516732089864500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((-11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (11, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (13, 1), (16, 1)],
  term ((-39086433493068362523020532831011537838600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((131011280703765000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (10, 1), (11, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((3719915033536521311186866396402824981300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((-203662990912216500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((16768314054960611887143539262127087116300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((83743107255942419034103088611666944000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 2), (11, 1), (16, 1)],
  term ((-25038660808027332193634360516732089864500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (10, 2), (15, 1), (16, 1)],
  term ((-25038660808027332193634360516732089864500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 3), (16, 1)],
  term ((11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (10, 2), (16, 1)],
  term ((11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 2), (11, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((39086433493068362523020532831011537838600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 2), (13, 1), (16, 1)],
  term ((39086433493068362523020532831011537838600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 3), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-3719915033536521311186866396402824981300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-131011280703765000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 3), (16, 1)],
  term ((-23820232855230000 : Rat) / 692956453614176359) [(1, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((203662990912216500 : Rat) / 692956453614176359) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-16768314054960611887143539262127087116300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-83743107255942419034103088611666944000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-131011280703765000 : Rat) / 692956453614176359) [(1, 1), (10, 3), (11, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (10, 3), (13, 1), (16, 1)],
  term ((-3719915033536521311186866396402824981300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 3), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-16768314054960611887143539262127087116300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-83743107255942419034103088611666944000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-23820232855230000 : Rat) / 692956453614176359) [(1, 1), (11, 3), (12, 1), (16, 1)],
  term ((203662990912216500 : Rat) / 692956453614176359) [(1, 1), (11, 3), (16, 1)],
  term ((-77415756779497500 : Rat) / 692956453614176359) [(2, 2), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((244293712003370549631544627149109440000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((4445152409672299125 : Rat) / 1385912907228352718) [(2, 2), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-282490367997479199819108683876281612800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-50520893495468214211857875336424483244275 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((65505640351882500 : Rat) / 692956453614176359) [(2, 2), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-89574361067902534864899696621340128000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1344309255493660125 : Rat) / 1385912907228352718) [(2, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((11731350826100487515654405226480972413175 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((8932587320711250 : Rat) / 692956453614176359) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((590855012505316125 : Rat) / 692956453614176359) [(2, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-27531816602288522072571425264257936942875 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((61073428000842637407886156787277360000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1167969048869801250 : Rat) / 692956453614176359) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((782281019069942399499070201503549081600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((146136185653143702802592564144982933848325 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-692576845212253500 : Rat) / 692956453614176359) [(2, 2), (4, 1), (6, 1), (16, 1)],
  term ((11910116427615000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-33544681786106127 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((292487975299185726763880141278367433600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((10643590132327670684291519070096197474400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((519432633909190125 : Rat) / 692956453614176359) [(2, 2), (4, 1), (10, 1), (16, 1)],
  term ((1183003274989443375 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((2620606629610106333514019741360892313600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-23859475368263646098316398113043793497400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (11, 2), (16, 1)],
  term ((46159879862899259818870757373387368281575 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((6238639034625375 : Rat) / 23895050124626771) [(2, 2), (4, 1), (13, 2), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((12583541156078964483 : Rat) / 5543651628913410872) [(2, 2), (4, 1), (16, 1)],
  term ((-3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-692576845212253500 : Rat) / 692956453614176359) [(2, 2), (4, 2), (16, 1)],
  term ((-11910116427615000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((199241833525243875 : Rat) / 1385912907228352718) [(2, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10643590132327670684291519070096197474400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((37714816138910486320246469920115502556503 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2365851673277656875 : Rat) / 1385912907228352718) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 1385912907228352718) [(2, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((23859475368263646098316398113043793497400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-23820232855230000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((1031401907174659500 : Rat) / 692956453614176359) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((11680568176427951733 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5201065597248128112 : Rat) / 692956453614176359) [(2, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((10705546255533894149481371457057731079375 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((67907457316262153643943569222281059969200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((5582279361602808987 : Rat) / 692956453614176359) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((1309057482486834014511518631105489557551014 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((77415756779497500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 2), (11, 1), (16, 1)],
  term ((-244293712003370549631544627149109440000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4445152409672299125 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (10, 2), (13, 1), (16, 1)],
  term ((282490367997479199819108683876281612800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((50520893495468214211857875336424483244275 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 2), (15, 1), (16, 1)],
  term ((-244293712003370549631544627149109440000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4445152409672299125 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (11, 2), (13, 1), (16, 1)],
  term ((282490367997479199819108683876281612800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((50520893495468214211857875336424483244275 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((77415756779497500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 3), (16, 1)],
  term ((-65505640351882500 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 2), (11, 1), (16, 1)],
  term ((89574361067902534864899696621340128000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((1344309255493660125 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-11731350826100487515654405226480972413175 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((89574361067902534864899696621340128000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((1344309255493660125 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (11, 2), (13, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-11731350826100487515654405226480972413175 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-65505640351882500 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 3), (16, 1)],
  term ((-8932587320711250 : Rat) / 692956453614176359) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-590855012505316125 : Rat) / 692956453614176359) [(3, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((27531816602288522072571425264257936942875 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-61073428000842637407886156787277360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((1167969048869801250 : Rat) / 692956453614176359) [(3, 1), (10, 2), (13, 1), (16, 1)],
  term ((-782281019069942399499070201503549081600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-146136185653143702802592564144982933848325 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-590855012505316125 : Rat) / 692956453614176359) [(3, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((27531816602288522072571425264257936942875 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-61073428000842637407886156787277360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((1167969048869801250 : Rat) / 692956453614176359) [(3, 1), (11, 2), (13, 1), (16, 1)],
  term ((-782281019069942399499070201503549081600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-146136185653143702802592564144982933848325 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-8932587320711250 : Rat) / 692956453614176359) [(3, 1), (11, 3), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-692576845212253500 : Rat) / 692956453614176359) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((11910116427615000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-33544681786106127 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((292487975299185726763880141278367433600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((10643590132327670684291519070096197474400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((519432633909190125 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (16, 1)],
  term ((1183003274989443375 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((2620606629610106333514019741360892313600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-23859475368263646098316398113043793497400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (11, 2), (16, 1)],
  term ((46159879862899259818870757373387368281575 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((6238639034625375 : Rat) / 23895050124626771) [(3, 2), (4, 1), (13, 2), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((12583541156078964483 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (16, 1)],
  term ((-3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-692576845212253500 : Rat) / 692956453614176359) [(3, 2), (4, 2), (16, 1)],
  term ((-11910116427615000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((199241833525243875 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10643590132327670684291519070096197474400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((37714816138910486320246469920115502556503 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2365851673277656875 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((23859475368263646098316398113043793497400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-23820232855230000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((1031401907174659500 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((11680568176427951733 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5201065597248128112 : Rat) / 692956453614176359) [(3, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((10705546255533894149481371457057731079375 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((67907457316262153643943569222281059969200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((5582279361602808987 : Rat) / 692956453614176359) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((1309057482486834014511518631105489557551014 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-77415756779497500 : Rat) / 692956453614176359) [(3, 3), (4, 1), (11, 1), (16, 1)],
  term ((244293712003370549631544627149109440000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((4445152409672299125 : Rat) / 1385912907228352718) [(3, 3), (4, 1), (13, 1), (16, 1)],
  term ((-282490367997479199819108683876281612800 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-50520893495468214211857875336424483244275 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (4, 1), (15, 1), (16, 1)],
  term ((65505640351882500 : Rat) / 692956453614176359) [(3, 3), (6, 1), (11, 1), (16, 1)],
  term ((-89574361067902534864899696621340128000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1344309255493660125 : Rat) / 1385912907228352718) [(3, 3), (6, 1), (13, 1), (16, 1)],
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((11731350826100487515654405226480972413175 : Rat) / 168707601851329515375740828258983054697998) [(3, 3), (6, 1), (15, 1), (16, 1)],
  term ((8932587320711250 : Rat) / 692956453614176359) [(3, 3), (11, 1), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((590855012505316125 : Rat) / 692956453614176359) [(3, 3), (12, 1), (13, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-27531816602288522072571425264257936942875 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (12, 1), (15, 1), (16, 1)],
  term ((61073428000842637407886156787277360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (13, 1), (15, 2), (16, 1)],
  term ((-1167969048869801250 : Rat) / 692956453614176359) [(3, 3), (13, 1), (16, 1)],
  term ((782281019069942399499070201503549081600 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (13, 2), (15, 1), (16, 1)],
  term ((146136185653143702802592564144982933848325 : Rat) / 337415203702659030751481656517966109395996) [(3, 3), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 2), (13, 1), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 2), (16, 1)],
  term ((3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((-11910116427615000 : Rat) / 692956453614176359) [(4, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((33544681786106127 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-292487975299185726763880141278367433600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-10643590132327670684291519070096197474400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((33544681786106127 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-292487975299185726763880141278367433600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-10643590132327670684291519070096197474400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-11910116427615000 : Rat) / 692956453614176359) [(4, 1), (7, 1), (11, 3), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 3), (16, 1)],
  term ((-2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-519432633909190125 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 2), (16, 1)],
  term ((-1183003274989443375 : Rat) / 1385912907228352718) [(4, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2620606629610106333514019741360892313600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((23859475368263646098316398113043793497400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(4, 1), (10, 2), (11, 2), (16, 1)],
  term ((-46159879862899259818870757373387368281575 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 2), (13, 2), (15, 2), (16, 1)],
  term ((-6238639034625375 : Rat) / 23895050124626771) [(4, 1), (10, 2), (13, 2), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 2), (13, 3), (15, 1), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (10, 2), (15, 2), (16, 1)],
  term ((-12583541156078964483 : Rat) / 5543651628913410872) [(4, 1), (10, 2), (16, 1)],
  term ((-2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 3), (13, 1), (15, 1), (16, 1)],
  term ((-519432633909190125 : Rat) / 692956453614176359) [(4, 1), (10, 3), (16, 1)],
  term ((-46159879862899259818870757373387368281575 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-6238639034625375 : Rat) / 23895050124626771) [(4, 1), (11, 2), (13, 2), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (15, 2), (16, 1)],
  term ((-12583541156078964483 : Rat) / 5543651628913410872) [(4, 1), (11, 2), (16, 1)],
  term ((-1183003274989443375 : Rat) / 1385912907228352718) [(4, 1), (11, 3), (13, 1), (16, 1)],
  term ((-2620606629610106333514019741360892313600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 3), (13, 2), (15, 1), (16, 1)],
  term ((23859475368263646098316398113043793497400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 3), (15, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(4, 1), (11, 4), (16, 1)],
  term ((3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 2), (10, 2), (16, 1)],
  term ((3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 2), (11, 2), (16, 1)],
  term ((11910116427615000 : Rat) / 692956453614176359) [(5, 1), (6, 1), (10, 2), (11, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((10643590132327670684291519070096197474400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (11, 2), (13, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((10643590132327670684291519070096197474400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((11910116427615000 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 3), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37714816138910486320246469920115502556503 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 2), (13, 2), (15, 2), (16, 1)],
  term ((2365851673277656875 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (10, 2), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37714816138910486320246469920115502556503 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((2365851673277656875 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((199241833525243875 : Rat) / 1385912907228352718) [(5, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-23859475368263646098316398113043793497400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 3), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(5, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-11680568176427951733 : Rat) / 2771825814456705436) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5201065597248128112 : Rat) / 692956453614176359) [(5, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10705546255533894149481371457057731079375 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-67907457316262153643943569222281059969200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-5582279361602808987 : Rat) / 692956453614176359) [(5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-1309057482486834014511518631105489557551014 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(5, 1), (10, 3), (11, 1), (16, 1)],
  term ((199241833525243875 : Rat) / 1385912907228352718) [(5, 1), (10, 3), (13, 1), (16, 1)],
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 3), (13, 2), (15, 1), (16, 1)],
  term ((-23859475368263646098316398113043793497400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 3), (15, 1), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5201065597248128112 : Rat) / 692956453614176359) [(5, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10705546255533894149481371457057731079375 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-67907457316262153643943569222281059969200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-5582279361602808987 : Rat) / 692956453614176359) [(5, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1309057482486834014511518631105489557551014 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(5, 1), (11, 3), (12, 1), (16, 1)],
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(5, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 3), (13, 2), (15, 2), (16, 1)],
  term ((-11680568176427951733 : Rat) / 2771825814456705436) [(5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 0 through 99. -/
theorem ep_Q2_008_block_04_0000_0099_valid :
    checkProductSumEq ep_Q2_008_partials_04_0000_0099
      ep_Q2_008_block_04_0000_0099 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
