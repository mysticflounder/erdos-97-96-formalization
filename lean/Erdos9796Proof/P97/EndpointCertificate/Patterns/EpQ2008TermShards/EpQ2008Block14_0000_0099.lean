/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 14:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 14 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_14_0000_0099 : Poly :=
[
  term (2 : Rat) [(4, 1), (12, 1)],
  term (2 : Rat) [(5, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0000 : Poly :=
[
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 14. -/
def ep_Q2_008_partial_14_0000 : Poly :=
[
  term ((95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 14. -/
theorem ep_Q2_008_partial_14_0000_valid :
    mulPoly ep_Q2_008_coefficient_14_0000
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0001 : Poly :=
[
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 14. -/
def ep_Q2_008_partial_14_0001 : Poly :=
[
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (5, 1), (13, 2), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 14. -/
theorem ep_Q2_008_partial_14_0001_valid :
    mulPoly ep_Q2_008_coefficient_14_0001
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0002 : Poly :=
[
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 14. -/
def ep_Q2_008_partial_14_0002 : Poly :=
[
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 14. -/
theorem ep_Q2_008_partial_14_0002_valid :
    mulPoly ep_Q2_008_coefficient_14_0002
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0003 : Poly :=
[
  term ((-199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 14. -/
def ep_Q2_008_partial_14_0003 : Poly :=
[
  term ((-398345591271509885135193070152794112000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-398345591271509885135193070152794112000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 14. -/
theorem ep_Q2_008_partial_14_0003_valid :
    mulPoly ep_Q2_008_coefficient_14_0003
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0004 : Poly :=
[
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 4 for generator 14. -/
def ep_Q2_008_partial_14_0004 : Poly :=
[
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (13, 4), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (5, 2), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 14. -/
theorem ep_Q2_008_partial_14_0004_valid :
    mulPoly ep_Q2_008_coefficient_14_0004
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0005 : Poly :=
[
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 5 for generator 14. -/
def ep_Q2_008_partial_14_0005 : Poly :=
[
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(0, 1), (4, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(0, 1), (5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 14. -/
theorem ep_Q2_008_partial_14_0005_valid :
    mulPoly ep_Q2_008_coefficient_14_0005
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0006 : Poly :=
[
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 14. -/
def ep_Q2_008_partial_14_0006 : Poly :=
[
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 4), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 2), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 14. -/
theorem ep_Q2_008_partial_14_0006_valid :
    mulPoly ep_Q2_008_coefficient_14_0006
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0007 : Poly :=
[
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 14. -/
def ep_Q2_008_partial_14_0007 : Poly :=
[
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 2), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 14. -/
theorem ep_Q2_008_partial_14_0007_valid :
    mulPoly ep_Q2_008_coefficient_14_0007
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0008 : Poly :=
[
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 14. -/
def ep_Q2_008_partial_14_0008 : Poly :=
[
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 14. -/
theorem ep_Q2_008_partial_14_0008_valid :
    mulPoly ep_Q2_008_coefficient_14_0008
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0009 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 9 for generator 14. -/
def ep_Q2_008_partial_14_0009 : Poly :=
[
  term ((13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (4, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 14. -/
theorem ep_Q2_008_partial_14_0009_valid :
    mulPoly ep_Q2_008_coefficient_14_0009
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0010 : Poly :=
[
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 14. -/
def ep_Q2_008_partial_14_0010 : Poly :=
[
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 14. -/
theorem ep_Q2_008_partial_14_0010_valid :
    mulPoly ep_Q2_008_coefficient_14_0010
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0011 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 11 for generator 14. -/
def ep_Q2_008_partial_14_0011 : Poly :=
[
  term ((28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 3), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 14. -/
theorem ep_Q2_008_partial_14_0011_valid :
    mulPoly ep_Q2_008_coefficient_14_0011
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0012 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 14. -/
def ep_Q2_008_partial_14_0012 : Poly :=
[
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (11, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 14. -/
theorem ep_Q2_008_partial_14_0012_valid :
    mulPoly ep_Q2_008_coefficient_14_0012
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0013 : Poly :=
[
  term ((3722972841105519375 : Rat) / 1385912907228352718) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 13 for generator 14. -/
def ep_Q2_008_partial_14_0013 : Poly :=
[
  term ((3722972841105519375 : Rat) / 692956453614176359) [(0, 1), (4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((3722972841105519375 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3722972841105519375 : Rat) / 1385912907228352718) [(0, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-3722972841105519375 : Rat) / 1385912907228352718) [(0, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 14. -/
theorem ep_Q2_008_partial_14_0013_valid :
    mulPoly ep_Q2_008_coefficient_14_0013
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0014 : Poly :=
[
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 14 for generator 14. -/
def ep_Q2_008_partial_14_0014 : Poly :=
[
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 14. -/
theorem ep_Q2_008_partial_14_0014_valid :
    mulPoly ep_Q2_008_coefficient_14_0014
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0015 : Poly :=
[
  term ((-18503295057505502460 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 15 for generator 14. -/
def ep_Q2_008_partial_14_0015 : Poly :=
[
  term ((-37006590115011004920 : Rat) / 692956453614176359) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-37006590115011004920 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((18503295057505502460 : Rat) / 692956453614176359) [(0, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((18503295057505502460 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 14. -/
theorem ep_Q2_008_partial_14_0015_valid :
    mulPoly ep_Q2_008_coefficient_14_0015
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0016 : Poly :=
[
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 14. -/
def ep_Q2_008_partial_14_0016 : Poly :=
[
  term ((23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 14. -/
theorem ep_Q2_008_partial_14_0016_valid :
    mulPoly ep_Q2_008_coefficient_14_0016
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0017 : Poly :=
[
  term ((55086151861948831347085925295141498034575 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 14. -/
def ep_Q2_008_partial_14_0017 : Poly :=
[
  term ((110172303723897662694171850590282996069150 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((110172303723897662694171850590282996069150 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-55086151861948831347085925295141498034575 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-55086151861948831347085925295141498034575 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 14. -/
theorem ep_Q2_008_partial_14_0017_valid :
    mulPoly ep_Q2_008_coefficient_14_0017
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0018 : Poly :=
[
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 14. -/
def ep_Q2_008_partial_14_0018 : Poly :=
[
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 14. -/
theorem ep_Q2_008_partial_14_0018_valid :
    mulPoly ep_Q2_008_coefficient_14_0018
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0019 : Poly :=
[
  term ((1094816955793144869 : Rat) / 692956453614176359) [(0, 1), (7, 2), (13, 2), (16, 1)]
]

/-- Partial product 19 for generator 14. -/
def ep_Q2_008_partial_14_0019 : Poly :=
[
  term ((2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (4, 1), (7, 2), (12, 1), (13, 2), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 2), (13, 3), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(0, 1), (7, 2), (12, 2), (13, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(0, 1), (7, 2), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 14. -/
theorem ep_Q2_008_partial_14_0019_valid :
    mulPoly ep_Q2_008_coefficient_14_0019
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0020 : Poly :=
[
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 14. -/
def ep_Q2_008_partial_14_0020 : Poly :=
[
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 4), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 14. -/
theorem ep_Q2_008_partial_14_0020_valid :
    mulPoly ep_Q2_008_coefficient_14_0020
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0021 : Poly :=
[
  term ((4624670165699233431 : Rat) / 692956453614176359) [(0, 1), (7, 2), (16, 1)]
]

/-- Partial product 21 for generator 14. -/
def ep_Q2_008_partial_14_0021 : Poly :=
[
  term ((9249340331398466862 : Rat) / 692956453614176359) [(0, 1), (4, 1), (7, 2), (12, 1), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(0, 1), (7, 2), (12, 2), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(0, 1), (7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 14. -/
theorem ep_Q2_008_partial_14_0021_valid :
    mulPoly ep_Q2_008_coefficient_14_0021
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0022 : Poly :=
[
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 14. -/
def ep_Q2_008_partial_14_0022 : Poly :=
[
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 3), (13, 3), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 14. -/
theorem ep_Q2_008_partial_14_0022_valid :
    mulPoly ep_Q2_008_coefficient_14_0022
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0023 : Poly :=
[
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 14. -/
def ep_Q2_008_partial_14_0023 : Poly :=
[
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (12, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 14. -/
theorem ep_Q2_008_partial_14_0023_valid :
    mulPoly ep_Q2_008_coefficient_14_0023
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0024 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 14. -/
def ep_Q2_008_partial_14_0024 : Poly :=
[
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 14. -/
theorem ep_Q2_008_partial_14_0024_valid :
    mulPoly ep_Q2_008_coefficient_14_0024
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0025 : Poly :=
[
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(0, 1), (10, 1), (16, 1)]
]

/-- Partial product 25 for generator 14. -/
def ep_Q2_008_partial_14_0025 : Poly :=
[
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(0, 1), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(0, 1), (10, 1), (12, 2), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(0, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 14. -/
theorem ep_Q2_008_partial_14_0025_valid :
    mulPoly ep_Q2_008_coefficient_14_0025
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0026 : Poly :=
[
  term ((2208135585679821000 : Rat) / 692956453614176359) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 26 for generator 14. -/
def ep_Q2_008_partial_14_0026 : Poly :=
[
  term ((4416271171359642000 : Rat) / 692956453614176359) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((4416271171359642000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2208135585679821000 : Rat) / 692956453614176359) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2208135585679821000 : Rat) / 692956453614176359) [(0, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 14. -/
theorem ep_Q2_008_partial_14_0026_valid :
    mulPoly ep_Q2_008_coefficient_14_0026
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0027 : Poly :=
[
  term ((-50834519266796311199167165604142382784100 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 14. -/
def ep_Q2_008_partial_14_0027 : Poly :=
[
  term ((-101669038533592622398334331208284765568200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-101669038533592622398334331208284765568200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((50834519266796311199167165604142382784100 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((50834519266796311199167165604142382784100 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 14. -/
theorem ep_Q2_008_partial_14_0027_valid :
    mulPoly ep_Q2_008_coefficient_14_0027
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0028 : Poly :=
[
  term ((5955058213807500 : Rat) / 692956453614176359) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 28 for generator 14. -/
def ep_Q2_008_partial_14_0028 : Poly :=
[
  term ((11910116427615000 : Rat) / 692956453614176359) [(0, 1), (4, 1), (11, 2), (12, 1), (16, 1)],
  term ((11910116427615000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (11, 2), (13, 1), (16, 1)],
  term ((-5955058213807500 : Rat) / 692956453614176359) [(0, 1), (11, 2), (12, 2), (16, 1)],
  term ((-5955058213807500 : Rat) / 692956453614176359) [(0, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 14. -/
theorem ep_Q2_008_partial_14_0028_valid :
    mulPoly ep_Q2_008_coefficient_14_0028
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0029 : Poly :=
[
  term ((15513225883428359642007937231540825794000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 14. -/
def ep_Q2_008_partial_14_0029 : Poly :=
[
  term ((31026451766856719284015874463081651588000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((31026451766856719284015874463081651588000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-15513225883428359642007937231540825794000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15513225883428359642007937231540825794000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 14. -/
theorem ep_Q2_008_partial_14_0029_valid :
    mulPoly ep_Q2_008_coefficient_14_0029
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0030 : Poly :=
[
  term ((49793198908938735641899133769099264000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 30 for generator 14. -/
def ep_Q2_008_partial_14_0030 : Poly :=
[
  term ((99586397817877471283798267538198528000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((99586397817877471283798267538198528000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-49793198908938735641899133769099264000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-49793198908938735641899133769099264000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 14. -/
theorem ep_Q2_008_partial_14_0030_valid :
    mulPoly ep_Q2_008_coefficient_14_0030
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0031 : Poly :=
[
  term ((-11026902994473778983 : Rat) / 2771825814456705436) [(0, 1), (16, 1)]
]

/-- Partial product 31 for generator 14. -/
def ep_Q2_008_partial_14_0031 : Poly :=
[
  term ((-11026902994473778983 : Rat) / 1385912907228352718) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((-11026902994473778983 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((11026902994473778983 : Rat) / 2771825814456705436) [(0, 1), (12, 2), (16, 1)],
  term ((11026902994473778983 : Rat) / 2771825814456705436) [(0, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 14. -/
theorem ep_Q2_008_partial_14_0031_valid :
    mulPoly ep_Q2_008_coefficient_14_0031
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0032 : Poly :=
[
  term ((-257258514836484000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 32 for generator 14. -/
def ep_Q2_008_partial_14_0032 : Poly :=
[
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (12, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((257258514836484000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((257258514836484000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 14. -/
theorem ep_Q2_008_partial_14_0032_valid :
    mulPoly ep_Q2_008_coefficient_14_0032
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0033 : Poly :=
[
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 14. -/
def ep_Q2_008_partial_14_0033 : Poly :=
[
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 2), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 14. -/
theorem ep_Q2_008_partial_14_0033_valid :
    mulPoly ep_Q2_008_coefficient_14_0033
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0034 : Poly :=
[
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 14. -/
def ep_Q2_008_partial_14_0034 : Poly :=
[
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 2), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 14. -/
theorem ep_Q2_008_partial_14_0034_valid :
    mulPoly ep_Q2_008_coefficient_14_0034
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0035 : Poly :=
[
  term ((64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 2), (16, 1)]
]

/-- Partial product 35 for generator 14. -/
def ep_Q2_008_partial_14_0035 : Poly :=
[
  term ((129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (4, 1), (5, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (12, 2), (13, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 4), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (5, 2), (6, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 14. -/
theorem ep_Q2_008_partial_14_0035_valid :
    mulPoly ep_Q2_008_coefficient_14_0035
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0036 : Poly :=
[
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 36 for generator 14. -/
def ep_Q2_008_partial_14_0036 : Poly :=
[
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(1, 1), (4, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (6, 1), (12, 2), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(1, 1), (5, 2), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 14. -/
theorem ep_Q2_008_partial_14_0036_valid :
    mulPoly ep_Q2_008_coefficient_14_0036
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0037 : Poly :=
[
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 14. -/
def ep_Q2_008_partial_14_0037 : Poly :=
[
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 14. -/
theorem ep_Q2_008_partial_14_0037_valid :
    mulPoly ep_Q2_008_coefficient_14_0037
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0038 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 38 for generator 14. -/
def ep_Q2_008_partial_14_0038 : Poly :=
[
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 3), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 14. -/
theorem ep_Q2_008_partial_14_0038_valid :
    mulPoly ep_Q2_008_coefficient_14_0038
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0039 : Poly :=
[
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 14. -/
def ep_Q2_008_partial_14_0039 : Poly :=
[
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 14. -/
theorem ep_Q2_008_partial_14_0039_valid :
    mulPoly ep_Q2_008_coefficient_14_0039
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0040 : Poly :=
[
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 40 for generator 14. -/
def ep_Q2_008_partial_14_0040 : Poly :=
[
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (12, 2), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 14. -/
theorem ep_Q2_008_partial_14_0040_valid :
    mulPoly ep_Q2_008_coefficient_14_0040
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0041 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 14. -/
def ep_Q2_008_partial_14_0041 : Poly :=
[
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (6, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 14. -/
theorem ep_Q2_008_partial_14_0041_valid :
    mulPoly ep_Q2_008_coefficient_14_0041
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0042 : Poly :=
[
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 14. -/
def ep_Q2_008_partial_14_0042 : Poly :=
[
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (6, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 14. -/
theorem ep_Q2_008_partial_14_0042_valid :
    mulPoly ep_Q2_008_coefficient_14_0042
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0043 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 43 for generator 14. -/
def ep_Q2_008_partial_14_0043 : Poly :=
[
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 14. -/
theorem ep_Q2_008_partial_14_0043_valid :
    mulPoly ep_Q2_008_coefficient_14_0043
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0044 : Poly :=
[
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 14. -/
def ep_Q2_008_partial_14_0044 : Poly :=
[
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 14. -/
theorem ep_Q2_008_partial_14_0044_valid :
    mulPoly ep_Q2_008_coefficient_14_0044
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0045 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 45 for generator 14. -/
def ep_Q2_008_partial_14_0045 : Poly :=
[
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (11, 1), (13, 3), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 14. -/
theorem ep_Q2_008_partial_14_0045_valid :
    mulPoly ep_Q2_008_coefficient_14_0045
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0046 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 14. -/
def ep_Q2_008_partial_14_0046 : Poly :=
[
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 14. -/
theorem ep_Q2_008_partial_14_0046_valid :
    mulPoly ep_Q2_008_coefficient_14_0046
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0047 : Poly :=
[
  term ((-3722972841105519375 : Rat) / 1385912907228352718) [(1, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 47 for generator 14. -/
def ep_Q2_008_partial_14_0047 : Poly :=
[
  term ((-3722972841105519375 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3722972841105519375 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((3722972841105519375 : Rat) / 1385912907228352718) [(1, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((3722972841105519375 : Rat) / 1385912907228352718) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 14. -/
theorem ep_Q2_008_partial_14_0047_valid :
    mulPoly ep_Q2_008_coefficient_14_0047
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0048 : Poly :=
[
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 48 for generator 14. -/
def ep_Q2_008_partial_14_0048 : Poly :=
[
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 14. -/
theorem ep_Q2_008_partial_14_0048_valid :
    mulPoly ep_Q2_008_coefficient_14_0048
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0049 : Poly :=
[
  term ((18503295057505502460 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 49 for generator 14. -/
def ep_Q2_008_partial_14_0049 : Poly :=
[
  term ((37006590115011004920 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((37006590115011004920 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((-18503295057505502460 : Rat) / 692956453614176359) [(1, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((-18503295057505502460 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 14. -/
theorem ep_Q2_008_partial_14_0049_valid :
    mulPoly ep_Q2_008_coefficient_14_0049
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0050 : Poly :=
[
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 14. -/
def ep_Q2_008_partial_14_0050 : Poly :=
[
  term ((-23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 14. -/
theorem ep_Q2_008_partial_14_0050_valid :
    mulPoly ep_Q2_008_coefficient_14_0050
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0051 : Poly :=
[
  term ((-55086151861948831347085925295141498034575 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 14. -/
def ep_Q2_008_partial_14_0051 : Poly :=
[
  term ((-110172303723897662694171850590282996069150 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-110172303723897662694171850590282996069150 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((55086151861948831347085925295141498034575 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((55086151861948831347085925295141498034575 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 14. -/
theorem ep_Q2_008_partial_14_0051_valid :
    mulPoly ep_Q2_008_coefficient_14_0051
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0052 : Poly :=
[
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 14. -/
def ep_Q2_008_partial_14_0052 : Poly :=
[
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 14. -/
theorem ep_Q2_008_partial_14_0052_valid :
    mulPoly ep_Q2_008_coefficient_14_0052
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0053 : Poly :=
[
  term ((-53595523924267500 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 53 for generator 14. -/
def ep_Q2_008_partial_14_0053 : Poly :=
[
  term ((-107191047848535000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 14. -/
theorem ep_Q2_008_partial_14_0053_valid :
    mulPoly ep_Q2_008_coefficient_14_0053
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0054 : Poly :=
[
  term ((-771775544509452000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 54 for generator 14. -/
def ep_Q2_008_partial_14_0054 : Poly :=
[
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 14. -/
theorem ep_Q2_008_partial_14_0054_valid :
    mulPoly ep_Q2_008_coefficient_14_0054
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0055 : Poly :=
[
  term ((17130404942363202586811880902664874663500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 55 for generator 14. -/
def ep_Q2_008_partial_14_0055 : Poly :=
[
  term ((34260809884726405173623761805329749327000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((34260809884726405173623761805329749327000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17130404942363202586811880902664874663500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-17130404942363202586811880902664874663500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 14. -/
theorem ep_Q2_008_partial_14_0055_valid :
    mulPoly ep_Q2_008_coefficient_14_0055
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0056 : Poly :=
[
  term ((107191047848535000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 56 for generator 14. -/
def ep_Q2_008_partial_14_0056 : Poly :=
[
  term ((214382095697070000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((214382095697070000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 14. -/
theorem ep_Q2_008_partial_14_0056_valid :
    mulPoly ep_Q2_008_coefficient_14_0056
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0057 : Poly :=
[
  term ((-214382095697070000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 57 for generator 14. -/
def ep_Q2_008_partial_14_0057 : Poly :=
[
  term ((-428764191394140000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((-428764191394140000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((214382095697070000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((214382095697070000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 14. -/
theorem ep_Q2_008_partial_14_0057_valid :
    mulPoly ep_Q2_008_coefficient_14_0057
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0058 : Poly :=
[
  term ((-15848198312452129318144349585987493570000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 14. -/
def ep_Q2_008_partial_14_0058 : Poly :=
[
  term ((-31696396624904258636288699171974987140000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((-31696396624904258636288699171974987140000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15848198312452129318144349585987493570000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((15848198312452129318144349585987493570000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 14. -/
theorem ep_Q2_008_partial_14_0058_valid :
    mulPoly ep_Q2_008_coefficient_14_0058
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0059 : Poly :=
[
  term ((-13913915216527654983 : Rat) / 2771825814456705436) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 59 for generator 14. -/
def ep_Q2_008_partial_14_0059 : Poly :=
[
  term ((-13913915216527654983 : Rat) / 1385912907228352718) [(1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-13913915216527654983 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((13913915216527654983 : Rat) / 2771825814456705436) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((13913915216527654983 : Rat) / 2771825814456705436) [(1, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 14. -/
theorem ep_Q2_008_partial_14_0059_valid :
    mulPoly ep_Q2_008_coefficient_14_0059
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0060 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 14. -/
def ep_Q2_008_partial_14_0060 : Poly :=
[
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 14. -/
theorem ep_Q2_008_partial_14_0060_valid :
    mulPoly ep_Q2_008_coefficient_14_0060
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0061 : Poly :=
[
  term ((47248099071125889119474467552337389638000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 14. -/
def ep_Q2_008_partial_14_0061 : Poly :=
[
  term ((94496198142251778238948935104674779276000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((94496198142251778238948935104674779276000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47248099071125889119474467552337389638000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-47248099071125889119474467552337389638000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 14. -/
theorem ep_Q2_008_partial_14_0061_valid :
    mulPoly ep_Q2_008_coefficient_14_0061
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0062 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 14. -/
def ep_Q2_008_partial_14_0062 : Poly :=
[
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 14. -/
theorem ep_Q2_008_partial_14_0062_valid :
    mulPoly ep_Q2_008_coefficient_14_0062
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0063 : Poly :=
[
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (16, 1)]
]

/-- Partial product 63 for generator 14. -/
def ep_Q2_008_partial_14_0063 : Poly :=
[
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (4, 1), (12, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (12, 2), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 14. -/
theorem ep_Q2_008_partial_14_0063_valid :
    mulPoly ep_Q2_008_coefficient_14_0063
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0064 : Poly :=
[
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 14. -/
def ep_Q2_008_partial_14_0064 : Poly :=
[
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 14. -/
theorem ep_Q2_008_partial_14_0064_valid :
    mulPoly ep_Q2_008_coefficient_14_0064
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0065 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 65 for generator 14. -/
def ep_Q2_008_partial_14_0065 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 3), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 14. -/
theorem ep_Q2_008_partial_14_0065_valid :
    mulPoly ep_Q2_008_coefficient_14_0065
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0066 : Poly :=
[
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 66 for generator 14. -/
def ep_Q2_008_partial_14_0066 : Poly :=
[
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 14. -/
theorem ep_Q2_008_partial_14_0066_valid :
    mulPoly ep_Q2_008_coefficient_14_0066
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0067 : Poly :=
[
  term ((112946619420168484731719015885673600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 14. -/
def ep_Q2_008_partial_14_0067 : Poly :=
[
  term ((225893238840336969463438031771347200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-112946619420168484731719015885673600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-112946619420168484731719015885673600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((225893238840336969463438031771347200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 14. -/
theorem ep_Q2_008_partial_14_0067_valid :
    mulPoly ep_Q2_008_coefficient_14_0067
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0068 : Poly :=
[
  term ((-43185472131240891220951388426875200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 14. -/
def ep_Q2_008_partial_14_0068 : Poly :=
[
  term ((-86370944262481782441902776853750400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((43185472131240891220951388426875200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((43185472131240891220951388426875200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-86370944262481782441902776853750400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 14. -/
theorem ep_Q2_008_partial_14_0068_valid :
    mulPoly ep_Q2_008_coefficient_14_0068
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0069 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 69 for generator 14. -/
def ep_Q2_008_partial_14_0069 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 3), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 14. -/
theorem ep_Q2_008_partial_14_0069_valid :
    mulPoly ep_Q2_008_coefficient_14_0069
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0070 : Poly :=
[
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 14. -/
def ep_Q2_008_partial_14_0070 : Poly :=
[
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 14. -/
theorem ep_Q2_008_partial_14_0070_valid :
    mulPoly ep_Q2_008_coefficient_14_0070
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0071 : Poly :=
[
  term ((37673902904765847909 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (13, 2), (16, 1)]
]

/-- Partial product 71 for generator 14. -/
def ep_Q2_008_partial_14_0071 : Poly :=
[
  term ((37673902904765847909 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((-37673902904765847909 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (12, 2), (13, 2), (16, 1)],
  term ((-37673902904765847909 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (13, 4), (16, 1)],
  term ((37673902904765847909 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 14. -/
theorem ep_Q2_008_partial_14_0071_valid :
    mulPoly ep_Q2_008_coefficient_14_0071
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0072 : Poly :=
[
  term ((-93529739645080482993 : Rat) / 22174606515653643488) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 72 for generator 14. -/
def ep_Q2_008_partial_14_0072 : Poly :=
[
  term ((-93529739645080482993 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (5, 1), (12, 1), (16, 1)],
  term ((93529739645080482993 : Rat) / 22174606515653643488) [(3, 1), (5, 1), (12, 2), (16, 1)],
  term ((93529739645080482993 : Rat) / 22174606515653643488) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-93529739645080482993 : Rat) / 11087303257826821744) [(3, 1), (5, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 14. -/
theorem ep_Q2_008_partial_14_0072_valid :
    mulPoly ep_Q2_008_coefficient_14_0072
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0073 : Poly :=
[
  term ((-3049336587242167208026027426915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 73 for generator 14. -/
def ep_Q2_008_partial_14_0073 : Poly :=
[
  term ((-6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((3049336587242167208026027426915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3049336587242167208026027426915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 14. -/
theorem ep_Q2_008_partial_14_0073_valid :
    mulPoly ep_Q2_008_coefficient_14_0073
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0074 : Poly :=
[
  term ((38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 74 for generator 14. -/
def ep_Q2_008_partial_14_0074 : Poly :=
[
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 14. -/
theorem ep_Q2_008_partial_14_0074_valid :
    mulPoly ep_Q2_008_coefficient_14_0074
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0075 : Poly :=
[
  term ((13398880981066875 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 75 for generator 14. -/
def ep_Q2_008_partial_14_0075 : Poly :=
[
  term ((26797761962133750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((26797761962133750 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13398880981066875 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((-13398880981066875 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 14. -/
theorem ep_Q2_008_partial_14_0075_valid :
    mulPoly ep_Q2_008_coefficient_14_0075
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0076 : Poly :=
[
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 76 for generator 14. -/
def ep_Q2_008_partial_14_0076 : Poly :=
[
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 14. -/
theorem ep_Q2_008_partial_14_0076_valid :
    mulPoly ep_Q2_008_coefficient_14_0076
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0077 : Poly :=
[
  term ((3268330423722587349 : Rat) / 5543651628913410872) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 77 for generator 14. -/
def ep_Q2_008_partial_14_0077 : Poly :=
[
  term ((3268330423722587349 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((3268330423722587349 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((-3268330423722587349 : Rat) / 5543651628913410872) [(3, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3268330423722587349 : Rat) / 5543651628913410872) [(3, 1), (6, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 14. -/
theorem ep_Q2_008_partial_14_0077_valid :
    mulPoly ep_Q2_008_coefficient_14_0077
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0078 : Poly :=
[
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 14. -/
def ep_Q2_008_partial_14_0078 : Poly :=
[
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 14. -/
theorem ep_Q2_008_partial_14_0078_valid :
    mulPoly ep_Q2_008_coefficient_14_0078
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0079 : Poly :=
[
  term ((-578670372372834008316150537848699291182521 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 14. -/
def ep_Q2_008_partial_14_0079 : Poly :=
[
  term ((-578670372372834008316150537848699291182521 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-578670372372834008316150537848699291182521 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((578670372372834008316150537848699291182521 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((578670372372834008316150537848699291182521 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 14. -/
theorem ep_Q2_008_partial_14_0079_valid :
    mulPoly ep_Q2_008_coefficient_14_0079
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0080 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 80 for generator 14. -/
def ep_Q2_008_partial_14_0080 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 14. -/
theorem ep_Q2_008_partial_14_0080_valid :
    mulPoly ep_Q2_008_coefficient_14_0080
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0081 : Poly :=
[
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 81 for generator 14. -/
def ep_Q2_008_partial_14_0081 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 1), (4, 1), (7, 1), (12, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 14. -/
theorem ep_Q2_008_partial_14_0081_valid :
    mulPoly ep_Q2_008_coefficient_14_0081
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0082 : Poly :=
[
  term ((88946468264049184512707656424232796663806 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 14. -/
def ep_Q2_008_partial_14_0082 : Poly :=
[
  term ((177892936528098369025415312848465593327612 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((177892936528098369025415312848465593327612 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-88946468264049184512707656424232796663806 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-88946468264049184512707656424232796663806 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 14. -/
theorem ep_Q2_008_partial_14_0082_valid :
    mulPoly ep_Q2_008_coefficient_14_0082
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0083 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 83 for generator 14. -/
def ep_Q2_008_partial_14_0083 : Poly :=
[
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 14. -/
theorem ep_Q2_008_partial_14_0083_valid :
    mulPoly ep_Q2_008_coefficient_14_0083
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0084 : Poly :=
[
  term ((-2554572896850671361 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 84 for generator 14. -/
def ep_Q2_008_partial_14_0084 : Poly :=
[
  term ((-2554572896850671361 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2554572896850671361 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term ((2554572896850671361 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term ((2554572896850671361 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 14. -/
theorem ep_Q2_008_partial_14_0084_valid :
    mulPoly ep_Q2_008_coefficient_14_0084
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0085 : Poly :=
[
  term ((-6451787024429711869286106363206568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 85 for generator 14. -/
def ep_Q2_008_partial_14_0085 : Poly :=
[
  term ((-12903574048859423738572212726413136000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-12903574048859423738572212726413136000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((6451787024429711869286106363206568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((6451787024429711869286106363206568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 14. -/
theorem ep_Q2_008_partial_14_0085_valid :
    mulPoly ep_Q2_008_coefficient_14_0085
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0086 : Poly :=
[
  term ((-143787214753131529420840237722386400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 86 for generator 14. -/
def ep_Q2_008_partial_14_0086 : Poly :=
[
  term ((-287574429506263058841680475444772800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-287574429506263058841680475444772800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((143787214753131529420840237722386400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((143787214753131529420840237722386400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 14. -/
theorem ep_Q2_008_partial_14_0086_valid :
    mulPoly ep_Q2_008_coefficient_14_0086
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0087 : Poly :=
[
  term ((50309899402336370385 : Rat) / 22174606515653643488) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 87 for generator 14. -/
def ep_Q2_008_partial_14_0087 : Poly :=
[
  term ((50309899402336370385 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (7, 1), (12, 1), (16, 1)],
  term ((50309899402336370385 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-50309899402336370385 : Rat) / 22174606515653643488) [(3, 1), (7, 1), (12, 2), (16, 1)],
  term ((-50309899402336370385 : Rat) / 22174606515653643488) [(3, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 14. -/
theorem ep_Q2_008_partial_14_0087_valid :
    mulPoly ep_Q2_008_coefficient_14_0087
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0088 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 14. -/
def ep_Q2_008_partial_14_0088 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 14. -/
theorem ep_Q2_008_partial_14_0088_valid :
    mulPoly ep_Q2_008_coefficient_14_0088
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0089 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 89 for generator 14. -/
def ep_Q2_008_partial_14_0089 : Poly :=
[
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 14. -/
theorem ep_Q2_008_partial_14_0089_valid :
    mulPoly ep_Q2_008_coefficient_14_0089
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0090 : Poly :=
[
  term ((-177689487623469067969675598208124800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 90 for generator 14. -/
def ep_Q2_008_partial_14_0090 : Poly :=
[
  term ((-355378975246938135939351196416249600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-355378975246938135939351196416249600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((177689487623469067969675598208124800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((177689487623469067969675598208124800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 14. -/
theorem ep_Q2_008_partial_14_0090_valid :
    mulPoly ep_Q2_008_coefficient_14_0090
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0091 : Poly :=
[
  term ((112458590937662839869507344829489600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 91 for generator 14. -/
def ep_Q2_008_partial_14_0091 : Poly :=
[
  term ((224917181875325679739014689658979200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((224917181875325679739014689658979200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-112458590937662839869507344829489600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-112458590937662839869507344829489600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 14. -/
theorem ep_Q2_008_partial_14_0091_valid :
    mulPoly ep_Q2_008_coefficient_14_0091
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0092 : Poly :=
[
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 14. -/
def ep_Q2_008_partial_14_0092 : Poly :=
[
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 14. -/
theorem ep_Q2_008_partial_14_0092_valid :
    mulPoly ep_Q2_008_coefficient_14_0092
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0093 : Poly :=
[
  term ((-46883191288141800 : Rat) / 692956453614176359) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 93 for generator 14. -/
def ep_Q2_008_partial_14_0093 : Poly :=
[
  term ((-93766382576283600 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (12, 1), (16, 1)],
  term ((-93766382576283600 : Rat) / 692956453614176359) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(3, 1), (9, 1), (12, 2), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(3, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 14. -/
theorem ep_Q2_008_partial_14_0093_valid :
    mulPoly ep_Q2_008_coefficient_14_0093
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0094 : Poly :=
[
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 94 for generator 14. -/
def ep_Q2_008_partial_14_0094 : Poly :=
[
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 14. -/
theorem ep_Q2_008_partial_14_0094_valid :
    mulPoly ep_Q2_008_coefficient_14_0094
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0095 : Poly :=
[
  term ((-277392475067817375 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 95 for generator 14. -/
def ep_Q2_008_partial_14_0095 : Poly :=
[
  term ((-554784950135634750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-554784950135634750 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((277392475067817375 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((277392475067817375 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 14. -/
theorem ep_Q2_008_partial_14_0095_valid :
    mulPoly ep_Q2_008_coefficient_14_0095
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0096 : Poly :=
[
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 96 for generator 14. -/
def ep_Q2_008_partial_14_0096 : Poly :=
[
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 14. -/
theorem ep_Q2_008_partial_14_0096_valid :
    mulPoly ep_Q2_008_coefficient_14_0096
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0097 : Poly :=
[
  term ((583133257600358916882200864851637530975125 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 97 for generator 14. -/
def ep_Q2_008_partial_14_0097 : Poly :=
[
  term ((1166266515200717833764401729703275061950250 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1166266515200717833764401729703275061950250 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-583133257600358916882200864851637530975125 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-583133257600358916882200864851637530975125 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 14. -/
theorem ep_Q2_008_partial_14_0097_valid :
    mulPoly ep_Q2_008_coefficient_14_0097
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0098 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 98 for generator 14. -/
def ep_Q2_008_partial_14_0098 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 14. -/
theorem ep_Q2_008_partial_14_0098_valid :
    mulPoly ep_Q2_008_coefficient_14_0098
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0099 : Poly :=
[
  term ((-2382276856869612000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 99 for generator 14. -/
def ep_Q2_008_partial_14_0099 : Poly :=
[
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2382276856869612000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((2382276856869612000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 14. -/
theorem ep_Q2_008_partial_14_0099_valid :
    mulPoly ep_Q2_008_coefficient_14_0099
        ep_Q2_008_generator_14_0000_0099 =
      ep_Q2_008_partial_14_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_14_0000_0099 : List Poly :=
[
  ep_Q2_008_partial_14_0000,
  ep_Q2_008_partial_14_0001,
  ep_Q2_008_partial_14_0002,
  ep_Q2_008_partial_14_0003,
  ep_Q2_008_partial_14_0004,
  ep_Q2_008_partial_14_0005,
  ep_Q2_008_partial_14_0006,
  ep_Q2_008_partial_14_0007,
  ep_Q2_008_partial_14_0008,
  ep_Q2_008_partial_14_0009,
  ep_Q2_008_partial_14_0010,
  ep_Q2_008_partial_14_0011,
  ep_Q2_008_partial_14_0012,
  ep_Q2_008_partial_14_0013,
  ep_Q2_008_partial_14_0014,
  ep_Q2_008_partial_14_0015,
  ep_Q2_008_partial_14_0016,
  ep_Q2_008_partial_14_0017,
  ep_Q2_008_partial_14_0018,
  ep_Q2_008_partial_14_0019,
  ep_Q2_008_partial_14_0020,
  ep_Q2_008_partial_14_0021,
  ep_Q2_008_partial_14_0022,
  ep_Q2_008_partial_14_0023,
  ep_Q2_008_partial_14_0024,
  ep_Q2_008_partial_14_0025,
  ep_Q2_008_partial_14_0026,
  ep_Q2_008_partial_14_0027,
  ep_Q2_008_partial_14_0028,
  ep_Q2_008_partial_14_0029,
  ep_Q2_008_partial_14_0030,
  ep_Q2_008_partial_14_0031,
  ep_Q2_008_partial_14_0032,
  ep_Q2_008_partial_14_0033,
  ep_Q2_008_partial_14_0034,
  ep_Q2_008_partial_14_0035,
  ep_Q2_008_partial_14_0036,
  ep_Q2_008_partial_14_0037,
  ep_Q2_008_partial_14_0038,
  ep_Q2_008_partial_14_0039,
  ep_Q2_008_partial_14_0040,
  ep_Q2_008_partial_14_0041,
  ep_Q2_008_partial_14_0042,
  ep_Q2_008_partial_14_0043,
  ep_Q2_008_partial_14_0044,
  ep_Q2_008_partial_14_0045,
  ep_Q2_008_partial_14_0046,
  ep_Q2_008_partial_14_0047,
  ep_Q2_008_partial_14_0048,
  ep_Q2_008_partial_14_0049,
  ep_Q2_008_partial_14_0050,
  ep_Q2_008_partial_14_0051,
  ep_Q2_008_partial_14_0052,
  ep_Q2_008_partial_14_0053,
  ep_Q2_008_partial_14_0054,
  ep_Q2_008_partial_14_0055,
  ep_Q2_008_partial_14_0056,
  ep_Q2_008_partial_14_0057,
  ep_Q2_008_partial_14_0058,
  ep_Q2_008_partial_14_0059,
  ep_Q2_008_partial_14_0060,
  ep_Q2_008_partial_14_0061,
  ep_Q2_008_partial_14_0062,
  ep_Q2_008_partial_14_0063,
  ep_Q2_008_partial_14_0064,
  ep_Q2_008_partial_14_0065,
  ep_Q2_008_partial_14_0066,
  ep_Q2_008_partial_14_0067,
  ep_Q2_008_partial_14_0068,
  ep_Q2_008_partial_14_0069,
  ep_Q2_008_partial_14_0070,
  ep_Q2_008_partial_14_0071,
  ep_Q2_008_partial_14_0072,
  ep_Q2_008_partial_14_0073,
  ep_Q2_008_partial_14_0074,
  ep_Q2_008_partial_14_0075,
  ep_Q2_008_partial_14_0076,
  ep_Q2_008_partial_14_0077,
  ep_Q2_008_partial_14_0078,
  ep_Q2_008_partial_14_0079,
  ep_Q2_008_partial_14_0080,
  ep_Q2_008_partial_14_0081,
  ep_Q2_008_partial_14_0082,
  ep_Q2_008_partial_14_0083,
  ep_Q2_008_partial_14_0084,
  ep_Q2_008_partial_14_0085,
  ep_Q2_008_partial_14_0086,
  ep_Q2_008_partial_14_0087,
  ep_Q2_008_partial_14_0088,
  ep_Q2_008_partial_14_0089,
  ep_Q2_008_partial_14_0090,
  ep_Q2_008_partial_14_0091,
  ep_Q2_008_partial_14_0092,
  ep_Q2_008_partial_14_0093,
  ep_Q2_008_partial_14_0094,
  ep_Q2_008_partial_14_0095,
  ep_Q2_008_partial_14_0096,
  ep_Q2_008_partial_14_0097,
  ep_Q2_008_partial_14_0098,
  ep_Q2_008_partial_14_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_14_0000_0099 : Poly :=
[
  term ((95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (5, 1), (13, 2), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (11, 1), (13, 2), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (13, 3), (16, 1)],
  term ((-398345591271509885135193070152794112000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-398345591271509885135193070152794112000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(0, 1), (4, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (4, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((3722972841105519375 : Rat) / 692956453614176359) [(0, 1), (4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-37006590115011004920 : Rat) / 692956453614176359) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((110172303723897662694171850590282996069150 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (4, 1), (7, 2), (12, 1), (13, 2), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(0, 1), (4, 1), (7, 2), (12, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(0, 1), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((4416271171359642000 : Rat) / 692956453614176359) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-101669038533592622398334331208284765568200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((11910116427615000 : Rat) / 692956453614176359) [(0, 1), (4, 1), (11, 2), (12, 1), (16, 1)],
  term ((31026451766856719284015874463081651588000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((99586397817877471283798267538198528000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-11026902994473778983 : Rat) / 1385912907228352718) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((3722972841105519375 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 3), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((110172303723897662694171850590282996069150 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-174568518104999357337 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (13, 4), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-200206112092177786095165800731372800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 2), (13, 3), (16, 1)],
  term ((44628070862672887622756337402167347200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 4), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 3), (13, 3), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-101669038533592622398334331208284765568200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4416271171359642000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((11910116427615000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (11, 2), (13, 1), (16, 1)],
  term ((99586397817877471283798267538198528000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11026902994473778983 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((31026451766856719284015874463081651588000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(0, 1), (5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (5, 2), (7, 1), (13, 3), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 2), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 1), (13, 3), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-3722972841105519375 : Rat) / 1385912907228352718) [(0, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-3722972841105519375 : Rat) / 1385912907228352718) [(0, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (13, 4), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (11, 1), (13, 5), (15, 1), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((18503295057505502460 : Rat) / 692956453614176359) [(0, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-55086151861948831347085925295141498034575 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-55086151861948831347085925295141498034575 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((18503295057505502460 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 3), (16, 1)],
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(0, 1), (7, 2), (12, 2), (13, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(0, 1), (7, 2), (12, 2), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(0, 1), (7, 2), (13, 2), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(0, 1), (7, 2), (13, 4), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 5), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (12, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 4), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(0, 1), (10, 1), (12, 2), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2208135585679821000 : Rat) / 692956453614176359) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((50834519266796311199167165604142382784100 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((50834519266796311199167165604142382784100 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2208135585679821000 : Rat) / 692956453614176359) [(0, 1), (11, 1), (13, 3), (16, 1)],
  term ((-5955058213807500 : Rat) / 692956453614176359) [(0, 1), (11, 2), (12, 2), (16, 1)],
  term ((-5955058213807500 : Rat) / 692956453614176359) [(0, 1), (11, 2), (13, 2), (16, 1)],
  term ((-15513225883428359642007937231540825794000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-49793198908938735641899133769099264000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((11026902994473778983 : Rat) / 2771825814456705436) [(0, 1), (12, 2), (16, 1)],
  term ((-49793198908938735641899133769099264000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((11026902994473778983 : Rat) / 2771825814456705436) [(0, 1), (13, 2), (16, 1)],
  term ((-15513225883428359642007937231540825794000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (12, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((257258514836484000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((257258514836484000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (4, 1), (5, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(1, 1), (4, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (6, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (6, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3722972841105519375 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((37006590115011004920 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-110172303723897662694171850590282996069150 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((34260809884726405173623761805329749327000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-428764191394140000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((214382095697070000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((-13913915216527654983 : Rat) / 1385912907228352718) [(1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((94496198142251778238948935104674779276000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-31696396624904258636288699171974987140000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((200206112092177786095165800731372800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 3), (16, 1)],
  term ((-44628070862672887622756337402167347200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((-3722972841105519375 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (11, 1), (13, 3), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (12, 2), (13, 2), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (6, 1), (12, 2), (16, 1)],
  term ((-110172303723897662694171850590282996069150 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((174568518104999357337 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((-23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 4), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((34260809884726405173623761805329749327000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((214382095697070000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-428764191394140000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-31696396624904258636288699171974987140000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((94496198142251778238948935104674779276000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13913915216527654983 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 2), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 2), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(1, 1), (5, 2), (6, 1), (13, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (5, 2), (6, 1), (13, 3), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (12, 2), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 4), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 5), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 4), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (13, 3), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((3722972841105519375 : Rat) / 1385912907228352718) [(1, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((3722972841105519375 : Rat) / 1385912907228352718) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 4), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (13, 5), (15, 1), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-18503295057505502460 : Rat) / 692956453614176359) [(1, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((55086151861948831347085925295141498034575 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((55086151861948831347085925295141498034575 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 3), (15, 2), (16, 1)],
  term ((-18503295057505502460 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 3), (16, 1)],
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 4), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-17130404942363202586811880902664874663500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-17130404942363202586811880902664874663500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (13, 3), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((214382095697070000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 3), (16, 1)],
  term ((214382095697070000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((15848198312452129318144349585987493570000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((13913915216527654983 : Rat) / 2771825814456705436) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-47248099071125889119474467552337389638000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((15848198312452129318144349585987493570000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 3), (15, 1), (16, 1)],
  term ((-47248099071125889119474467552337389638000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((13913915216527654983 : Rat) / 2771825814456705436) [(1, 1), (13, 3), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 4), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (4, 1), (12, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (12, 2), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (13, 2), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (13, 3), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((225893238840336969463438031771347200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-86370944262481782441902776853750400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((37673902904765847909 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((-93529739645080482993 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (5, 1), (12, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 2), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((26797761962133750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3268330423722587349 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-578670372372834008316150537848699291182521 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((177892936528098369025415312848465593327612 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2554572896850671361 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-12903574048859423738572212726413136000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-287574429506263058841680475444772800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((50309899402336370385 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (7, 1), (12, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 1), (4, 1), (7, 1), (12, 2), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-355378975246938135939351196416249600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((224917181875325679739014689658979200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-93766382576283600 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (12, 1), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-554784950135634750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1166266515200717833764401729703275061950250 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((26797761962133750 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-578670372372834008316150537848699291182521 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((3268330423722587349 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7438011810445481270459389567027891200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-112946619420168484731719015885673600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((43185472131240891220951388426875200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 3), (15, 1), (16, 1)],
  term ((-287574429506263058841680475444772800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((50309899402336370385 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((177894188906790175011260720438729972708412 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((29752047241781925081837558268111564800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-2554572896850671361 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term ((-13016520668279592223303931742298809600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((224917181875325679739014689658979200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-355378975246938135939351196416249600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-93766382576283600 : Rat) / 692956453614176359) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((1166266515200717833764401729703275061950250 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-554784950135634750 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-37673902904765847909 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (12, 2), (13, 2), (16, 1)],
  term ((93529739645080482993 : Rat) / 22174606515653643488) [(3, 1), (5, 1), (12, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 3), (16, 1)],
  term ((93529739645080482993 : Rat) / 22174606515653643488) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((-37673902904765847909 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (13, 4), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-86370944262481782441902776853750400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((225893238840336969463438031771347200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((-93529739645080482993 : Rat) / 11087303257826821744) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((37673902904765847909 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 3), (16, 1)],
  term ((3049336587242167208026027426915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((3049336587242167208026027426915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-13398880981066875 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((-13398880981066875 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3268330423722587349 : Rat) / 5543651628913410872) [(3, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((578670372372834008316150537848699291182521 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((578670372372834008316150537848699291182521 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3268330423722587349 : Rat) / 5543651628913410872) [(3, 1), (6, 1), (13, 3), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 4), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-88946468264049184512707656424232796663806 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((2554572896850671361 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term ((6451787024429711869286106363206568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((143787214753131529420840237722386400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-50309899402336370385 : Rat) / 22174606515653643488) [(3, 1), (7, 1), (12, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (12, 3), (16, 1)],
  term ((143787214753131529420840237722386400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-50309899402336370385 : Rat) / 22174606515653643488) [(3, 1), (7, 1), (13, 2), (16, 1)],
  term ((-88946468264049184512707656424232796663806 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((2554572896850671361 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (13, 4), (16, 1)],
  term ((6451787024429711869286106363206568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 5), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((177689487623469067969675598208124800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-112458590937662839869507344829489600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 3), (15, 1), (16, 1)],
  term ((-112458590937662839869507344829489600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((177689487623469067969675598208124800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 4), (15, 1), (16, 1)],
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(3, 1), (9, 1), (12, 2), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(3, 1), (9, 1), (13, 2), (16, 1)],
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((277392475067817375 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-583133257600358916882200864851637530975125 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-583133257600358916882200864851637530975125 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((277392475067817375 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 3), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((2382276856869612000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((2382276856869612000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 0 through 99. -/
theorem ep_Q2_008_block_14_0000_0099_valid :
    checkProductSumEq ep_Q2_008_partials_14_0000_0099
      ep_Q2_008_block_14_0000_0099 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
