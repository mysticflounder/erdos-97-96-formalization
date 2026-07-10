/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 13:0-96

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 13 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_13_0000_0096 : Poly :=
[
  term (2 : Rat) [(4, 1), (8, 1)],
  term (2 : Rat) [(5, 1), (9, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0000 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 13. -/
def ep_Q2_008_partial_13_0000 : Poly :=
[
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (8, 2), (11, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 13. -/
theorem ep_Q2_008_partial_13_0000_valid :
    mulPoly ep_Q2_008_coefficient_13_0000
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0001 : Poly :=
[
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 13. -/
def ep_Q2_008_partial_13_0001 : Poly :=
[
  term ((3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (8, 2), (13, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 13. -/
theorem ep_Q2_008_partial_13_0001_valid :
    mulPoly ep_Q2_008_coefficient_13_0001
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0002 : Poly :=
[
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 13. -/
def ep_Q2_008_partial_13_0002 : Poly :=
[
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (8, 2), (15, 1), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 13. -/
theorem ep_Q2_008_partial_13_0002_valid :
    mulPoly ep_Q2_008_coefficient_13_0002
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0003 : Poly :=
[
  term ((-697104784725142298986587872767389696000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 13. -/
def ep_Q2_008_partial_13_0003 : Poly :=
[
  term ((-1394209569450284597973175745534779392000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1394209569450284597973175745534779392000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((697104784725142298986587872767389696000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((697104784725142298986587872767389696000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 13. -/
theorem ep_Q2_008_partial_13_0003_valid :
    mulPoly ep_Q2_008_coefficient_13_0003
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0004 : Poly :=
[
  term ((12113105612672266983 : Rat) / 5543651628913410872) [(0, 1), (16, 1)]
]

/-- Partial product 4 for generator 13. -/
def ep_Q2_008_partial_13_0004 : Poly :=
[
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(0, 1), (4, 1), (8, 1), (16, 1)],
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (9, 1), (16, 1)],
  term ((-12113105612672266983 : Rat) / 5543651628913410872) [(0, 1), (8, 2), (16, 1)],
  term ((-12113105612672266983 : Rat) / 5543651628913410872) [(0, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 13. -/
theorem ep_Q2_008_partial_13_0004_valid :
    mulPoly ep_Q2_008_coefficient_13_0004
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0005 : Poly :=
[
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 13. -/
def ep_Q2_008_partial_13_0005 : Poly :=
[
  term ((95280931420920000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 13. -/
theorem ep_Q2_008_partial_13_0005_valid :
    mulPoly ep_Q2_008_coefficient_13_0005
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0006 : Poly :=
[
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 13. -/
def ep_Q2_008_partial_13_0006 : Poly :=
[
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 13. -/
theorem ep_Q2_008_partial_13_0006_valid :
    mulPoly ep_Q2_008_coefficient_13_0006
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0007 : Poly :=
[
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 13. -/
def ep_Q2_008_partial_13_0007 : Poly :=
[
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 13. -/
theorem ep_Q2_008_partial_13_0007_valid :
    mulPoly ep_Q2_008_coefficient_13_0007
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0008 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 13. -/
def ep_Q2_008_partial_13_0008 : Poly :=
[
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 13. -/
theorem ep_Q2_008_partial_13_0008_valid :
    mulPoly ep_Q2_008_coefficient_13_0008
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0009 : Poly :=
[
  term ((-160786571772802500 : Rat) / 692956453614176359) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 9 for generator 13. -/
def ep_Q2_008_partial_13_0009 : Poly :=
[
  term ((-321573143545605000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((-321573143545605000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(1, 1), (8, 2), (11, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(1, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 13. -/
theorem ep_Q2_008_partial_13_0009_valid :
    mulPoly ep_Q2_008_coefficient_13_0009
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0010 : Poly :=
[
  term ((162959560065617680282578983244324864000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 13. -/
def ep_Q2_008_partial_13_0010 : Poly :=
[
  term ((325919120131235360565157966488649728000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((325919120131235360565157966488649728000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-162959560065617680282578983244324864000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-162959560065617680282578983244324864000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 13. -/
theorem ep_Q2_008_partial_13_0010_valid :
    mulPoly ep_Q2_008_coefficient_13_0010
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0011 : Poly :=
[
  term ((12884881157181718983 : Rat) / 2771825814456705436) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 11 for generator 13. -/
def ep_Q2_008_partial_13_0011 : Poly :=
[
  term ((12884881157181718983 : Rat) / 1385912907228352718) [(1, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((12884881157181718983 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-12884881157181718983 : Rat) / 2771825814456705436) [(1, 1), (8, 2), (13, 1), (16, 1)],
  term ((-12884881157181718983 : Rat) / 2771825814456705436) [(1, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 13. -/
theorem ep_Q2_008_partial_13_0011_valid :
    mulPoly ep_Q2_008_coefficient_13_0011
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0012 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 13. -/
def ep_Q2_008_partial_13_0012 : Poly :=
[
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 13. -/
theorem ep_Q2_008_partial_13_0012_valid :
    mulPoly ep_Q2_008_coefficient_13_0012
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0013 : Poly :=
[
  term ((-35481906679612871812185326003290508596500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 13. -/
def ep_Q2_008_partial_13_0013 : Poly :=
[
  term ((-70963813359225743624370652006581017193000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-70963813359225743624370652006581017193000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((35481906679612871812185326003290508596500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((35481906679612871812185326003290508596500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 13. -/
theorem ep_Q2_008_partial_13_0013_valid :
    mulPoly ep_Q2_008_coefficient_13_0013
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0014 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 13. -/
def ep_Q2_008_partial_13_0014 : Poly :=
[
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 13. -/
theorem ep_Q2_008_partial_13_0014_valid :
    mulPoly ep_Q2_008_coefficient_13_0014
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0015 : Poly :=
[
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (16, 1)]
]

/-- Partial product 15 for generator 13. -/
def ep_Q2_008_partial_13_0015 : Poly :=
[
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (4, 1), (8, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (8, 2), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 13. -/
theorem ep_Q2_008_partial_13_0015_valid :
    mulPoly ep_Q2_008_coefficient_13_0015
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0016 : Poly :=
[
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 13. -/
def ep_Q2_008_partial_13_0016 : Poly :=
[
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 13. -/
theorem ep_Q2_008_partial_13_0016_valid :
    mulPoly ep_Q2_008_coefficient_13_0016
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0017 : Poly :=
[
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 17 for generator 13. -/
def ep_Q2_008_partial_13_0017 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 13. -/
theorem ep_Q2_008_partial_13_0017_valid :
    mulPoly ep_Q2_008_coefficient_13_0017
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0018 : Poly :=
[
  term ((1804205182183737225 : Rat) / 1385912907228352718) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 18 for generator 13. -/
def ep_Q2_008_partial_13_0018 : Poly :=
[
  term ((1804205182183737225 : Rat) / 692956453614176359) [(3, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 692956453614176359) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 1385912907228352718) [(3, 1), (8, 2), (13, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 1385912907228352718) [(3, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 13. -/
theorem ep_Q2_008_partial_13_0018_valid :
    mulPoly ep_Q2_008_coefficient_13_0018
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0019 : Poly :=
[
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 13. -/
def ep_Q2_008_partial_13_0019 : Poly :=
[
  term ((174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 13. -/
theorem ep_Q2_008_partial_13_0019_valid :
    mulPoly ep_Q2_008_coefficient_13_0019
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0020 : Poly :=
[
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 13. -/
def ep_Q2_008_partial_13_0020 : Poly :=
[
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 13. -/
theorem ep_Q2_008_partial_13_0020_valid :
    mulPoly ep_Q2_008_coefficient_13_0020
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0021 : Poly :=
[
  term ((-43926043926967546635 : Rat) / 11087303257826821744) [(4, 1), (16, 1)]
]

/-- Partial product 21 for generator 13. -/
def ep_Q2_008_partial_13_0021 : Poly :=
[
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (9, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 11087303257826821744) [(4, 1), (8, 2), (16, 1)],
  term ((43926043926967546635 : Rat) / 11087303257826821744) [(4, 1), (9, 2), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(4, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 13. -/
theorem ep_Q2_008_partial_13_0021_valid :
    mulPoly ep_Q2_008_coefficient_13_0021
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0022 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 13. -/
def ep_Q2_008_partial_13_0022 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 13. -/
theorem ep_Q2_008_partial_13_0022_valid :
    mulPoly ep_Q2_008_coefficient_13_0022
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0023 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 23 for generator 13. -/
def ep_Q2_008_partial_13_0023 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 13. -/
theorem ep_Q2_008_partial_13_0023_valid :
    mulPoly ep_Q2_008_coefficient_13_0023
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0024 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 13. -/
def ep_Q2_008_partial_13_0024 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 13. -/
theorem ep_Q2_008_partial_13_0024_valid :
    mulPoly ep_Q2_008_coefficient_13_0024
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0025 : Poly :=
[
  term ((-15186100090106687022752136589670400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 13. -/
def ep_Q2_008_partial_13_0025 : Poly :=
[
  term ((-30372200180213374045504273179340800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((15186100090106687022752136589670400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((15186100090106687022752136589670400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-30372200180213374045504273179340800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 13. -/
theorem ep_Q2_008_partial_13_0025_valid :
    mulPoly ep_Q2_008_coefficient_13_0025
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0026 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 26 for generator 13. -/
def ep_Q2_008_partial_13_0026 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (13, 2), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 13. -/
theorem ep_Q2_008_partial_13_0026_valid :
    mulPoly ep_Q2_008_coefficient_13_0026
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0027 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 13. -/
def ep_Q2_008_partial_13_0027 : Poly :=
[
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 13. -/
theorem ep_Q2_008_partial_13_0027_valid :
    mulPoly ep_Q2_008_coefficient_13_0027
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0028 : Poly :=
[
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 28 for generator 13. -/
def ep_Q2_008_partial_13_0028 : Poly :=
[
  term ((43926043926967546635 : Rat) / 2771825814456705436) [(4, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(5, 1), (8, 2), (9, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(5, 1), (9, 3), (16, 1)],
  term ((43926043926967546635 : Rat) / 2771825814456705436) [(5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 13. -/
theorem ep_Q2_008_partial_13_0028_valid :
    mulPoly ep_Q2_008_coefficient_13_0028
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0029 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 29 for generator 13. -/
def ep_Q2_008_partial_13_0029 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 13. -/
theorem ep_Q2_008_partial_13_0029_valid :
    mulPoly ep_Q2_008_coefficient_13_0029
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0030 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 13. -/
def ep_Q2_008_partial_13_0030 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 13. -/
theorem ep_Q2_008_partial_13_0030_valid :
    mulPoly ep_Q2_008_coefficient_13_0030
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0031 : Poly :=
[
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 31 for generator 13. -/
def ep_Q2_008_partial_13_0031 : Poly :=
[
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 13. -/
theorem ep_Q2_008_partial_13_0031_valid :
    mulPoly ep_Q2_008_coefficient_13_0031
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0032 : Poly :=
[
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 32 for generator 13. -/
def ep_Q2_008_partial_13_0032 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 13. -/
theorem ep_Q2_008_partial_13_0032_valid :
    mulPoly ep_Q2_008_coefficient_13_0032
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0033 : Poly :=
[
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 33 for generator 13. -/
def ep_Q2_008_partial_13_0033 : Poly :=
[
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 13. -/
theorem ep_Q2_008_partial_13_0033_valid :
    mulPoly ep_Q2_008_coefficient_13_0033
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0034 : Poly :=
[
  term ((7956397138394139933 : Rat) / 2771825814456705436) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 34 for generator 13. -/
def ep_Q2_008_partial_13_0034 : Poly :=
[
  term ((7956397138394139933 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-7956397138394139933 : Rat) / 2771825814456705436) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-7956397138394139933 : Rat) / 2771825814456705436) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((7956397138394139933 : Rat) / 1385912907228352718) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 13. -/
theorem ep_Q2_008_partial_13_0034_valid :
    mulPoly ep_Q2_008_coefficient_13_0034
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0035 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 13. -/
def ep_Q2_008_partial_13_0035 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 13. -/
theorem ep_Q2_008_partial_13_0035_valid :
    mulPoly ep_Q2_008_coefficient_13_0035
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0036 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (13, 3), (16, 1)]
]

/-- Partial product 36 for generator 13. -/
def ep_Q2_008_partial_13_0036 : Poly :=
[
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 1), (13, 3), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (8, 2), (13, 3), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (9, 2), (13, 3), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(5, 2), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 13. -/
theorem ep_Q2_008_partial_13_0036_valid :
    mulPoly ep_Q2_008_coefficient_13_0036
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0037 : Poly :=
[
  term ((-1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 13. -/
def ep_Q2_008_partial_13_0037 : Poly :=
[
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 13. -/
theorem ep_Q2_008_partial_13_0037_valid :
    mulPoly ep_Q2_008_coefficient_13_0037
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0038 : Poly :=
[
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 13. -/
def ep_Q2_008_partial_13_0038 : Poly :=
[
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 13. -/
theorem ep_Q2_008_partial_13_0038_valid :
    mulPoly ep_Q2_008_coefficient_13_0038
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0039 : Poly :=
[
  term ((7263471595026879643283351454565284017400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 13. -/
def ep_Q2_008_partial_13_0039 : Poly :=
[
  term ((14526943190053759286566702909130568034800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((14526943190053759286566702909130568034800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7263471595026879643283351454565284017400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7263471595026879643283351454565284017400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 13. -/
theorem ep_Q2_008_partial_13_0039_valid :
    mulPoly ep_Q2_008_coefficient_13_0039
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0040 : Poly :=
[
  term ((-30955433660627124993 : Rat) / 5543651628913410872) [(6, 1), (16, 1)]
]

/-- Partial product 40 for generator 13. -/
def ep_Q2_008_partial_13_0040 : Poly :=
[
  term ((-30955433660627124993 : Rat) / 2771825814456705436) [(4, 1), (6, 1), (8, 1), (16, 1)],
  term ((-30955433660627124993 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((30955433660627124993 : Rat) / 5543651628913410872) [(6, 1), (8, 2), (16, 1)],
  term ((30955433660627124993 : Rat) / 5543651628913410872) [(6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 13. -/
theorem ep_Q2_008_partial_13_0040_valid :
    mulPoly ep_Q2_008_coefficient_13_0040
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0041 : Poly :=
[
  term ((364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 41 for generator 13. -/
def ep_Q2_008_partial_13_0041 : Poly :=
[
  term ((364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 13. -/
theorem ep_Q2_008_partial_13_0041_valid :
    mulPoly ep_Q2_008_coefficient_13_0041
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0042 : Poly :=
[
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 13. -/
def ep_Q2_008_partial_13_0042 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 13. -/
theorem ep_Q2_008_partial_13_0042_valid :
    mulPoly ep_Q2_008_coefficient_13_0042
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0043 : Poly :=
[
  term ((364938985264381623 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 13. -/
def ep_Q2_008_partial_13_0043 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 13. -/
theorem ep_Q2_008_partial_13_0043_valid :
    mulPoly ep_Q2_008_coefficient_13_0043
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0044 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 44 for generator 13. -/
def ep_Q2_008_partial_13_0044 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 13. -/
theorem ep_Q2_008_partial_13_0044_valid :
    mulPoly ep_Q2_008_coefficient_13_0044
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0045 : Poly :=
[
  term ((-980697982853149875 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 45 for generator 13. -/
def ep_Q2_008_partial_13_0045 : Poly :=
[
  term ((-980697982853149875 : Rat) / 692956453614176359) [(4, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-980697982853149875 : Rat) / 692956453614176359) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((980697982853149875 : Rat) / 1385912907228352718) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((980697982853149875 : Rat) / 1385912907228352718) [(7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 13. -/
theorem ep_Q2_008_partial_13_0045_valid :
    mulPoly ep_Q2_008_coefficient_13_0045
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0046 : Poly :=
[
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 46 for generator 13. -/
def ep_Q2_008_partial_13_0046 : Poly :=
[
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (9, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 13. -/
theorem ep_Q2_008_partial_13_0046_valid :
    mulPoly ep_Q2_008_coefficient_13_0046
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0047 : Poly :=
[
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 13. -/
def ep_Q2_008_partial_13_0047 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 13. -/
theorem ep_Q2_008_partial_13_0047_valid :
    mulPoly ep_Q2_008_coefficient_13_0047
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0048 : Poly :=
[
  term ((1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 13. -/
def ep_Q2_008_partial_13_0048 : Poly :=
[
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 13. -/
theorem ep_Q2_008_partial_13_0048_valid :
    mulPoly ep_Q2_008_coefficient_13_0048
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0049 : Poly :=
[
  term ((231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 49 for generator 13. -/
def ep_Q2_008_partial_13_0049 : Poly :=
[
  term ((462007028199355375006757266581398400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((462007028199355375006757266581398400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 13. -/
theorem ep_Q2_008_partial_13_0049_valid :
    mulPoly ep_Q2_008_coefficient_13_0049
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0050 : Poly :=
[
  term ((6531165872863359531 : Rat) / 2771825814456705436) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 50 for generator 13. -/
def ep_Q2_008_partial_13_0050 : Poly :=
[
  term ((6531165872863359531 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((6531165872863359531 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-6531165872863359531 : Rat) / 2771825814456705436) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((-6531165872863359531 : Rat) / 2771825814456705436) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 13. -/
theorem ep_Q2_008_partial_13_0050_valid :
    mulPoly ep_Q2_008_coefficient_13_0050
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0051 : Poly :=
[
  term ((44529536282152291796991292516311426172503 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 13. -/
def ep_Q2_008_partial_13_0051 : Poly :=
[
  term ((44529536282152291796991292516311426172503 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((44529536282152291796991292516311426172503 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-44529536282152291796991292516311426172503 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-44529536282152291796991292516311426172503 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 13. -/
theorem ep_Q2_008_partial_13_0051_valid :
    mulPoly ep_Q2_008_coefficient_13_0051
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0052 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 52 for generator 13. -/
def ep_Q2_008_partial_13_0052 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (13, 3), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 13. -/
theorem ep_Q2_008_partial_13_0052_valid :
    mulPoly ep_Q2_008_coefficient_13_0052
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0053 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(7, 1), (13, 3), (16, 1)]
]

/-- Partial product 53 for generator 13. -/
def ep_Q2_008_partial_13_0053 : Poly :=
[
  term ((729877970528763246 : Rat) / 692956453614176359) [(4, 1), (7, 1), (8, 1), (13, 3), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(5, 1), (7, 1), (9, 1), (13, 3), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(7, 1), (8, 2), (13, 3), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(7, 1), (9, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 13. -/
theorem ep_Q2_008_partial_13_0053_valid :
    mulPoly ep_Q2_008_coefficient_13_0053
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0054 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 13. -/
def ep_Q2_008_partial_13_0054 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 1), (13, 4), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (13, 4), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (13, 4), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 13. -/
theorem ep_Q2_008_partial_13_0054_valid :
    mulPoly ep_Q2_008_coefficient_13_0054
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0055 : Poly :=
[
  term ((43506991279006583305462104281706000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 55 for generator 13. -/
def ep_Q2_008_partial_13_0055 : Poly :=
[
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-43506991279006583305462104281706000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-43506991279006583305462104281706000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 13. -/
theorem ep_Q2_008_partial_13_0055_valid :
    mulPoly ep_Q2_008_coefficient_13_0055
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0056 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 13. -/
def ep_Q2_008_partial_13_0056 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 13. -/
theorem ep_Q2_008_partial_13_0056_valid :
    mulPoly ep_Q2_008_coefficient_13_0056
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0057 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 57 for generator 13. -/
def ep_Q2_008_partial_13_0057 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 13. -/
theorem ep_Q2_008_partial_13_0057_valid :
    mulPoly ep_Q2_008_coefficient_13_0057
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0058 : Poly :=
[
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 13. -/
def ep_Q2_008_partial_13_0058 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 13. -/
theorem ep_Q2_008_partial_13_0058_valid :
    mulPoly ep_Q2_008_coefficient_13_0058
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0059 : Poly :=
[
  term ((65214068117443964484229919893939200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 13. -/
def ep_Q2_008_partial_13_0059 : Poly :=
[
  term ((130428136234887928968459839787878400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((130428136234887928968459839787878400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65214068117443964484229919893939200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-65214068117443964484229919893939200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 13. -/
theorem ep_Q2_008_partial_13_0059_valid :
    mulPoly ep_Q2_008_coefficient_13_0059
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0060 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 60 for generator 13. -/
def ep_Q2_008_partial_13_0060 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (13, 2), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 13. -/
theorem ep_Q2_008_partial_13_0060_valid :
    mulPoly ep_Q2_008_coefficient_13_0060
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0061 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 13. -/
def ep_Q2_008_partial_13_0061 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 13. -/
theorem ep_Q2_008_partial_13_0061_valid :
    mulPoly ep_Q2_008_coefficient_13_0061
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0062 : Poly :=
[
  term ((376426615813486875 : Rat) / 692956453614176359) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 62 for generator 13. -/
def ep_Q2_008_partial_13_0062 : Poly :=
[
  term ((752853231626973750 : Rat) / 692956453614176359) [(4, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((752853231626973750 : Rat) / 692956453614176359) [(5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-376426615813486875 : Rat) / 692956453614176359) [(8, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-376426615813486875 : Rat) / 692956453614176359) [(9, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 13. -/
theorem ep_Q2_008_partial_13_0062_valid :
    mulPoly ep_Q2_008_coefficient_13_0062
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0063 : Poly :=
[
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 13. -/
def ep_Q2_008_partial_13_0063 : Poly :=
[
  term ((-322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 13. -/
theorem ep_Q2_008_partial_13_0063_valid :
    mulPoly ep_Q2_008_coefficient_13_0063
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0064 : Poly :=
[
  term ((-9869659753932509733 : Rat) / 2771825814456705436) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 64 for generator 13. -/
def ep_Q2_008_partial_13_0064 : Poly :=
[
  term ((-9869659753932509733 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-9869659753932509733 : Rat) / 1385912907228352718) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 13. -/
theorem ep_Q2_008_partial_13_0064_valid :
    mulPoly ep_Q2_008_coefficient_13_0064
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0065 : Poly :=
[
  term ((8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 65 for generator 13. -/
def ep_Q2_008_partial_13_0065 : Poly :=
[
  term ((16792285477825610267067920188829228398200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((16792285477825610267067920188829228398200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 13. -/
theorem ep_Q2_008_partial_13_0065_valid :
    mulPoly ep_Q2_008_coefficient_13_0065
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0066 : Poly :=
[
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 66 for generator 13. -/
def ep_Q2_008_partial_13_0066 : Poly :=
[
  term ((156347975682157151764188561375430041600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((156347975682157151764188561375430041600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 13. -/
theorem ep_Q2_008_partial_13_0066_valid :
    mulPoly ep_Q2_008_coefficient_13_0066
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0067 : Poly :=
[
  term ((2174935314585914775 : Rat) / 1385912907228352718) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 67 for generator 13. -/
def ep_Q2_008_partial_13_0067 : Poly :=
[
  term ((2174935314585914775 : Rat) / 692956453614176359) [(4, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((2174935314585914775 : Rat) / 692956453614176359) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-2174935314585914775 : Rat) / 1385912907228352718) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2174935314585914775 : Rat) / 1385912907228352718) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 13. -/
theorem ep_Q2_008_partial_13_0067_valid :
    mulPoly ep_Q2_008_coefficient_13_0067
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0068 : Poly :=
[
  term ((286773240582077271737210877844888128000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 13. -/
def ep_Q2_008_partial_13_0068 : Poly :=
[
  term ((573546481164154543474421755689776256000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((573546481164154543474421755689776256000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-286773240582077271737210877844888128000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-286773240582077271737210877844888128000 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 13. -/
theorem ep_Q2_008_partial_13_0068_valid :
    mulPoly ep_Q2_008_coefficient_13_0068
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0069 : Poly :=
[
  term ((-16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 13. -/
def ep_Q2_008_partial_13_0069 : Poly :=
[
  term ((-33910573012380019741064666099712975270000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-33910573012380019741064666099712975270000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 13. -/
theorem ep_Q2_008_partial_13_0069_valid :
    mulPoly ep_Q2_008_coefficient_13_0069
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0070 : Poly :=
[
  term ((545476244656367250 : Rat) / 692956453614176359) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 70 for generator 13. -/
def ep_Q2_008_partial_13_0070 : Poly :=
[
  term ((1090952489312734500 : Rat) / 692956453614176359) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1090952489312734500 : Rat) / 692956453614176359) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-545476244656367250 : Rat) / 692956453614176359) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-545476244656367250 : Rat) / 692956453614176359) [(9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 13. -/
theorem ep_Q2_008_partial_13_0070_valid :
    mulPoly ep_Q2_008_coefficient_13_0070
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0071 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 13. -/
def ep_Q2_008_partial_13_0071 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 13. -/
theorem ep_Q2_008_partial_13_0071_valid :
    mulPoly ep_Q2_008_coefficient_13_0071
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0072 : Poly :=
[
  term ((383868631908976040920205622775094941462950 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 72 for generator 13. -/
def ep_Q2_008_partial_13_0072 : Poly :=
[
  term ((767737263817952081840411245550189882925900 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((767737263817952081840411245550189882925900 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-383868631908976040920205622775094941462950 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-383868631908976040920205622775094941462950 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 13. -/
theorem ep_Q2_008_partial_13_0072_valid :
    mulPoly ep_Q2_008_coefficient_13_0072
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0073 : Poly :=
[
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 73 for generator 13. -/
def ep_Q2_008_partial_13_0073 : Poly :=
[
  term ((-456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 13. -/
theorem ep_Q2_008_partial_13_0073_valid :
    mulPoly ep_Q2_008_coefficient_13_0073
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0074 : Poly :=
[
  term ((2677167697536627750 : Rat) / 692956453614176359) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 74 for generator 13. -/
def ep_Q2_008_partial_13_0074 : Poly :=
[
  term ((5354335395073255500 : Rat) / 692956453614176359) [(4, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((5354335395073255500 : Rat) / 692956453614176359) [(5, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-2677167697536627750 : Rat) / 692956453614176359) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((-2677167697536627750 : Rat) / 692956453614176359) [(9, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 13. -/
theorem ep_Q2_008_partial_13_0074_valid :
    mulPoly ep_Q2_008_coefficient_13_0074
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0075 : Poly :=
[
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 13. -/
def ep_Q2_008_partial_13_0075 : Poly :=
[
  term ((3650644755659731197662327607016562380800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((3650644755659731197662327607016562380800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 13. -/
theorem ep_Q2_008_partial_13_0075_valid :
    mulPoly ep_Q2_008_coefficient_13_0075
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0076 : Poly :=
[
  term ((-1866575903282282250 : Rat) / 692956453614176359) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 76 for generator 13. -/
def ep_Q2_008_partial_13_0076 : Poly :=
[
  term ((-3733151806564564500 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3733151806564564500 : Rat) / 692956453614176359) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1866575903282282250 : Rat) / 692956453614176359) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1866575903282282250 : Rat) / 692956453614176359) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 13. -/
theorem ep_Q2_008_partial_13_0076_valid :
    mulPoly ep_Q2_008_coefficient_13_0076
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0077 : Poly :=
[
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 13. -/
def ep_Q2_008_partial_13_0077 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 13. -/
theorem ep_Q2_008_partial_13_0077_valid :
    mulPoly ep_Q2_008_coefficient_13_0077
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0078 : Poly :=
[
  term ((304134595608574663721827095464668800000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 13. -/
def ep_Q2_008_partial_13_0078 : Poly :=
[
  term ((608269191217149327443654190929337600000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((608269191217149327443654190929337600000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-304134595608574663721827095464668800000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-304134595608574663721827095464668800000 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 13. -/
theorem ep_Q2_008_partial_13_0078_valid :
    mulPoly ep_Q2_008_coefficient_13_0078
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0079 : Poly :=
[
  term ((68316475493390056862150464548869863494000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 79 for generator 13. -/
def ep_Q2_008_partial_13_0079 : Poly :=
[
  term ((136632950986780113724300929097739726988000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((136632950986780113724300929097739726988000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-68316475493390056862150464548869863494000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-68316475493390056862150464548869863494000 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 13. -/
theorem ep_Q2_008_partial_13_0079_valid :
    mulPoly ep_Q2_008_coefficient_13_0079
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0080 : Poly :=
[
  term ((896513570668464750 : Rat) / 692956453614176359) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 80 for generator 13. -/
def ep_Q2_008_partial_13_0080 : Poly :=
[
  term ((1793027141336929500 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1793027141336929500 : Rat) / 692956453614176359) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-896513570668464750 : Rat) / 692956453614176359) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-896513570668464750 : Rat) / 692956453614176359) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 13. -/
theorem ep_Q2_008_partial_13_0080_valid :
    mulPoly ep_Q2_008_coefficient_13_0080
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0081 : Poly :=
[
  term ((457164929182109751909605891254087208337300 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 13. -/
def ep_Q2_008_partial_13_0081 : Poly :=
[
  term ((914329858364219503819211782508174416674600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((914329858364219503819211782508174416674600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-457164929182109751909605891254087208337300 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-457164929182109751909605891254087208337300 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 13. -/
theorem ep_Q2_008_partial_13_0081_valid :
    mulPoly ep_Q2_008_coefficient_13_0081
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0082 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 82 for generator 13. -/
def ep_Q2_008_partial_13_0082 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (9, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 13. -/
theorem ep_Q2_008_partial_13_0082_valid :
    mulPoly ep_Q2_008_coefficient_13_0082
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0083 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(11, 1), (13, 3), (16, 1)]
]

/-- Partial product 83 for generator 13. -/
def ep_Q2_008_partial_13_0083 : Poly :=
[
  term ((9529107427478448000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 1), (13, 3), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(5, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(8, 2), (11, 1), (13, 3), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(9, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 13. -/
theorem ep_Q2_008_partial_13_0083_valid :
    mulPoly ep_Q2_008_coefficient_13_0083
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0084 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 84 for generator 13. -/
def ep_Q2_008_partial_13_0084 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (9, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 13. -/
theorem ep_Q2_008_partial_13_0084_valid :
    mulPoly ep_Q2_008_coefficient_13_0084
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0085 : Poly :=
[
  term ((395782847031534285227448440901973673025 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 85 for generator 13. -/
def ep_Q2_008_partial_13_0085 : Poly :=
[
  term ((791565694063068570454896881803947346050 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((791565694063068570454896881803947346050 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-395782847031534285227448440901973673025 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-395782847031534285227448440901973673025 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 13. -/
theorem ep_Q2_008_partial_13_0085_valid :
    mulPoly ep_Q2_008_coefficient_13_0085
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0086 : Poly :=
[
  term ((-77415756779497500 : Rat) / 692956453614176359) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 86 for generator 13. -/
def ep_Q2_008_partial_13_0086 : Poly :=
[
  term ((-154831513558995000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((-154831513558995000 : Rat) / 692956453614176359) [(5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((77415756779497500 : Rat) / 692956453614176359) [(8, 2), (11, 2), (12, 1), (16, 1)],
  term ((77415756779497500 : Rat) / 692956453614176359) [(9, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 13. -/
theorem ep_Q2_008_partial_13_0086_valid :
    mulPoly ep_Q2_008_coefficient_13_0086
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0087 : Poly :=
[
  term ((1031401907174659500 : Rat) / 692956453614176359) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 13. -/
def ep_Q2_008_partial_13_0087 : Poly :=
[
  term ((2062803814349319000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((2062803814349319000 : Rat) / 692956453614176359) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 13. -/
theorem ep_Q2_008_partial_13_0087_valid :
    mulPoly ep_Q2_008_coefficient_13_0087
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0088 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 88 for generator 13. -/
def ep_Q2_008_partial_13_0088 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (9, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 13. -/
theorem ep_Q2_008_partial_13_0088_valid :
    mulPoly ep_Q2_008_coefficient_13_0088
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0089 : Poly :=
[
  term ((11930680621407866733 : Rat) / 2771825814456705436) [(11, 2), (16, 1)]
]

/-- Partial product 89 for generator 13. -/
def ep_Q2_008_partial_13_0089 : Poly :=
[
  term ((11930680621407866733 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (11, 2), (16, 1)],
  term ((11930680621407866733 : Rat) / 1385912907228352718) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-11930680621407866733 : Rat) / 2771825814456705436) [(8, 2), (11, 2), (16, 1)],
  term ((-11930680621407866733 : Rat) / 2771825814456705436) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 13. -/
theorem ep_Q2_008_partial_13_0089_valid :
    mulPoly ep_Q2_008_coefficient_13_0089
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0090 : Poly :=
[
  term ((22974866691594502056248659119951902657400 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 90 for generator 13. -/
def ep_Q2_008_partial_13_0090 : Poly :=
[
  term ((45949733383189004112497318239903805314800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((45949733383189004112497318239903805314800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22974866691594502056248659119951902657400 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22974866691594502056248659119951902657400 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 13. -/
theorem ep_Q2_008_partial_13_0090_valid :
    mulPoly ep_Q2_008_coefficient_13_0090
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0091 : Poly :=
[
  term ((-5116191240142427415 : Rat) / 11087303257826821744) [(12, 1), (16, 1)]
]

/-- Partial product 91 for generator 13. -/
def ep_Q2_008_partial_13_0091 : Poly :=
[
  term ((-5116191240142427415 : Rat) / 5543651628913410872) [(4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-5116191240142427415 : Rat) / 5543651628913410872) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((5116191240142427415 : Rat) / 11087303257826821744) [(8, 2), (12, 1), (16, 1)],
  term ((5116191240142427415 : Rat) / 11087303257826821744) [(9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 13. -/
theorem ep_Q2_008_partial_13_0091_valid :
    mulPoly ep_Q2_008_coefficient_13_0091
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0092 : Poly :=
[
  term ((-3165986747802097017890261919394031908228761 : Rat) / 674830407405318061502963313035932218791992) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 13. -/
def ep_Q2_008_partial_13_0092 : Poly :=
[
  term ((-3165986747802097017890261919394031908228761 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3165986747802097017890261919394031908228761 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((3165986747802097017890261919394031908228761 : Rat) / 674830407405318061502963313035932218791992) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((3165986747802097017890261919394031908228761 : Rat) / 674830407405318061502963313035932218791992) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 13. -/
theorem ep_Q2_008_partial_13_0092_valid :
    mulPoly ep_Q2_008_coefficient_13_0092
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0093 : Poly :=
[
  term ((-64542910741434472086979871158371840476400 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 93 for generator 13. -/
def ep_Q2_008_partial_13_0093 : Poly :=
[
  term ((-129085821482868944173959742316743680952800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-129085821482868944173959742316743680952800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((64542910741434472086979871158371840476400 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (13, 2), (15, 2), (16, 1)],
  term ((64542910741434472086979871158371840476400 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 13. -/
theorem ep_Q2_008_partial_13_0093_valid :
    mulPoly ep_Q2_008_coefficient_13_0093
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0094 : Poly :=
[
  term ((-5002086132988838070 : Rat) / 692956453614176359) [(13, 2), (16, 1)]
]

/-- Partial product 94 for generator 13. -/
def ep_Q2_008_partial_13_0094 : Poly :=
[
  term ((-10004172265977676140 : Rat) / 692956453614176359) [(4, 1), (8, 1), (13, 2), (16, 1)],
  term ((-10004172265977676140 : Rat) / 692956453614176359) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((5002086132988838070 : Rat) / 692956453614176359) [(8, 2), (13, 2), (16, 1)],
  term ((5002086132988838070 : Rat) / 692956453614176359) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 13. -/
theorem ep_Q2_008_partial_13_0094_valid :
    mulPoly ep_Q2_008_coefficient_13_0094
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0095 : Poly :=
[
  term ((3288804141911155869303430984287318528000 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 13. -/
def ep_Q2_008_partial_13_0095 : Poly :=
[
  term ((6577608283822311738606861968574637056000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((6577608283822311738606861968574637056000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3288804141911155869303430984287318528000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (13, 3), (15, 1), (16, 1)],
  term ((-3288804141911155869303430984287318528000 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 13. -/
theorem ep_Q2_008_partial_13_0095_valid :
    mulPoly ep_Q2_008_coefficient_13_0095
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 13. -/
def ep_Q2_008_coefficient_13_0096 : Poly :=
[
  term ((43082146483780994235 : Rat) / 11087303257826821744) [(16, 1)]
]

/-- Partial product 96 for generator 13. -/
def ep_Q2_008_partial_13_0096 : Poly :=
[
  term ((43082146483780994235 : Rat) / 5543651628913410872) [(4, 1), (8, 1), (16, 1)],
  term ((43082146483780994235 : Rat) / 5543651628913410872) [(5, 1), (9, 1), (16, 1)],
  term ((-43082146483780994235 : Rat) / 11087303257826821744) [(8, 2), (16, 1)],
  term ((-43082146483780994235 : Rat) / 11087303257826821744) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 13. -/
theorem ep_Q2_008_partial_13_0096_valid :
    mulPoly ep_Q2_008_coefficient_13_0096
        ep_Q2_008_generator_13_0000_0096 =
      ep_Q2_008_partial_13_0096 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_13_0000_0096 : List Poly :=
[
  ep_Q2_008_partial_13_0000,
  ep_Q2_008_partial_13_0001,
  ep_Q2_008_partial_13_0002,
  ep_Q2_008_partial_13_0003,
  ep_Q2_008_partial_13_0004,
  ep_Q2_008_partial_13_0005,
  ep_Q2_008_partial_13_0006,
  ep_Q2_008_partial_13_0007,
  ep_Q2_008_partial_13_0008,
  ep_Q2_008_partial_13_0009,
  ep_Q2_008_partial_13_0010,
  ep_Q2_008_partial_13_0011,
  ep_Q2_008_partial_13_0012,
  ep_Q2_008_partial_13_0013,
  ep_Q2_008_partial_13_0014,
  ep_Q2_008_partial_13_0015,
  ep_Q2_008_partial_13_0016,
  ep_Q2_008_partial_13_0017,
  ep_Q2_008_partial_13_0018,
  ep_Q2_008_partial_13_0019,
  ep_Q2_008_partial_13_0020,
  ep_Q2_008_partial_13_0021,
  ep_Q2_008_partial_13_0022,
  ep_Q2_008_partial_13_0023,
  ep_Q2_008_partial_13_0024,
  ep_Q2_008_partial_13_0025,
  ep_Q2_008_partial_13_0026,
  ep_Q2_008_partial_13_0027,
  ep_Q2_008_partial_13_0028,
  ep_Q2_008_partial_13_0029,
  ep_Q2_008_partial_13_0030,
  ep_Q2_008_partial_13_0031,
  ep_Q2_008_partial_13_0032,
  ep_Q2_008_partial_13_0033,
  ep_Q2_008_partial_13_0034,
  ep_Q2_008_partial_13_0035,
  ep_Q2_008_partial_13_0036,
  ep_Q2_008_partial_13_0037,
  ep_Q2_008_partial_13_0038,
  ep_Q2_008_partial_13_0039,
  ep_Q2_008_partial_13_0040,
  ep_Q2_008_partial_13_0041,
  ep_Q2_008_partial_13_0042,
  ep_Q2_008_partial_13_0043,
  ep_Q2_008_partial_13_0044,
  ep_Q2_008_partial_13_0045,
  ep_Q2_008_partial_13_0046,
  ep_Q2_008_partial_13_0047,
  ep_Q2_008_partial_13_0048,
  ep_Q2_008_partial_13_0049,
  ep_Q2_008_partial_13_0050,
  ep_Q2_008_partial_13_0051,
  ep_Q2_008_partial_13_0052,
  ep_Q2_008_partial_13_0053,
  ep_Q2_008_partial_13_0054,
  ep_Q2_008_partial_13_0055,
  ep_Q2_008_partial_13_0056,
  ep_Q2_008_partial_13_0057,
  ep_Q2_008_partial_13_0058,
  ep_Q2_008_partial_13_0059,
  ep_Q2_008_partial_13_0060,
  ep_Q2_008_partial_13_0061,
  ep_Q2_008_partial_13_0062,
  ep_Q2_008_partial_13_0063,
  ep_Q2_008_partial_13_0064,
  ep_Q2_008_partial_13_0065,
  ep_Q2_008_partial_13_0066,
  ep_Q2_008_partial_13_0067,
  ep_Q2_008_partial_13_0068,
  ep_Q2_008_partial_13_0069,
  ep_Q2_008_partial_13_0070,
  ep_Q2_008_partial_13_0071,
  ep_Q2_008_partial_13_0072,
  ep_Q2_008_partial_13_0073,
  ep_Q2_008_partial_13_0074,
  ep_Q2_008_partial_13_0075,
  ep_Q2_008_partial_13_0076,
  ep_Q2_008_partial_13_0077,
  ep_Q2_008_partial_13_0078,
  ep_Q2_008_partial_13_0079,
  ep_Q2_008_partial_13_0080,
  ep_Q2_008_partial_13_0081,
  ep_Q2_008_partial_13_0082,
  ep_Q2_008_partial_13_0083,
  ep_Q2_008_partial_13_0084,
  ep_Q2_008_partial_13_0085,
  ep_Q2_008_partial_13_0086,
  ep_Q2_008_partial_13_0087,
  ep_Q2_008_partial_13_0088,
  ep_Q2_008_partial_13_0089,
  ep_Q2_008_partial_13_0090,
  ep_Q2_008_partial_13_0091,
  ep_Q2_008_partial_13_0092,
  ep_Q2_008_partial_13_0093,
  ep_Q2_008_partial_13_0094,
  ep_Q2_008_partial_13_0095,
  ep_Q2_008_partial_13_0096
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_13_0000_0096 : Poly :=
[
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (8, 2), (11, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (8, 2), (13, 1), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (8, 2), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (9, 2), (11, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (9, 2), (13, 1), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1394209569450284597973175745534779392000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(0, 1), (4, 1), (8, 1), (16, 1)],
  term ((-1394209569450284597973175745534779392000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (9, 1), (16, 1)],
  term ((697104784725142298986587872767389696000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12113105612672266983 : Rat) / 5543651628913410872) [(0, 1), (8, 2), (16, 1)],
  term ((697104784725142298986587872767389696000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12113105612672266983 : Rat) / 5543651628913410872) [(0, 1), (9, 2), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-321573143545605000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((325919120131235360565157966488649728000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((12884881157181718983 : Rat) / 1385912907228352718) [(1, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-70963813359225743624370652006581017193000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-321573143545605000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((325919120131235360565157966488649728000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((12884881157181718983 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-70963813359225743624370652006581017193000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(1, 1), (8, 2), (11, 1), (16, 1)],
  term ((-162959560065617680282578983244324864000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-12884881157181718983 : Rat) / 2771825814456705436) [(1, 1), (8, 2), (13, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((35481906679612871812185326003290508596500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((-162959560065617680282578983244324864000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-12884881157181718983 : Rat) / 2771825814456705436) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((35481906679612871812185326003290508596500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (4, 1), (8, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (8, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (9, 2), (16, 1)],
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 692956453614176359) [(3, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 692956453614176359) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 1385912907228352718) [(3, 1), (8, 2), (13, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 1385912907228352718) [(3, 1), (9, 2), (13, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30372200180213374045504273179340800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 2771825814456705436) [(4, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((7956397138394139933 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 1), (13, 3), (16, 1)],
  term ((174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((14526943190053759286566702909130568034800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30955433660627124993 : Rat) / 2771825814456705436) [(4, 1), (6, 1), (8, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-980697982853149875 : Rat) / 692956453614176359) [(4, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((462007028199355375006757266581398400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((6531165872863359531 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((44529536282152291796991292516311426172503 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(4, 1), (7, 1), (8, 1), (13, 3), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 1), (13, 4), (15, 1), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((130428136234887928968459839787878400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((752853231626973750 : Rat) / 692956453614176359) [(4, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9869659753932509733 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((16792285477825610267067920188829228398200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((156347975682157151764188561375430041600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2174935314585914775 : Rat) / 692956453614176359) [(4, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((573546481164154543474421755689776256000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-33910573012380019741064666099712975270000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1090952489312734500 : Rat) / 692956453614176359) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((767737263817952081840411245550189882925900 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((5354335395073255500 : Rat) / 692956453614176359) [(4, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((3650644755659731197662327607016562380800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3733151806564564500 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((608269191217149327443654190929337600000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((136632950986780113724300929097739726988000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1793027141336929500 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((914329858364219503819211782508174416674600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 1), (13, 3), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((791565694063068570454896881803947346050 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-154831513558995000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((2062803814349319000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((11930680621407866733 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (11, 2), (16, 1)],
  term ((45949733383189004112497318239903805314800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5116191240142427415 : Rat) / 5543651628913410872) [(4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-3165986747802097017890261919394031908228761 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129085821482868944173959742316743680952800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-10004172265977676140 : Rat) / 692956453614176359) [(4, 1), (8, 1), (13, 2), (16, 1)],
  term ((6577608283822311738606861968574637056000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((43082146483780994235 : Rat) / 5543651628913410872) [(4, 1), (8, 1), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 11087303257826821744) [(4, 1), (8, 2), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 11087303257826821744) [(4, 1), (9, 2), (16, 1)],
  term ((174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(4, 2), (8, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((14526943190053759286566702909130568034800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30955433660627124993 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15186100090106687022752136589670400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (13, 2), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-980697982853149875 : Rat) / 692956453614176359) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((462007028199355375006757266581398400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((6531165872863359531 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((44529536282152291796991292516311426172503 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (13, 3), (15, 2), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(5, 1), (7, 1), (9, 1), (13, 3), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (13, 4), (15, 1), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15186100090106687022752136589670400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((130428136234887928968459839787878400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(5, 1), (8, 2), (9, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-7956397138394139933 : Rat) / 2771825814456705436) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (8, 2), (13, 3), (16, 1)],
  term ((1090952489312734500 : Rat) / 692956453614176359) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((767737263817952081840411245550189882925900 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((5354335395073255500 : Rat) / 692956453614176359) [(5, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((3650644755659731197662327607016562380800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3733151806564564500 : Rat) / 692956453614176359) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((608269191217149327443654190929337600000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((136632950986780113724300929097739726988000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1793027141336929500 : Rat) / 692956453614176359) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((914329858364219503819211782508174416674600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (9, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(5, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (9, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((791565694063068570454896881803947346050 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-154831513558995000 : Rat) / 692956453614176359) [(5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((2062803814349319000 : Rat) / 692956453614176359) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (9, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((11930680621407866733 : Rat) / 1385912907228352718) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((45949733383189004112497318239903805314800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5116191240142427415 : Rat) / 5543651628913410872) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-3165986747802097017890261919394031908228761 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129085821482868944173959742316743680952800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-10004172265977676140 : Rat) / 692956453614176359) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((6577608283822311738606861968574637056000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((43082146483780994235 : Rat) / 5543651628913410872) [(5, 1), (9, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((752853231626973750 : Rat) / 692956453614176359) [(5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((1309979629912835767612947000557484833493414 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-9869659753932509733 : Rat) / 1385912907228352718) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((16792285477825610267067920188829228398200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((155338613484484199031501840556094462400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((743344119949519167 : Rat) / 2771825814456705436) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((1310875179906479464843126786608527817487014 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (9, 2), (13, 3), (16, 1)],
  term ((-33910573012380019741064666099712975270000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(5, 1), (9, 3), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30372200180213374045504273179340800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((7956397138394139933 : Rat) / 1385912907228352718) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(5, 2), (9, 1), (13, 3), (16, 1)],
  term ((43926043926967546635 : Rat) / 2771825814456705436) [(5, 2), (9, 2), (16, 1)],
  term ((1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-7263471595026879643283351454565284017400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((30955433660627124993 : Rat) / 5543651628913410872) [(6, 1), (8, 2), (16, 1)],
  term ((-7263471595026879643283351454565284017400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((30955433660627124993 : Rat) / 5543651628913410872) [(6, 1), (9, 2), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (9, 3), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((980697982853149875 : Rat) / 1385912907228352718) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-6531165872863359531 : Rat) / 2771825814456705436) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((-44529536282152291796991292516311426172503 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (13, 3), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(7, 1), (8, 2), (13, 3), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (13, 4), (15, 1), (16, 1)],
  term ((-43506991279006583305462104281706000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((980697982853149875 : Rat) / 1385912907228352718) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-6531165872863359531 : Rat) / 2771825814456705436) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-44529536282152291796991292516311426172503 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (13, 3), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(7, 1), (9, 2), (13, 3), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (13, 4), (15, 1), (16, 1)],
  term ((-43506991279006583305462104281706000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65214068117443964484229919893939200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (13, 2), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65214068117443964484229919893939200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-376426615813486875 : Rat) / 692956453614176359) [(8, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2174935314585914775 : Rat) / 1385912907228352718) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-286773240582077271737210877844888128000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-545476244656367250 : Rat) / 692956453614176359) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-383868631908976040920205622775094941462950 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2677167697536627750 : Rat) / 692956453614176359) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((1866575903282282250 : Rat) / 692956453614176359) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-304134595608574663721827095464668800000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-68316475493390056862150464548869863494000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-896513570668464750 : Rat) / 692956453614176359) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-457164929182109751909605891254087208337300 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(8, 2), (11, 1), (13, 3), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-395782847031534285227448440901973673025 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((77415756779497500 : Rat) / 692956453614176359) [(8, 2), (11, 2), (12, 1), (16, 1)],
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-11930680621407866733 : Rat) / 2771825814456705436) [(8, 2), (11, 2), (16, 1)],
  term ((-22974866691594502056248659119951902657400 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5116191240142427415 : Rat) / 11087303257826821744) [(8, 2), (12, 1), (16, 1)],
  term ((3165986747802097017890261919394031908228761 : Rat) / 674830407405318061502963313035932218791992) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((64542910741434472086979871158371840476400 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (13, 2), (15, 2), (16, 1)],
  term ((5002086132988838070 : Rat) / 692956453614176359) [(8, 2), (13, 2), (16, 1)],
  term ((-3288804141911155869303430984287318528000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (13, 3), (15, 1), (16, 1)],
  term ((-43082146483780994235 : Rat) / 11087303257826821744) [(8, 2), (16, 1)],
  term ((-545476244656367250 : Rat) / 692956453614176359) [(9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-383868631908976040920205622775094941462950 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2677167697536627750 : Rat) / 692956453614176359) [(9, 2), (10, 1), (13, 2), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((1866575903282282250 : Rat) / 692956453614176359) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-304134595608574663721827095464668800000 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-68316475493390056862150464548869863494000 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-896513570668464750 : Rat) / 692956453614176359) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-457164929182109751909605891254087208337300 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(9, 2), (11, 1), (13, 3), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-395782847031534285227448440901973673025 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((77415756779497500 : Rat) / 692956453614176359) [(9, 2), (11, 2), (12, 1), (16, 1)],
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-11930680621407866733 : Rat) / 2771825814456705436) [(9, 2), (11, 2), (16, 1)],
  term ((-22974866691594502056248659119951902657400 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5116191240142427415 : Rat) / 11087303257826821744) [(9, 2), (12, 1), (16, 1)],
  term ((3165986747802097017890261919394031908228761 : Rat) / 674830407405318061502963313035932218791992) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((64542910741434472086979871158371840476400 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((5002086132988838070 : Rat) / 692956453614176359) [(9, 2), (13, 2), (16, 1)],
  term ((-3288804141911155869303430984287318528000 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-43082146483780994235 : Rat) / 11087303257826821744) [(9, 2), (16, 1)],
  term ((-376426615813486875 : Rat) / 692956453614176359) [(9, 3), (11, 1), (12, 1), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(9, 3), (11, 1), (16, 1)],
  term ((-8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-2174935314585914775 : Rat) / 1385912907228352718) [(9, 3), (13, 1), (16, 1)],
  term ((-286773240582077271737210877844888128000 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (13, 2), (15, 1), (16, 1)],
  term ((16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 13, terms 0 through 96. -/
theorem ep_Q2_008_block_13_0000_0096_valid :
    checkProductSumEq ep_Q2_008_partials_13_0000_0096
      ep_Q2_008_block_13_0000_0096 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
