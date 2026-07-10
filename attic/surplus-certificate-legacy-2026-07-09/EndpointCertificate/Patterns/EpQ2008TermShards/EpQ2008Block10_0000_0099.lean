/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 10:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 10 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_10_0000_0099 : Poly :=
[
  term (2 : Rat) [(2, 1), (4, 1)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0000 : Poly :=
[
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 10. -/
def ep_Q2_008_partial_10_0000 : Poly :=
[
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 10. -/
theorem ep_Q2_008_partial_10_0000_valid :
    mulPoly ep_Q2_008_coefficient_10_0000
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0001 : Poly :=
[
  term ((-53595523924267500 : Rat) / 692956453614176359) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 10. -/
def ep_Q2_008_partial_10_0001 : Poly :=
[
  term ((-107191047848535000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (5, 2), (11, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(0, 1), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(0, 1), (5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 10. -/
theorem ep_Q2_008_partial_10_0001_valid :
    mulPoly ep_Q2_008_coefficient_10_0001
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0002 : Poly :=
[
  term ((17037608526214725852206523426095189671500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 10. -/
def ep_Q2_008_partial_10_0002 : Poly :=
[
  term ((34075217052429451704413046852190379343000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((34075217052429451704413046852190379343000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-17037608526214725852206523426095189671500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-17037608526214725852206523426095189671500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 10. -/
theorem ep_Q2_008_partial_10_0002_valid :
    mulPoly ep_Q2_008_coefficient_10_0002
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0003 : Poly :=
[
  term ((199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 10. -/
def ep_Q2_008_partial_10_0003 : Poly :=
[
  term ((398345591271509885135193070152794112000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((398345591271509885135193070152794112000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 10. -/
theorem ep_Q2_008_partial_10_0003_valid :
    mulPoly ep_Q2_008_coefficient_10_0003
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0004 : Poly :=
[
  term ((385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 4 for generator 10. -/
def ep_Q2_008_partial_10_0004 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (3, 1), (4, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 2), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 10. -/
theorem ep_Q2_008_partial_10_0004_valid :
    mulPoly ep_Q2_008_coefficient_10_0004
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0005 : Poly :=
[
  term ((53595523924267500 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 10. -/
def ep_Q2_008_partial_10_0005 : Poly :=
[
  term ((107191047848535000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (4, 2), (11, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(1, 1), (4, 1), (5, 2), (11, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(1, 1), (4, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 10. -/
theorem ep_Q2_008_partial_10_0005_valid :
    mulPoly ep_Q2_008_coefficient_10_0005
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0006 : Poly :=
[
  term ((-17037608526214725852206523426095189671500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 10. -/
def ep_Q2_008_partial_10_0006 : Poly :=
[
  term ((-34075217052429451704413046852190379343000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (4, 2), (15, 1), (16, 1)],
  term ((-34075217052429451704413046852190379343000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((17037608526214725852206523426095189671500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((17037608526214725852206523426095189671500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 10. -/
theorem ep_Q2_008_partial_10_0006_valid :
    mulPoly ep_Q2_008_coefficient_10_0006
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0007 : Poly :=
[
  term ((53595523924267500 : Rat) / 692956453614176359) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 7 for generator 10. -/
def ep_Q2_008_partial_10_0007 : Poly :=
[
  term ((107191047848535000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(1, 1), (5, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 10. -/
theorem ep_Q2_008_partial_10_0007_valid :
    mulPoly ep_Q2_008_coefficient_10_0007
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0008 : Poly :=
[
  term ((257258514836484000 : Rat) / 692956453614176359) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 8 for generator 10. -/
def ep_Q2_008_partial_10_0008 : Poly :=
[
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-257258514836484000 : Rat) / 692956453614176359) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((-257258514836484000 : Rat) / 692956453614176359) [(1, 1), (5, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 10. -/
theorem ep_Q2_008_partial_10_0008_valid :
    mulPoly ep_Q2_008_coefficient_10_0008
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0009 : Poly :=
[
  term ((-17037608526214725852206523426095189671500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 10. -/
def ep_Q2_008_partial_10_0009 : Poly :=
[
  term ((-34075217052429451704413046852190379343000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-34075217052429451704413046852190379343000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((17037608526214725852206523426095189671500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((17037608526214725852206523426095189671500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 10. -/
theorem ep_Q2_008_partial_10_0009_valid :
    mulPoly ep_Q2_008_coefficient_10_0009
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0010 : Poly :=
[
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 10. -/
def ep_Q2_008_partial_10_0010 : Poly :=
[
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 3), (15, 1), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 10. -/
theorem ep_Q2_008_partial_10_0010_valid :
    mulPoly ep_Q2_008_coefficient_10_0010
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0011 : Poly :=
[
  term ((193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 10. -/
def ep_Q2_008_partial_10_0011 : Poly :=
[
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 3), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 10. -/
theorem ep_Q2_008_partial_10_0011_valid :
    mulPoly ep_Q2_008_coefficient_10_0011
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0012 : Poly :=
[
  term ((-9491312556316679389220085368544000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 10. -/
def ep_Q2_008_partial_10_0012 : Poly :=
[
  term ((-18982625112633358778440170737088000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((9491312556316679389220085368544000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((9491312556316679389220085368544000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 3), (7, 1), (15, 1), (16, 1)],
  term ((-18982625112633358778440170737088000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 10. -/
theorem ep_Q2_008_partial_10_0012_valid :
    mulPoly ep_Q2_008_coefficient_10_0012
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0013 : Poly :=
[
  term ((32291916775513583922 : Rat) / 692956453614176359) [(3, 1), (5, 1), (13, 2), (16, 1)]
]

/-- Partial product 13 for generator 10. -/
def ep_Q2_008_partial_10_0013 : Poly :=
[
  term ((64583833551027167844 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (5, 1), (13, 2), (16, 1)],
  term ((-32291916775513583922 : Rat) / 692956453614176359) [(3, 1), (4, 2), (5, 1), (13, 2), (16, 1)],
  term ((-32291916775513583922 : Rat) / 692956453614176359) [(3, 1), (5, 3), (13, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(3, 2), (5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 10. -/
theorem ep_Q2_008_partial_10_0013_valid :
    mulPoly ep_Q2_008_coefficient_10_0013
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0014 : Poly :=
[
  term ((-66925080449200531695 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 14 for generator 10. -/
def ep_Q2_008_partial_10_0014 : Poly :=
[
  term ((-66925080449200531695 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((66925080449200531695 : Rat) / 5543651628913410872) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((66925080449200531695 : Rat) / 5543651628913410872) [(3, 1), (5, 3), (16, 1)],
  term ((-66925080449200531695 : Rat) / 2771825814456705436) [(3, 2), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 10. -/
theorem ep_Q2_008_partial_10_0014_valid :
    mulPoly ep_Q2_008_coefficient_10_0014
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0015 : Poly :=
[
  term ((-153331817775928710260531712459134400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 10. -/
def ep_Q2_008_partial_10_0015 : Poly :=
[
  term ((-306663635551857420521063424918268800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((153331817775928710260531712459134400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((153331817775928710260531712459134400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-306663635551857420521063424918268800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 10. -/
theorem ep_Q2_008_partial_10_0015_valid :
    mulPoly ep_Q2_008_coefficient_10_0015
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0016 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 16 for generator 10. -/
def ep_Q2_008_partial_10_0016 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 1385912907228352718) [(3, 1), (4, 2), (7, 1), (13, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 1385912907228352718) [(3, 1), (5, 2), (7, 1), (13, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(3, 2), (5, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 10. -/
theorem ep_Q2_008_partial_10_0016_valid :
    mulPoly ep_Q2_008_coefficient_10_0016
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0017 : Poly :=
[
  term ((-11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 10. -/
def ep_Q2_008_partial_10_0017 : Poly :=
[
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 10. -/
theorem ep_Q2_008_partial_10_0017_valid :
    mulPoly ep_Q2_008_coefficient_10_0017
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0018 : Poly :=
[
  term ((-50485705086790847815000454088000000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 18 for generator 10. -/
def ep_Q2_008_partial_10_0018 : Poly :=
[
  term ((-100971410173581695630000908176000000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((50485705086790847815000454088000000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (7, 1), (15, 2), (16, 1)],
  term ((50485705086790847815000454088000000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((-100971410173581695630000908176000000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 10. -/
theorem ep_Q2_008_partial_10_0018_valid :
    mulPoly ep_Q2_008_coefficient_10_0018
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0019 : Poly :=
[
  term ((1619646487561852949 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 19 for generator 10. -/
def ep_Q2_008_partial_10_0019 : Poly :=
[
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (4, 1), (7, 1), (16, 1)],
  term ((-1619646487561852949 : Rat) / 5543651628913410872) [(3, 1), (4, 2), (7, 1), (16, 1)],
  term ((-1619646487561852949 : Rat) / 5543651628913410872) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 10. -/
theorem ep_Q2_008_partial_10_0019_valid :
    mulPoly ep_Q2_008_coefficient_10_0019
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0020 : Poly :=
[
  term ((-304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 10. -/
def ep_Q2_008_partial_10_0020 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 10. -/
theorem ep_Q2_008_partial_10_0020_valid :
    mulPoly ep_Q2_008_coefficient_10_0020
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0021 : Poly :=
[
  term ((4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 10. -/
def ep_Q2_008_partial_10_0021 : Poly :=
[
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (7, 2), (15, 1), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 2), (15, 1), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 10. -/
theorem ep_Q2_008_partial_10_0021_valid :
    mulPoly ep_Q2_008_coefficient_10_0021
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0022 : Poly :=
[
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 10. -/
def ep_Q2_008_partial_10_0022 : Poly :=
[
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 10. -/
theorem ep_Q2_008_partial_10_0022_valid :
    mulPoly ep_Q2_008_coefficient_10_0022
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0023 : Poly :=
[
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 23 for generator 10. -/
def ep_Q2_008_partial_10_0023 : Poly :=
[
  term ((140649573864425400 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (4, 2), (9, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (5, 2), (9, 1), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(3, 2), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 10. -/
theorem ep_Q2_008_partial_10_0023_valid :
    mulPoly ep_Q2_008_coefficient_10_0023
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0024 : Poly :=
[
  term ((59550582138075000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 24 for generator 10. -/
def ep_Q2_008_partial_10_0024 : Poly :=
[
  term ((119101164276150000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((-59550582138075000 : Rat) / 692956453614176359) [(3, 1), (4, 2), (10, 1), (11, 1), (16, 1)],
  term ((-59550582138075000 : Rat) / 692956453614176359) [(3, 1), (5, 2), (10, 1), (11, 1), (16, 1)],
  term ((119101164276150000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 10. -/
theorem ep_Q2_008_partial_10_0024_valid :
    mulPoly ep_Q2_008_coefficient_10_0024
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0025 : Poly :=
[
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 25 for generator 10. -/
def ep_Q2_008_partial_10_0025 : Poly :=
[
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 10. -/
theorem ep_Q2_008_partial_10_0025_valid :
    mulPoly ep_Q2_008_coefficient_10_0025
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0026 : Poly :=
[
  term ((-7905546465169071375 : Rat) / 1385912907228352718) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 26 for generator 10. -/
def ep_Q2_008_partial_10_0026 : Poly :=
[
  term ((-7905546465169071375 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((7905546465169071375 : Rat) / 1385912907228352718) [(3, 1), (4, 2), (10, 1), (13, 1), (16, 1)],
  term ((7905546465169071375 : Rat) / 1385912907228352718) [(3, 1), (5, 2), (10, 1), (13, 1), (16, 1)],
  term ((-7905546465169071375 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 10. -/
theorem ep_Q2_008_partial_10_0026_valid :
    mulPoly ep_Q2_008_coefficient_10_0026
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0027 : Poly :=
[
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 10. -/
def ep_Q2_008_partial_10_0027 : Poly :=
[
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 10. -/
theorem ep_Q2_008_partial_10_0027_valid :
    mulPoly ep_Q2_008_coefficient_10_0027
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0028 : Poly :=
[
  term ((-94803927494946305917646790538616889000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 10. -/
def ep_Q2_008_partial_10_0028 : Poly :=
[
  term ((-189607854989892611835293581077233778000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((94803927494946305917646790538616889000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((94803927494946305917646790538616889000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((-189607854989892611835293581077233778000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 10. -/
theorem ep_Q2_008_partial_10_0028_valid :
    mulPoly ep_Q2_008_coefficient_10_0028
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0029 : Poly :=
[
  term ((-294243709198519874134306505033093001600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 10. -/
def ep_Q2_008_partial_10_0029 : Poly :=
[
  term ((-588487418397039748268613010066186003200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((294243709198519874134306505033093001600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((294243709198519874134306505033093001600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-588487418397039748268613010066186003200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 10. -/
theorem ep_Q2_008_partial_10_0029_valid :
    mulPoly ep_Q2_008_coefficient_10_0029
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0030 : Poly :=
[
  term ((-7146830570608836000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 30 for generator 10. -/
def ep_Q2_008_partial_10_0030 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((7146830570608836000 : Rat) / 692956453614176359) [(3, 1), (4, 2), (11, 1), (13, 2), (16, 1)],
  term ((7146830570608836000 : Rat) / 692956453614176359) [(3, 1), (5, 2), (11, 1), (13, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 10. -/
theorem ep_Q2_008_partial_10_0030_valid :
    mulPoly ep_Q2_008_coefficient_10_0030
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0031 : Poly :=
[
  term ((-591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 10. -/
def ep_Q2_008_partial_10_0031 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 10. -/
theorem ep_Q2_008_partial_10_0031_valid :
    mulPoly ep_Q2_008_coefficient_10_0031
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0032 : Poly :=
[
  term ((621420137128607625 : Rat) / 2771825814456705436) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 32 for generator 10. -/
def ep_Q2_008_partial_10_0032 : Poly :=
[
  term ((621420137128607625 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-621420137128607625 : Rat) / 2771825814456705436) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((-621420137128607625 : Rat) / 2771825814456705436) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((621420137128607625 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 10. -/
theorem ep_Q2_008_partial_10_0032_valid :
    mulPoly ep_Q2_008_coefficient_10_0032
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0033 : Poly :=
[
  term ((-21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 10. -/
def ep_Q2_008_partial_10_0033 : Poly :=
[
  term ((-43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 10. -/
theorem ep_Q2_008_partial_10_0033_valid :
    mulPoly ep_Q2_008_coefficient_10_0033
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0034 : Poly :=
[
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 34 for generator 10. -/
def ep_Q2_008_partial_10_0034 : Poly :=
[
  term ((-104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (13, 1), (15, 2), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((-104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 10. -/
theorem ep_Q2_008_partial_10_0034_valid :
    mulPoly ep_Q2_008_coefficient_10_0034
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0035 : Poly :=
[
  term ((36763978068820552155 : Rat) / 5543651628913410872) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 35 for generator 10. -/
def ep_Q2_008_partial_10_0035 : Poly :=
[
  term ((36763978068820552155 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-36763978068820552155 : Rat) / 5543651628913410872) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((-36763978068820552155 : Rat) / 5543651628913410872) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((36763978068820552155 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 10. -/
theorem ep_Q2_008_partial_10_0035_valid :
    mulPoly ep_Q2_008_coefficient_10_0035
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0036 : Poly :=
[
  term ((-8284966557147870030861594144281628364800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 10. -/
def ep_Q2_008_partial_10_0036 : Poly :=
[
  term ((-16569933114295740061723188288563256729600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((8284966557147870030861594144281628364800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (13, 2), (15, 1), (16, 1)],
  term ((8284966557147870030861594144281628364800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((-16569933114295740061723188288563256729600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 10. -/
theorem ep_Q2_008_partial_10_0036_valid :
    mulPoly ep_Q2_008_coefficient_10_0036
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0037 : Poly :=
[
  term ((13914462838826399623651796466934740589897 : Rat) / 11635007024229621750051091604067796875724) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 10. -/
def ep_Q2_008_partial_10_0037 : Poly :=
[
  term ((13914462838826399623651796466934740589897 : Rat) / 5817503512114810875025545802033898437862) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-13914462838826399623651796466934740589897 : Rat) / 11635007024229621750051091604067796875724) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-13914462838826399623651796466934740589897 : Rat) / 11635007024229621750051091604067796875724) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((13914462838826399623651796466934740589897 : Rat) / 5817503512114810875025545802033898437862) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 10. -/
theorem ep_Q2_008_partial_10_0037_valid :
    mulPoly ep_Q2_008_coefficient_10_0037
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0038 : Poly :=
[
  term ((-199241833525243875 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 38 for generator 10. -/
def ep_Q2_008_partial_10_0038 : Poly :=
[
  term ((-398483667050487750 : Rat) / 692956453614176359) [(2, 1), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-398483667050487750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((199241833525243875 : Rat) / 692956453614176359) [(4, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((199241833525243875 : Rat) / 692956453614176359) [(4, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 10. -/
theorem ep_Q2_008_partial_10_0038_valid :
    mulPoly ep_Q2_008_coefficient_10_0038
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0039 : Poly :=
[
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 10. -/
def ep_Q2_008_partial_10_0039 : Poly :=
[
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(4, 3), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 10. -/
theorem ep_Q2_008_partial_10_0039_valid :
    mulPoly ep_Q2_008_coefficient_10_0039
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0040 : Poly :=
[
  term ((12250624020253221857804351804734105470300 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 10. -/
def ep_Q2_008_partial_10_0040 : Poly :=
[
  term ((24501248040506443715608703609468210940600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((24501248040506443715608703609468210940600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12250624020253221857804351804734105470300 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-12250624020253221857804351804734105470300 : Rat) / 84353800925664757687870414129491527348999) [(4, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 10. -/
theorem ep_Q2_008_partial_10_0040_valid :
    mulPoly ep_Q2_008_coefficient_10_0040
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0041 : Poly :=
[
  term ((-29775291069037500 : Rat) / 692956453614176359) [(4, 1), (11, 2), (16, 1)]
]

/-- Partial product 41 for generator 10. -/
def ep_Q2_008_partial_10_0041 : Poly :=
[
  term ((-59550582138075000 : Rat) / 692956453614176359) [(2, 1), (4, 2), (11, 2), (16, 1)],
  term ((-59550582138075000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (11, 2), (16, 1)],
  term ((29775291069037500 : Rat) / 692956453614176359) [(4, 1), (5, 2), (11, 2), (16, 1)],
  term ((29775291069037500 : Rat) / 692956453614176359) [(4, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 10. -/
theorem ep_Q2_008_partial_10_0041_valid :
    mulPoly ep_Q2_008_coefficient_10_0041
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0042 : Poly :=
[
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 10. -/
def ep_Q2_008_partial_10_0042 : Poly :=
[
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 10. -/
theorem ep_Q2_008_partial_10_0042_valid :
    mulPoly ep_Q2_008_coefficient_10_0042
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0043 : Poly :=
[
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 43 for generator 10. -/
def ep_Q2_008_partial_10_0043 : Poly :=
[
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 10. -/
theorem ep_Q2_008_partial_10_0043_valid :
    mulPoly ep_Q2_008_coefficient_10_0043
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0044 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 10. -/
def ep_Q2_008_partial_10_0044 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 3), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 10. -/
theorem ep_Q2_008_partial_10_0044_valid :
    mulPoly ep_Q2_008_coefficient_10_0044
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0045 : Poly :=
[
  term ((-3354218650160863069326182436790086048000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 10. -/
def ep_Q2_008_partial_10_0045 : Poly :=
[
  term ((-6708437300321726138652364873580172096000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6708437300321726138652364873580172096000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((3354218650160863069326182436790086048000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((3354218650160863069326182436790086048000 : Rat) / 84353800925664757687870414129491527348999) [(5, 3), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 10. -/
theorem ep_Q2_008_partial_10_0045_valid :
    mulPoly ep_Q2_008_coefficient_10_0045
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0046 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 46 for generator 10. -/
def ep_Q2_008_partial_10_0046 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 3), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 10. -/
theorem ep_Q2_008_partial_10_0046_valid :
    mulPoly ep_Q2_008_coefficient_10_0046
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0047 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 10. -/
def ep_Q2_008_partial_10_0047 : Poly :=
[
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 3), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 10. -/
theorem ep_Q2_008_partial_10_0047_valid :
    mulPoly ep_Q2_008_coefficient_10_0047
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0048 : Poly :=
[
  term ((-5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 48 for generator 10. -/
def ep_Q2_008_partial_10_0048 : Poly :=
[
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(5, 3), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 10. -/
theorem ep_Q2_008_partial_10_0048_valid :
    mulPoly ep_Q2_008_coefficient_10_0048
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0049 : Poly :=
[
  term ((-692576845212253500 : Rat) / 692956453614176359) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 49 for generator 10. -/
def ep_Q2_008_partial_10_0049 : Poly :=
[
  term ((-1385153690424507000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((-1385153690424507000 : Rat) / 692956453614176359) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(5, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 10. -/
theorem ep_Q2_008_partial_10_0049_valid :
    mulPoly ep_Q2_008_coefficient_10_0049
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0050 : Poly :=
[
  term ((29775291069037500 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 50 for generator 10. -/
def ep_Q2_008_partial_10_0050 : Poly :=
[
  term ((59550582138075000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((59550582138075000 : Rat) / 692956453614176359) [(3, 1), (5, 2), (10, 1), (11, 1), (16, 1)],
  term ((-29775291069037500 : Rat) / 692956453614176359) [(4, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-29775291069037500 : Rat) / 692956453614176359) [(5, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 10. -/
theorem ep_Q2_008_partial_10_0050_valid :
    mulPoly ep_Q2_008_coefficient_10_0050
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0051 : Poly :=
[
  term ((199241833525243875 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 51 for generator 10. -/
def ep_Q2_008_partial_10_0051 : Poly :=
[
  term ((398483667050487750 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((398483667050487750 : Rat) / 692956453614176359) [(3, 1), (5, 2), (10, 1), (13, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 692956453614176359) [(4, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 692956453614176359) [(5, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 10. -/
theorem ep_Q2_008_partial_10_0051_valid :
    mulPoly ep_Q2_008_coefficient_10_0051
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0052 : Poly :=
[
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 10. -/
def ep_Q2_008_partial_10_0052 : Poly :=
[
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(5, 3), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 10. -/
theorem ep_Q2_008_partial_10_0052_valid :
    mulPoly ep_Q2_008_coefficient_10_0052
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0053 : Poly :=
[
  term ((-12250624020253221857804351804734105470300 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 10. -/
def ep_Q2_008_partial_10_0053 : Poly :=
[
  term ((-24501248040506443715608703609468210940600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-24501248040506443715608703609468210940600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((12250624020253221857804351804734105470300 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((12250624020253221857804351804734105470300 : Rat) / 84353800925664757687870414129491527348999) [(5, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 10. -/
theorem ep_Q2_008_partial_10_0053_valid :
    mulPoly ep_Q2_008_coefficient_10_0053
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0054 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 54 for generator 10. -/
def ep_Q2_008_partial_10_0054 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 10. -/
theorem ep_Q2_008_partial_10_0054_valid :
    mulPoly ep_Q2_008_coefficient_10_0054
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0055 : Poly :=
[
  term ((13571547378614916015 : Rat) / 2771825814456705436) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 55 for generator 10. -/
def ep_Q2_008_partial_10_0055 : Poly :=
[
  term ((13571547378614916015 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((13571547378614916015 : Rat) / 1385912907228352718) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-13571547378614916015 : Rat) / 2771825814456705436) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((-13571547378614916015 : Rat) / 2771825814456705436) [(5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 10. -/
theorem ep_Q2_008_partial_10_0055_valid :
    mulPoly ep_Q2_008_coefficient_10_0055
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0056 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 10. -/
def ep_Q2_008_partial_10_0056 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 10. -/
theorem ep_Q2_008_partial_10_0056_valid :
    mulPoly ep_Q2_008_coefficient_10_0056
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0057 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (13, 3), (16, 1)]
]

/-- Partial product 57 for generator 10. -/
def ep_Q2_008_partial_10_0057 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 3), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 3), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 2), (5, 1), (13, 3), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 3), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 10. -/
theorem ep_Q2_008_partial_10_0057_valid :
    mulPoly ep_Q2_008_coefficient_10_0057
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0058 : Poly :=
[
  term ((-5014213127946281709 : Rat) / 5543651628913410872) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 10. -/
def ep_Q2_008_partial_10_0058 : Poly :=
[
  term ((-5014213127946281709 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-5014213127946281709 : Rat) / 2771825814456705436) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((5014213127946281709 : Rat) / 5543651628913410872) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((5014213127946281709 : Rat) / 5543651628913410872) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 10. -/
theorem ep_Q2_008_partial_10_0058_valid :
    mulPoly ep_Q2_008_coefficient_10_0058
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0059 : Poly :=
[
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 59 for generator 10. -/
def ep_Q2_008_partial_10_0059 : Poly :=
[
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 10. -/
theorem ep_Q2_008_partial_10_0059_valid :
    mulPoly ep_Q2_008_coefficient_10_0059
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0060 : Poly :=
[
  term ((-12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 10. -/
def ep_Q2_008_partial_10_0060 : Poly :=
[
  term ((-24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 10. -/
theorem ep_Q2_008_partial_10_0060_valid :
    mulPoly ep_Q2_008_coefficient_10_0060
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0061 : Poly :=
[
  term ((53595523924267500 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 61 for generator 10. -/
def ep_Q2_008_partial_10_0061 : Poly :=
[
  term ((107191047848535000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(4, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(5, 2), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 10. -/
theorem ep_Q2_008_partial_10_0061_valid :
    mulPoly ep_Q2_008_coefficient_10_0061
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0062 : Poly :=
[
  term ((-83370814993305000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 10. -/
def ep_Q2_008_partial_10_0062 : Poly :=
[
  term ((-166741629986610000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-166741629986610000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 10. -/
theorem ep_Q2_008_partial_10_0062_valid :
    mulPoly ep_Q2_008_coefficient_10_0062
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0063 : Poly :=
[
  term ((-1403239858816500714715407002676484150124721 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 10. -/
def ep_Q2_008_partial_10_0063 : Poly :=
[
  term ((-1403239858816500714715407002676484150124721 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1403239858816500714715407002676484150124721 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1403239858816500714715407002676484150124721 : Rat) / 337415203702659030751481656517966109395996) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1403239858816500714715407002676484150124721 : Rat) / 337415203702659030751481656517966109395996) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 10. -/
theorem ep_Q2_008_partial_10_0063_valid :
    mulPoly ep_Q2_008_coefficient_10_0063
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0064 : Poly :=
[
  term ((592064355033204389521930393588419955200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 64 for generator 10. -/
def ep_Q2_008_partial_10_0064 : Poly :=
[
  term ((1184128710066408779043860787176839910400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((1184128710066408779043860787176839910400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-592064355033204389521930393588419955200 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-592064355033204389521930393588419955200 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 10. -/
theorem ep_Q2_008_partial_10_0064_valid :
    mulPoly ep_Q2_008_coefficient_10_0064
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0065 : Poly :=
[
  term ((9176880548775748599 : Rat) / 1385912907228352718) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 65 for generator 10. -/
def ep_Q2_008_partial_10_0065 : Poly :=
[
  term ((9176880548775748599 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (13, 2), (16, 1)],
  term ((9176880548775748599 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((-9176880548775748599 : Rat) / 1385912907228352718) [(4, 2), (6, 1), (13, 2), (16, 1)],
  term ((-9176880548775748599 : Rat) / 1385912907228352718) [(5, 2), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 10. -/
theorem ep_Q2_008_partial_10_0065_valid :
    mulPoly ep_Q2_008_coefficient_10_0065
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0066 : Poly :=
[
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 66 for generator 10. -/
def ep_Q2_008_partial_10_0066 : Poly :=
[
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (6, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 10. -/
theorem ep_Q2_008_partial_10_0066_valid :
    mulPoly ep_Q2_008_coefficient_10_0066
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0067 : Poly :=
[
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 67 for generator 10. -/
def ep_Q2_008_partial_10_0067 : Poly :=
[
  term ((58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term ((-29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 10. -/
theorem ep_Q2_008_partial_10_0067_valid :
    mulPoly ep_Q2_008_coefficient_10_0067
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0068 : Poly :=
[
  term ((-519432633909190125 : Rat) / 1385912907228352718) [(6, 1), (16, 1)]
]

/-- Partial product 68 for generator 10. -/
def ep_Q2_008_partial_10_0068 : Poly :=
[
  term ((-519432633909190125 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (16, 1)],
  term ((-519432633909190125 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (16, 1)],
  term ((519432633909190125 : Rat) / 1385912907228352718) [(4, 2), (6, 1), (16, 1)],
  term ((519432633909190125 : Rat) / 1385912907228352718) [(5, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 10. -/
theorem ep_Q2_008_partial_10_0068_valid :
    mulPoly ep_Q2_008_coefficient_10_0068
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0069 : Poly :=
[
  term ((-53595523924267500 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 69 for generator 10. -/
def ep_Q2_008_partial_10_0069 : Poly :=
[
  term ((-107191047848535000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(4, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(5, 2), (7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 10. -/
theorem ep_Q2_008_partial_10_0069_valid :
    mulPoly ep_Q2_008_coefficient_10_0069
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0070 : Poly :=
[
  term ((2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 10. -/
def ep_Q2_008_partial_10_0070 : Poly :=
[
  term ((5033392335722293481756429023752787392000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((5033392335722293481756429023752787392000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 10. -/
theorem ep_Q2_008_partial_10_0070_valid :
    mulPoly ep_Q2_008_coefficient_10_0070
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0071 : Poly :=
[
  term ((465837109984922625 : Rat) / 692956453614176359) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 71 for generator 10. -/
def ep_Q2_008_partial_10_0071 : Poly :=
[
  term ((931674219969845250 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((931674219969845250 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-465837109984922625 : Rat) / 692956453614176359) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((-465837109984922625 : Rat) / 692956453614176359) [(5, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 10. -/
theorem ep_Q2_008_partial_10_0071_valid :
    mulPoly ep_Q2_008_coefficient_10_0071
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0072 : Poly :=
[
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 72 for generator 10. -/
def ep_Q2_008_partial_10_0072 : Poly :=
[
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 10. -/
theorem ep_Q2_008_partial_10_0072_valid :
    mulPoly ep_Q2_008_coefficient_10_0072
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0073 : Poly :=
[
  term ((-4405970781755683488 : Rat) / 692956453614176359) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 73 for generator 10. -/
def ep_Q2_008_partial_10_0073 : Poly :=
[
  term ((-8811941563511366976 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8811941563511366976 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((4405970781755683488 : Rat) / 692956453614176359) [(4, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((4405970781755683488 : Rat) / 692956453614176359) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 10. -/
theorem ep_Q2_008_partial_10_0073_valid :
    mulPoly ep_Q2_008_coefficient_10_0073
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0074 : Poly :=
[
  term ((1019576516748339453249465950058706579200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 74 for generator 10. -/
def ep_Q2_008_partial_10_0074 : Poly :=
[
  term ((2039153033496678906498931900117413158400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((2039153033496678906498931900117413158400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1019576516748339453249465950058706579200 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1019576516748339453249465950058706579200 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 10. -/
theorem ep_Q2_008_partial_10_0074_valid :
    mulPoly ep_Q2_008_coefficient_10_0074
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0075 : Poly :=
[
  term ((1272107640891308102359554209028952816686021 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 10. -/
def ep_Q2_008_partial_10_0075 : Poly :=
[
  term ((1272107640891308102359554209028952816686021 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1272107640891308102359554209028952816686021 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1272107640891308102359554209028952816686021 : Rat) / 337415203702659030751481656517966109395996) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1272107640891308102359554209028952816686021 : Rat) / 337415203702659030751481656517966109395996) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 10. -/
theorem ep_Q2_008_partial_10_0075_valid :
    mulPoly ep_Q2_008_coefficient_10_0075
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0076 : Poly :=
[
  term ((227162112894851646105188376517425600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 76 for generator 10. -/
def ep_Q2_008_partial_10_0076 : Poly :=
[
  term ((454324225789703292210376753034851200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((454324225789703292210376753034851200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-227162112894851646105188376517425600 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-227162112894851646105188376517425600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 10. -/
theorem ep_Q2_008_partial_10_0076_valid :
    mulPoly ep_Q2_008_coefficient_10_0076
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0077 : Poly :=
[
  term ((-3448052429063870577 : Rat) / 1385912907228352718) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 77 for generator 10. -/
def ep_Q2_008_partial_10_0077 : Poly :=
[
  term ((-3448052429063870577 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-3448052429063870577 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((3448052429063870577 : Rat) / 1385912907228352718) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((3448052429063870577 : Rat) / 1385912907228352718) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 10. -/
theorem ep_Q2_008_partial_10_0077_valid :
    mulPoly ep_Q2_008_coefficient_10_0077
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0078 : Poly :=
[
  term ((44211816856089178842667132270619758914903 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 10. -/
def ep_Q2_008_partial_10_0078 : Poly :=
[
  term ((44211816856089178842667132270619758914903 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((44211816856089178842667132270619758914903 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-44211816856089178842667132270619758914903 : Rat) / 168707601851329515375740828258983054697998) [(4, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-44211816856089178842667132270619758914903 : Rat) / 168707601851329515375740828258983054697998) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 10. -/
theorem ep_Q2_008_partial_10_0078_valid :
    mulPoly ep_Q2_008_coefficient_10_0078
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0079 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 79 for generator 10. -/
def ep_Q2_008_partial_10_0079 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 10. -/
theorem ep_Q2_008_partial_10_0079_valid :
    mulPoly ep_Q2_008_coefficient_10_0079
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0080 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(7, 1), (13, 3), (16, 1)]
]

/-- Partial product 80 for generator 10. -/
def ep_Q2_008_partial_10_0080 : Poly :=
[
  term ((-729877970528763246 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (13, 3), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(4, 2), (7, 1), (13, 3), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(5, 2), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 10. -/
theorem ep_Q2_008_partial_10_0080_valid :
    mulPoly ep_Q2_008_coefficient_10_0080
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0081 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 10. -/
def ep_Q2_008_partial_10_0081 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 10. -/
theorem ep_Q2_008_partial_10_0081_valid :
    mulPoly ep_Q2_008_coefficient_10_0081
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0082 : Poly :=
[
  term ((312601291555366291394205212381116764784789 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 10. -/
def ep_Q2_008_partial_10_0082 : Poly :=
[
  term ((312601291555366291394205212381116764784789 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((312601291555366291394205212381116764784789 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-312601291555366291394205212381116764784789 : Rat) / 674830407405318061502963313035932218791992) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-312601291555366291394205212381116764784789 : Rat) / 674830407405318061502963313035932218791992) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 10. -/
theorem ep_Q2_008_partial_10_0082_valid :
    mulPoly ep_Q2_008_coefficient_10_0082
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0083 : Poly :=
[
  term ((-53535041674033015023026481514915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 83 for generator 10. -/
def ep_Q2_008_partial_10_0083 : Poly :=
[
  term ((-107070083348066030046052963029830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-107070083348066030046052963029830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((53535041674033015023026481514915200 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (7, 1), (15, 3), (16, 1)],
  term ((53535041674033015023026481514915200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 10. -/
theorem ep_Q2_008_partial_10_0083_valid :
    mulPoly ep_Q2_008_coefficient_10_0083
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0084 : Poly :=
[
  term ((113734196419522421957633022969446400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 84 for generator 10. -/
def ep_Q2_008_partial_10_0084 : Poly :=
[
  term ((227468392839044843915266045938892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((227468392839044843915266045938892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-113734196419522421957633022969446400 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-113734196419522421957633022969446400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 10. -/
theorem ep_Q2_008_partial_10_0084_valid :
    mulPoly ep_Q2_008_coefficient_10_0084
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0085 : Poly :=
[
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 85 for generator 10. -/
def ep_Q2_008_partial_10_0085 : Poly :=
[
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 10. -/
theorem ep_Q2_008_partial_10_0085_valid :
    mulPoly ep_Q2_008_coefficient_10_0085
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0086 : Poly :=
[
  term ((1674433952939335589528446837665042336000 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 86 for generator 10. -/
def ep_Q2_008_partial_10_0086 : Poly :=
[
  term ((3348867905878671179056893675330084672000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((3348867905878671179056893675330084672000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1674433952939335589528446837665042336000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1674433952939335589528446837665042336000 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 10. -/
theorem ep_Q2_008_partial_10_0086_valid :
    mulPoly ep_Q2_008_coefficient_10_0086
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0087 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 87 for generator 10. -/
def ep_Q2_008_partial_10_0087 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 10. -/
theorem ep_Q2_008_partial_10_0087_valid :
    mulPoly ep_Q2_008_coefficient_10_0087
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0088 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 10. -/
def ep_Q2_008_partial_10_0088 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 10. -/
theorem ep_Q2_008_partial_10_0088_valid :
    mulPoly ep_Q2_008_coefficient_10_0088
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0089 : Poly :=
[
  term ((4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 89 for generator 10. -/
def ep_Q2_008_partial_10_0089 : Poly :=
[
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (7, 2), (15, 2), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 10. -/
theorem ep_Q2_008_partial_10_0089_valid :
    mulPoly ep_Q2_008_coefficient_10_0089
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0090 : Poly :=
[
  term ((346288422606126750 : Rat) / 692956453614176359) [(7, 2), (16, 1)]
]

/-- Partial product 90 for generator 10. -/
def ep_Q2_008_partial_10_0090 : Poly :=
[
  term ((692576845212253500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 2), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(4, 2), (7, 2), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(5, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 10. -/
theorem ep_Q2_008_partial_10_0090_valid :
    mulPoly ep_Q2_008_coefficient_10_0090
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0091 : Poly :=
[
  term ((46883191288141800 : Rat) / 692956453614176359) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 91 for generator 10. -/
def ep_Q2_008_partial_10_0091 : Poly :=
[
  term ((93766382576283600 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 10. -/
theorem ep_Q2_008_partial_10_0091_valid :
    mulPoly ep_Q2_008_coefficient_10_0091
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0092 : Poly :=
[
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 10. -/
def ep_Q2_008_partial_10_0092 : Poly :=
[
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 10. -/
theorem ep_Q2_008_partial_10_0092_valid :
    mulPoly ep_Q2_008_coefficient_10_0092
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0093 : Poly :=
[
  term ((-113390892829091656147760641685564094115125 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 93 for generator 10. -/
def ep_Q2_008_partial_10_0093 : Poly :=
[
  term ((-226781785658183312295521283371128188230250 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-226781785658183312295521283371128188230250 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((113390892829091656147760641685564094115125 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((113390892829091656147760641685564094115125 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 10. -/
theorem ep_Q2_008_partial_10_0093_valid :
    mulPoly ep_Q2_008_coefficient_10_0093
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0094 : Poly :=
[
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 94 for generator 10. -/
def ep_Q2_008_partial_10_0094 : Poly :=
[
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 10. -/
theorem ep_Q2_008_partial_10_0094_valid :
    mulPoly ep_Q2_008_coefficient_10_0094
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0095 : Poly :=
[
  term ((-2906181646033672125 : Rat) / 692956453614176359) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 95 for generator 10. -/
def ep_Q2_008_partial_10_0095 : Poly :=
[
  term ((-5812363292067344250 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-5812363292067344250 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((2906181646033672125 : Rat) / 692956453614176359) [(4, 2), (10, 1), (13, 2), (16, 1)],
  term ((2906181646033672125 : Rat) / 692956453614176359) [(5, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 10. -/
theorem ep_Q2_008_partial_10_0095_valid :
    mulPoly ep_Q2_008_coefficient_10_0095
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0096 : Poly :=
[
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 96 for generator 10. -/
def ep_Q2_008_partial_10_0096 : Poly :=
[
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 10. -/
theorem ep_Q2_008_partial_10_0096_valid :
    mulPoly ep_Q2_008_coefficient_10_0096
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0097 : Poly :=
[
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 97 for generator 10. -/
def ep_Q2_008_partial_10_0097 : Poly :=
[
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 10. -/
theorem ep_Q2_008_partial_10_0097_valid :
    mulPoly ep_Q2_008_coefficient_10_0097
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0098 : Poly :=
[
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 98 for generator 10. -/
def ep_Q2_008_partial_10_0098 : Poly :=
[
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 10. -/
theorem ep_Q2_008_partial_10_0098_valid :
    mulPoly ep_Q2_008_coefficient_10_0098
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 10. -/
def ep_Q2_008_coefficient_10_0099 : Poly :=
[
  term ((2973131869374928125 : Rat) / 692956453614176359) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 99 for generator 10. -/
def ep_Q2_008_partial_10_0099 : Poly :=
[
  term ((5946263738749856250 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((5946263738749856250 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2973131869374928125 : Rat) / 692956453614176359) [(4, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2973131869374928125 : Rat) / 692956453614176359) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 10. -/
theorem ep_Q2_008_partial_10_0099_valid :
    mulPoly ep_Q2_008_coefficient_10_0099
        ep_Q2_008_generator_10_0000_0099 =
      ep_Q2_008_partial_10_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_10_0000_0099 : List Poly :=
[
  ep_Q2_008_partial_10_0000,
  ep_Q2_008_partial_10_0001,
  ep_Q2_008_partial_10_0002,
  ep_Q2_008_partial_10_0003,
  ep_Q2_008_partial_10_0004,
  ep_Q2_008_partial_10_0005,
  ep_Q2_008_partial_10_0006,
  ep_Q2_008_partial_10_0007,
  ep_Q2_008_partial_10_0008,
  ep_Q2_008_partial_10_0009,
  ep_Q2_008_partial_10_0010,
  ep_Q2_008_partial_10_0011,
  ep_Q2_008_partial_10_0012,
  ep_Q2_008_partial_10_0013,
  ep_Q2_008_partial_10_0014,
  ep_Q2_008_partial_10_0015,
  ep_Q2_008_partial_10_0016,
  ep_Q2_008_partial_10_0017,
  ep_Q2_008_partial_10_0018,
  ep_Q2_008_partial_10_0019,
  ep_Q2_008_partial_10_0020,
  ep_Q2_008_partial_10_0021,
  ep_Q2_008_partial_10_0022,
  ep_Q2_008_partial_10_0023,
  ep_Q2_008_partial_10_0024,
  ep_Q2_008_partial_10_0025,
  ep_Q2_008_partial_10_0026,
  ep_Q2_008_partial_10_0027,
  ep_Q2_008_partial_10_0028,
  ep_Q2_008_partial_10_0029,
  ep_Q2_008_partial_10_0030,
  ep_Q2_008_partial_10_0031,
  ep_Q2_008_partial_10_0032,
  ep_Q2_008_partial_10_0033,
  ep_Q2_008_partial_10_0034,
  ep_Q2_008_partial_10_0035,
  ep_Q2_008_partial_10_0036,
  ep_Q2_008_partial_10_0037,
  ep_Q2_008_partial_10_0038,
  ep_Q2_008_partial_10_0039,
  ep_Q2_008_partial_10_0040,
  ep_Q2_008_partial_10_0041,
  ep_Q2_008_partial_10_0042,
  ep_Q2_008_partial_10_0043,
  ep_Q2_008_partial_10_0044,
  ep_Q2_008_partial_10_0045,
  ep_Q2_008_partial_10_0046,
  ep_Q2_008_partial_10_0047,
  ep_Q2_008_partial_10_0048,
  ep_Q2_008_partial_10_0049,
  ep_Q2_008_partial_10_0050,
  ep_Q2_008_partial_10_0051,
  ep_Q2_008_partial_10_0052,
  ep_Q2_008_partial_10_0053,
  ep_Q2_008_partial_10_0054,
  ep_Q2_008_partial_10_0055,
  ep_Q2_008_partial_10_0056,
  ep_Q2_008_partial_10_0057,
  ep_Q2_008_partial_10_0058,
  ep_Q2_008_partial_10_0059,
  ep_Q2_008_partial_10_0060,
  ep_Q2_008_partial_10_0061,
  ep_Q2_008_partial_10_0062,
  ep_Q2_008_partial_10_0063,
  ep_Q2_008_partial_10_0064,
  ep_Q2_008_partial_10_0065,
  ep_Q2_008_partial_10_0066,
  ep_Q2_008_partial_10_0067,
  ep_Q2_008_partial_10_0068,
  ep_Q2_008_partial_10_0069,
  ep_Q2_008_partial_10_0070,
  ep_Q2_008_partial_10_0071,
  ep_Q2_008_partial_10_0072,
  ep_Q2_008_partial_10_0073,
  ep_Q2_008_partial_10_0074,
  ep_Q2_008_partial_10_0075,
  ep_Q2_008_partial_10_0076,
  ep_Q2_008_partial_10_0077,
  ep_Q2_008_partial_10_0078,
  ep_Q2_008_partial_10_0079,
  ep_Q2_008_partial_10_0080,
  ep_Q2_008_partial_10_0081,
  ep_Q2_008_partial_10_0082,
  ep_Q2_008_partial_10_0083,
  ep_Q2_008_partial_10_0084,
  ep_Q2_008_partial_10_0085,
  ep_Q2_008_partial_10_0086,
  ep_Q2_008_partial_10_0087,
  ep_Q2_008_partial_10_0088,
  ep_Q2_008_partial_10_0089,
  ep_Q2_008_partial_10_0090,
  ep_Q2_008_partial_10_0091,
  ep_Q2_008_partial_10_0092,
  ep_Q2_008_partial_10_0093,
  ep_Q2_008_partial_10_0094,
  ep_Q2_008_partial_10_0095,
  ep_Q2_008_partial_10_0096,
  ep_Q2_008_partial_10_0097,
  ep_Q2_008_partial_10_0098,
  ep_Q2_008_partial_10_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_10_0000_0099 : Poly :=
[
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((34075217052429451704413046852190379343000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((398345591271509885135193070152794112000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((398345591271509885135193070152794112000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (5, 2), (11, 1), (16, 1)],
  term ((33776457858975819290561652049575783759000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(0, 1), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-17037608526214725852206523426095189671500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(0, 1), (5, 3), (11, 1), (16, 1)],
  term ((-17037608526214725852206523426095189671500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 3), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (3, 1), (4, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term ((-34075217052429451704413046852190379343000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (4, 2), (11, 1), (16, 1)],
  term ((-34075217052429451704413046852190379343000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (4, 2), (15, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-34075217052429451704413046852190379343000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 2), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-34075217052429451704413046852190379343000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(1, 1), (4, 1), (5, 2), (11, 1), (16, 1)],
  term ((17037608526214725852206523426095189671500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((-257258514836484000 : Rat) / 692956453614176359) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((17037608526214725852206523426095189671500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(1, 1), (4, 3), (11, 1), (16, 1)],
  term ((17037608526214725852206523426095189671500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 3), (15, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((-257258514836484000 : Rat) / 692956453614176359) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((17037608526214725852206523426095189671500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-18982625112633358778440170737088000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (5, 1), (13, 2), (16, 1)],
  term ((-66925080449200531695 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-306663635551857420521063424918268800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-100971410173581695630000908176000000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (4, 1), (7, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((119101164276150000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7905546465169071375 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-189607854989892611835293581077233778000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-588487418397039748268613010066186003200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((621420137128607625 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((36763978068820552155 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-16569933114295740061723188288563256729600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((13914462838826399623651796466934740589897 : Rat) / 5817503512114810875025545802033898437862) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6708437300321726138652364873580172096000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1385153690424507000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((59550582138075000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((398483667050487750 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-24501248040506443715608703609468210940600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((13571547378614916015 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 3), (16, 1)],
  term ((-5014213127946281709 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-166741629986610000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1403239858816500714715407002676484150124721 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1184128710066408779043860787176839910400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((9176880548775748599 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-519432633909190125 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((5033392335722293481756429023752787392000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((931674219969845250 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8811941563511366976 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((2039153033496678906498931900117413158400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1272107640891308102359554209028952816686021 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((454324225789703292210376753034851200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3448052429063870577 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((44211816856089178842667132270619758914903 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (13, 3), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((312601291555366291394205212381116764784789 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-107070083348066030046052963029830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((227468392839044843915266045938892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((3348867905878671179056893675330084672000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 2), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-226781785658183312295521283371128188230250 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5812363292067344250 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5946263738749856250 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-398483667050487750 : Rat) / 692956453614176359) [(2, 1), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((24501248040506443715608703609468210940600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-59550582138075000 : Rat) / 692956453614176359) [(2, 1), (4, 2), (11, 2), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((-398483667050487750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((24501248040506443715608703609468210940600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-59550582138075000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (11, 2), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((-193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((9491312556316679389220085368544000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-32291916775513583922 : Rat) / 692956453614176359) [(3, 1), (4, 2), (5, 1), (13, 2), (16, 1)],
  term ((66925080449200531695 : Rat) / 5543651628913410872) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((153331817775928710260531712459134400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 1385912907228352718) [(3, 1), (4, 2), (7, 1), (13, 2), (16, 1)],
  term ((11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((50485705086790847815000454088000000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (7, 1), (15, 2), (16, 1)],
  term ((-1619646487561852949 : Rat) / 5543651628913410872) [(3, 1), (4, 2), (7, 1), (16, 1)],
  term ((304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (7, 2), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (4, 2), (9, 1), (16, 1)],
  term ((-59550582138075000 : Rat) / 692956453614176359) [(3, 1), (4, 2), (10, 1), (11, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((7905546465169071375 : Rat) / 1385912907228352718) [(3, 1), (4, 2), (10, 1), (13, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((94803927494946305917646790538616889000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((294243709198519874134306505033093001600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7146830570608836000 : Rat) / 692956453614176359) [(3, 1), (4, 2), (11, 1), (13, 2), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-621420137128607625 : Rat) / 2771825814456705436) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (13, 1), (15, 2), (16, 1)],
  term ((-36763978068820552155 : Rat) / 5543651628913410872) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((8284966557147870030861594144281628364800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (13, 2), (15, 1), (16, 1)],
  term ((-13914462838826399623651796466934740589897 : Rat) / 11635007024229621750051091604067796875724) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 3), (15, 1), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-166741629986610000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1403239858816500714715407002676484150124721 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1184128710066408779043860787176839910400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((9176880548775748599 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-519432633909190125 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((5033392335722293481756429023752787392000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((931674219969845250 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8811941563511366976 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((2039153033496678906498931900117413158400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1272107640891308102359554209028952816686021 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((454324225789703292210376753034851200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3448052429063870577 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((44211816856089178842667132270619758914903 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((312601291555366291394205212381116764784789 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-107070083348066030046052963029830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((227468392839044843915266045938892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((3348867905878671179056893675330084672000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-226781785658183312295521283371128188230250 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5812363292067344250 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5946263738749856250 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6703990677606224206054809453918857198400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 1385912907228352718) [(3, 1), (5, 2), (7, 1), (13, 2), (16, 1)],
  term ((11318370029125605455305825801807084800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((39096130019210832547936351645747200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((-12700876010957908949 : Rat) / 5543651628913410872) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 2), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (5, 2), (9, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((8702513799270046875 : Rat) / 1385912907228352718) [(3, 1), (5, 2), (10, 1), (13, 1), (16, 1)],
  term ((-760550990762443999512984918128450496000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21751934143153000843996946683848321159600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((294243709198519874134306505033093001600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7146830570608836000 : Rat) / 692956453614176359) [(3, 1), (5, 2), (11, 1), (13, 2), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-621420137128607625 : Rat) / 2771825814456705436) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((17522211445639111905 : Rat) / 5543651628913410872) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-2612318300293482750568443135561394454097228 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 3), (16, 1)],
  term ((-506950559583261110310798406257441907948681 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 3), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((9491312556316679389220085368544000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 3), (7, 1), (15, 1), (16, 1)],
  term ((-32291916775513583922 : Rat) / 692956453614176359) [(3, 1), (5, 3), (13, 2), (16, 1)],
  term ((66925080449200531695 : Rat) / 5543651628913410872) [(3, 1), (5, 3), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-306663635551857420521063424918268800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(3, 2), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-100971410173581695630000908176000000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((119101164276150000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7905546465169071375 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-189607854989892611835293581077233778000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-588487418397039748268613010066186003200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((621420137128607625 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((36763978068820552155 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-16569933114295740061723188288563256729600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((13914462838826399623651796466934740589897 : Rat) / 5817503512114810875025545802033898437862) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-18982625112633358778440170737088000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(3, 2), (5, 2), (13, 2), (16, 1)],
  term ((-66925080449200531695 : Rat) / 2771825814456705436) [(3, 2), (5, 2), (16, 1)],
  term ((199241833525243875 : Rat) / 692956453614176359) [(4, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12250624020253221857804351804734105470300 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((29775291069037500 : Rat) / 692956453614176359) [(4, 1), (5, 2), (11, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3354218650160863069326182436790086048000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((-29775291069037500 : Rat) / 692956453614176359) [(4, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 692956453614176359) [(4, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((12250624020253221857804351804734105470300 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-13571547378614916015 : Rat) / 2771825814456705436) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 2), (5, 1), (13, 3), (16, 1)],
  term ((5014213127946281709 : Rat) / 5543651628913410872) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(4, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1403239858816500714715407002676484150124721 : Rat) / 337415203702659030751481656517966109395996) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-592064355033204389521930393588419955200 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-9176880548775748599 : Rat) / 1385912907228352718) [(4, 2), (6, 1), (13, 2), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term ((519432633909190125 : Rat) / 1385912907228352718) [(4, 2), (6, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(4, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-465837109984922625 : Rat) / 692956453614176359) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4405970781755683488 : Rat) / 692956453614176359) [(4, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1019576516748339453249465950058706579200 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1272107640891308102359554209028952816686021 : Rat) / 337415203702659030751481656517966109395996) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-227162112894851646105188376517425600 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((3448052429063870577 : Rat) / 1385912907228352718) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-44211816856089178842667132270619758914903 : Rat) / 168707601851329515375740828258983054697998) [(4, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(4, 2), (7, 1), (13, 3), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-312601291555366291394205212381116764784789 : Rat) / 674830407405318061502963313035932218791992) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((53535041674033015023026481514915200 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (7, 1), (15, 3), (16, 1)],
  term ((-113734196419522421957633022969446400 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1674433952939335589528446837665042336000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (7, 2), (15, 2), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(4, 2), (7, 2), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((113390892829091656147760641685564094115125 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((2906181646033672125 : Rat) / 692956453614176359) [(4, 2), (10, 1), (13, 2), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2973131869374928125 : Rat) / 692956453614176359) [(4, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((199241833525243875 : Rat) / 692956453614176359) [(4, 3), (11, 1), (13, 1), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(4, 3), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12250624020253221857804351804734105470300 : Rat) / 84353800925664757687870414129491527348999) [(4, 3), (11, 1), (15, 1), (16, 1)],
  term ((29775291069037500 : Rat) / 692956453614176359) [(4, 3), (11, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 3), (13, 1), (15, 1), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 3), (15, 2), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(5, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1403239858816500714715407002676484150124721 : Rat) / 337415203702659030751481656517966109395996) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-592064355033204389521930393588419955200 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-9176880548775748599 : Rat) / 1385912907228352718) [(5, 2), (6, 1), (13, 2), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((519432633909190125 : Rat) / 1385912907228352718) [(5, 2), (6, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(5, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-465837109984922625 : Rat) / 692956453614176359) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4405970781755683488 : Rat) / 692956453614176359) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1019576516748339453249465950058706579200 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1272107640891308102359554209028952816686021 : Rat) / 337415203702659030751481656517966109395996) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-227162112894851646105188376517425600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((3448052429063870577 : Rat) / 1385912907228352718) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-44211816856089178842667132270619758914903 : Rat) / 168707601851329515375740828258983054697998) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(5, 2), (7, 1), (13, 3), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-312601291555366291394205212381116764784789 : Rat) / 674830407405318061502963313035932218791992) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((53535041674033015023026481514915200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (15, 3), (16, 1)],
  term ((-113734196419522421957633022969446400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1674433952939335589528446837665042336000 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (15, 2), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(5, 2), (7, 2), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((113390892829091656147760641685564094115125 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((2906181646033672125 : Rat) / 692956453614176359) [(5, 2), (10, 1), (13, 2), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2973131869374928125 : Rat) / 692956453614176359) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 3), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3354218650160863069326182436790086048000 : Rat) / 84353800925664757687870414129491527348999) [(5, 3), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 3), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 3), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(5, 3), (7, 1), (15, 2), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(5, 3), (7, 1), (16, 1)],
  term ((-29775291069037500 : Rat) / 692956453614176359) [(5, 3), (10, 1), (11, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 692956453614176359) [(5, 3), (10, 1), (13, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(5, 3), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((12250624020253221857804351804734105470300 : Rat) / 84353800925664757687870414129491527348999) [(5, 3), (10, 1), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 3), (12, 1), (13, 1), (16, 1)],
  term ((-13571547378614916015 : Rat) / 2771825814456705436) [(5, 3), (13, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 3), (13, 2), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 3), (13, 3), (16, 1)],
  term ((5014213127946281709 : Rat) / 5543651628913410872) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 0 through 99. -/
theorem ep_Q2_008_block_10_0000_0099_valid :
    checkProductSumEq ep_Q2_008_partials_10_0000_0099
      ep_Q2_008_block_10_0000_0099 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
