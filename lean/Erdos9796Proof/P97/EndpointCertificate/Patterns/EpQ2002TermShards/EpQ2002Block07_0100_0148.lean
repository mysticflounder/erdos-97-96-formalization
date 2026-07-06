/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 7:100-148

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 7 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_07_0100_0148 : Poly :=
[
  term (-2 : Rat) [(0, 1)],
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0100 : Poly :=
[
  term ((726139826040505736777485596040620139392 : Rat) / 22827427415598686891290631687354680805) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 100 for generator 7. -/
def ep_Q2_002_partial_07_0100 : Poly :=
[
  term ((-1452279652081011473554971192081240278784 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((726139826040505736777485596040620139392 : Rat) / 22827427415598686891290631687354680805) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((726139826040505736777485596040620139392 : Rat) / 22827427415598686891290631687354680805) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((1452279652081011473554971192081240278784 : Rat) / 22827427415598686891290631687354680805) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-726139826040505736777485596040620139392 : Rat) / 22827427415598686891290631687354680805) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-726139826040505736777485596040620139392 : Rat) / 22827427415598686891290631687354680805) [(6, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 7. -/
theorem ep_Q2_002_partial_07_0100_valid :
    mulPoly ep_Q2_002_coefficient_07_0100
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0101 : Poly :=
[
  term ((-154602244 : Rat) / 125446055) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 7. -/
def ep_Q2_002_partial_07_0101 : Poly :=
[
  term ((309204488 : Rat) / 125446055) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-154602244 : Rat) / 125446055) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-154602244 : Rat) / 125446055) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-309204488 : Rat) / 125446055) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((154602244 : Rat) / 125446055) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((154602244 : Rat) / 125446055) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 7. -/
theorem ep_Q2_002_partial_07_0101_valid :
    mulPoly ep_Q2_002_coefficient_07_0101
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0102 : Poly :=
[
  term ((63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 102 for generator 7. -/
def ep_Q2_002_partial_07_0102 : Poly :=
[
  term ((-126161347082390730137441462017536 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (11, 1), (13, 1)],
  term ((63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((126161347082390730137441462017536 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (12, 2), (13, 1)],
  term ((-63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 7. -/
theorem ep_Q2_002_partial_07_0102_valid :
    mulPoly ep_Q2_002_coefficient_07_0102
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0103 : Poly :=
[
  term ((3104557774203275675208324059070809000016 : Rat) / 22827427415598686891290631687354680805) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 103 for generator 7. -/
def ep_Q2_002_partial_07_0103 : Poly :=
[
  term ((-6209115548406551350416648118141618000032 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((3104557774203275675208324059070809000016 : Rat) / 22827427415598686891290631687354680805) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((3104557774203275675208324059070809000016 : Rat) / 22827427415598686891290631687354680805) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((6209115548406551350416648118141618000032 : Rat) / 22827427415598686891290631687354680805) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3104557774203275675208324059070809000016 : Rat) / 22827427415598686891290631687354680805) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-3104557774203275675208324059070809000016 : Rat) / 22827427415598686891290631687354680805) [(6, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 7. -/
theorem ep_Q2_002_partial_07_0103_valid :
    mulPoly ep_Q2_002_coefficient_07_0103
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0104 : Poly :=
[
  term ((446069948 : Rat) / 125446055) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 7. -/
def ep_Q2_002_partial_07_0104 : Poly :=
[
  term ((-892139896 : Rat) / 125446055) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((446069948 : Rat) / 125446055) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((446069948 : Rat) / 125446055) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((892139896 : Rat) / 125446055) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-446069948 : Rat) / 125446055) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-446069948 : Rat) / 125446055) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 7. -/
theorem ep_Q2_002_partial_07_0104_valid :
    mulPoly ep_Q2_002_coefficient_07_0104
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0105 : Poly :=
[
  term ((-33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2)]
]

/-- Partial product 105 for generator 7. -/
def ep_Q2_002_partial_07_0105 : Poly :=
[
  term ((66993521553328154838950219073408 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (11, 2)],
  term ((-33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(0, 2), (6, 1), (11, 2)],
  term ((-33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (11, 2)],
  term ((-66993521553328154838950219073408 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (12, 1)],
  term ((33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (12, 2)],
  term ((33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 7. -/
theorem ep_Q2_002_partial_07_0105_valid :
    mulPoly ep_Q2_002_coefficient_07_0105
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0106 : Poly :=
[
  term ((93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(6, 1), (15, 2)]
]

/-- Partial product 106 for generator 7. -/
def ep_Q2_002_partial_07_0106 : Poly :=
[
  term ((-186995975799945789957973916650752 : Rat) / 268063527727966972480841957465) [(0, 1), (6, 1), (15, 2)],
  term ((93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(0, 2), (6, 1), (15, 2)],
  term ((93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(1, 2), (6, 1), (15, 2)],
  term ((186995975799945789957973916650752 : Rat) / 268063527727966972480841957465) [(6, 1), (12, 1), (15, 2)],
  term ((-93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(6, 1), (12, 2), (15, 2)],
  term ((-93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(6, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 7. -/
theorem ep_Q2_002_partial_07_0106_valid :
    mulPoly ep_Q2_002_coefficient_07_0106
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0107 : Poly :=
[
  term ((12548443744 : Rat) / 7401317245) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 107 for generator 7. -/
def ep_Q2_002_partial_07_0107 : Poly :=
[
  term ((-25096887488 : Rat) / 7401317245) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((12548443744 : Rat) / 7401317245) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((12548443744 : Rat) / 7401317245) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((25096887488 : Rat) / 7401317245) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-12548443744 : Rat) / 7401317245) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-12548443744 : Rat) / 7401317245) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 7. -/
theorem ep_Q2_002_partial_07_0107_valid :
    mulPoly ep_Q2_002_coefficient_07_0107
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0108 : Poly :=
[
  term ((1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 108 for generator 7. -/
def ep_Q2_002_partial_07_0108 : Poly :=
[
  term ((-2646039613649392990272166435008 : Rat) / 8907625806546791523286541099) [(0, 1), (7, 1), (8, 1), (11, 1)],
  term ((1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(0, 2), (7, 1), (8, 1), (11, 1)],
  term ((1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(1, 2), (7, 1), (8, 1), (11, 1)],
  term ((2646039613649392990272166435008 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1), (12, 2)],
  term ((-1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 7. -/
theorem ep_Q2_002_partial_07_0108_valid :
    mulPoly ep_Q2_002_coefficient_07_0108
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0109 : Poly :=
[
  term ((-2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 109 for generator 7. -/
def ep_Q2_002_partial_07_0109 : Poly :=
[
  term ((4982988121107241377708512084736 : Rat) / 8907625806546791523286541099) [(0, 1), (7, 1), (8, 1), (13, 1)],
  term ((-2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(0, 2), (7, 1), (8, 1), (13, 1)],
  term ((-2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(1, 2), (7, 1), (8, 1), (13, 1)],
  term ((-4982988121107241377708512084736 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (12, 2), (13, 1)],
  term ((2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 7. -/
theorem ep_Q2_002_partial_07_0109_valid :
    mulPoly ep_Q2_002_coefficient_07_0109
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0110 : Poly :=
[
  term ((50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 110 for generator 7. -/
def ep_Q2_002_partial_07_0110 : Poly :=
[
  term ((-101847982213360759083310271207317145820768 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term ((50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term ((50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(1, 2), (7, 1), (8, 1), (15, 1)],
  term ((101847982213360759083310271207317145820768 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 7. -/
theorem ep_Q2_002_partial_07_0110_valid :
    mulPoly ep_Q2_002_coefficient_07_0110
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0111 : Poly :=
[
  term ((-105612228228 : Rat) / 7401317245) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 7. -/
def ep_Q2_002_partial_07_0111 : Poly :=
[
  term ((211224456456 : Rat) / 7401317245) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-105612228228 : Rat) / 7401317245) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-105612228228 : Rat) / 7401317245) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-211224456456 : Rat) / 7401317245) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((105612228228 : Rat) / 7401317245) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((105612228228 : Rat) / 7401317245) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 7. -/
theorem ep_Q2_002_partial_07_0111_valid :
    mulPoly ep_Q2_002_coefficient_07_0111
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0112 : Poly :=
[
  term ((-50022610913880912873789908872488 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1)]
]

/-- Partial product 112 for generator 7. -/
def ep_Q2_002_partial_07_0112 : Poly :=
[
  term ((100045221827761825747579817744976 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1)],
  term ((-50022610913880912873789908872488 : Rat) / 1273790490336191187829975377157) [(0, 2), (7, 1), (11, 1)],
  term ((-50022610913880912873789908872488 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (11, 1)],
  term ((-100045221827761825747579817744976 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1)],
  term ((50022610913880912873789908872488 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 2)],
  term ((50022610913880912873789908872488 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 7. -/
theorem ep_Q2_002_partial_07_0112_valid :
    mulPoly ep_Q2_002_coefficient_07_0112
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0113 : Poly :=
[
  term ((94201944175302093012264141172896 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1)]
]

/-- Partial product 113 for generator 7. -/
def ep_Q2_002_partial_07_0113 : Poly :=
[
  term ((-188403888350604186024528282345792 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1)],
  term ((94201944175302093012264141172896 : Rat) / 1273790490336191187829975377157) [(0, 2), (7, 1), (13, 1)],
  term ((94201944175302093012264141172896 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (13, 1)],
  term ((188403888350604186024528282345792 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1)],
  term ((-94201944175302093012264141172896 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 2), (13, 1)],
  term ((-94201944175302093012264141172896 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 7. -/
theorem ep_Q2_002_partial_07_0113_valid :
    mulPoly ep_Q2_002_coefficient_07_0113
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0114 : Poly :=
[
  term ((7776595159354467290190020182450443487224 : Rat) / 103601401347717117429703636119532782115) [(7, 1), (15, 1)]
]

/-- Partial product 114 for generator 7. -/
def ep_Q2_002_partial_07_0114 : Poly :=
[
  term ((-15553190318708934580380040364900886974448 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (7, 1), (15, 1)],
  term ((7776595159354467290190020182450443487224 : Rat) / 103601401347717117429703636119532782115) [(0, 2), (7, 1), (15, 1)],
  term ((7776595159354467290190020182450443487224 : Rat) / 103601401347717117429703636119532782115) [(1, 2), (7, 1), (15, 1)],
  term ((15553190318708934580380040364900886974448 : Rat) / 103601401347717117429703636119532782115) [(7, 1), (12, 1), (15, 1)],
  term ((-7776595159354467290190020182450443487224 : Rat) / 103601401347717117429703636119532782115) [(7, 1), (12, 2), (15, 1)],
  term ((-7776595159354467290190020182450443487224 : Rat) / 103601401347717117429703636119532782115) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 7. -/
theorem ep_Q2_002_partial_07_0114_valid :
    mulPoly ep_Q2_002_coefficient_07_0114
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0115 : Poly :=
[
  term ((34428466496 : Rat) / 7401317245) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 7. -/
def ep_Q2_002_partial_07_0115 : Poly :=
[
  term ((-68856932992 : Rat) / 7401317245) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((34428466496 : Rat) / 7401317245) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((34428466496 : Rat) / 7401317245) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((68856932992 : Rat) / 7401317245) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-34428466496 : Rat) / 7401317245) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-34428466496 : Rat) / 7401317245) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 7. -/
theorem ep_Q2_002_partial_07_0115_valid :
    mulPoly ep_Q2_002_coefficient_07_0115
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0116 : Poly :=
[
  term ((-49990425186455551953219104950896 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 116 for generator 7. -/
def ep_Q2_002_partial_07_0116 : Poly :=
[
  term ((99980850372911103906438209901792 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((-49990425186455551953219104950896 : Rat) / 1273790490336191187829975377157) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((-49990425186455551953219104950896 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((-99980850372911103906438209901792 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((49990425186455551953219104950896 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((49990425186455551953219104950896 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 7. -/
theorem ep_Q2_002_partial_07_0116_valid :
    mulPoly ep_Q2_002_coefficient_07_0116
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0117 : Poly :=
[
  term ((-150682264586282330969773882198158255234528 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 117 for generator 7. -/
def ep_Q2_002_partial_07_0117 : Poly :=
[
  term ((301364529172564661939547764396316510469056 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((-150682264586282330969773882198158255234528 : Rat) / 269363643504064505317229453910785233499) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-150682264586282330969773882198158255234528 : Rat) / 269363643504064505317229453910785233499) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-301364529172564661939547764396316510469056 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((150682264586282330969773882198158255234528 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((150682264586282330969773882198158255234528 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 7. -/
theorem ep_Q2_002_partial_07_0117_valid :
    mulPoly ep_Q2_002_coefficient_07_0117
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0118 : Poly :=
[
  term ((-7145891948 : Rat) / 1480263449) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 7. -/
def ep_Q2_002_partial_07_0118 : Poly :=
[
  term ((14291783896 : Rat) / 1480263449) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7145891948 : Rat) / 1480263449) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7145891948 : Rat) / 1480263449) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14291783896 : Rat) / 1480263449) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7145891948 : Rat) / 1480263449) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((7145891948 : Rat) / 1480263449) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 7. -/
theorem ep_Q2_002_partial_07_0118_valid :
    mulPoly ep_Q2_002_coefficient_07_0118
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0119 : Poly :=
[
  term ((29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2)]
]

/-- Partial product 119 for generator 7. -/
def ep_Q2_002_partial_07_0119 : Poly :=
[
  term ((-59810297699116538329377365866080 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (11, 2)],
  term ((29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(0, 2), (8, 1), (11, 2)],
  term ((29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (11, 2)],
  term ((59810297699116538329377365866080 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (12, 1)],
  term ((-29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (12, 2)],
  term ((-29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 7. -/
theorem ep_Q2_002_partial_07_0119_valid :
    mulPoly ep_Q2_002_coefficient_07_0119
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0120 : Poly :=
[
  term ((394368643006219881228752177946287095351728 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 120 for generator 7. -/
def ep_Q2_002_partial_07_0120 : Poly :=
[
  term ((-788737286012439762457504355892574190703456 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((394368643006219881228752177946287095351728 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((394368643006219881228752177946287095351728 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((788737286012439762457504355892574190703456 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-394368643006219881228752177946287095351728 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 2), (13, 1), (15, 1)],
  term ((-394368643006219881228752177946287095351728 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 7. -/
theorem ep_Q2_002_partial_07_0120_valid :
    mulPoly ep_Q2_002_coefficient_07_0120
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0121 : Poly :=
[
  term ((490541904 : Rat) / 7401317245) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 7. -/
def ep_Q2_002_partial_07_0121 : Poly :=
[
  term ((-981083808 : Rat) / 7401317245) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((490541904 : Rat) / 7401317245) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((490541904 : Rat) / 7401317245) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((981083808 : Rat) / 7401317245) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-490541904 : Rat) / 7401317245) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-490541904 : Rat) / 7401317245) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 7. -/
theorem ep_Q2_002_partial_07_0121_valid :
    mulPoly ep_Q2_002_coefficient_07_0121
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0122 : Poly :=
[
  term ((-1083101547076499288901917043648 : Rat) / 115799135485108289802725034287) [(8, 1), (13, 2)]
]

/-- Partial product 122 for generator 7. -/
def ep_Q2_002_partial_07_0122 : Poly :=
[
  term ((2166203094152998577803834087296 : Rat) / 115799135485108289802725034287) [(0, 1), (8, 1), (13, 2)],
  term ((-1083101547076499288901917043648 : Rat) / 115799135485108289802725034287) [(0, 2), (8, 1), (13, 2)],
  term ((-1083101547076499288901917043648 : Rat) / 115799135485108289802725034287) [(1, 2), (8, 1), (13, 2)],
  term ((-2166203094152998577803834087296 : Rat) / 115799135485108289802725034287) [(8, 1), (12, 1), (13, 2)],
  term ((1083101547076499288901917043648 : Rat) / 115799135485108289802725034287) [(8, 1), (12, 2), (13, 2)],
  term ((1083101547076499288901917043648 : Rat) / 115799135485108289802725034287) [(8, 1), (13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 7. -/
theorem ep_Q2_002_partial_07_0122_valid :
    mulPoly ep_Q2_002_coefficient_07_0122
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0123 : Poly :=
[
  term ((-932351934971811838457149374027188133685008 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (15, 2)]
]

/-- Partial product 123 for generator 7. -/
def ep_Q2_002_partial_07_0123 : Poly :=
[
  term ((1864703869943623676914298748054376267370016 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (15, 2)],
  term ((-932351934971811838457149374027188133685008 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (8, 1), (15, 2)],
  term ((-932351934971811838457149374027188133685008 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (8, 1), (15, 2)],
  term ((-1864703869943623676914298748054376267370016 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 1), (15, 2)],
  term ((932351934971811838457149374027188133685008 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 2), (15, 2)],
  term ((932351934971811838457149374027188133685008 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 7. -/
theorem ep_Q2_002_partial_07_0123_valid :
    mulPoly ep_Q2_002_coefficient_07_0123
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0124 : Poly :=
[
  term ((44849223836 : Rat) / 7401317245) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 124 for generator 7. -/
def ep_Q2_002_partial_07_0124 : Poly :=
[
  term ((-89698447672 : Rat) / 7401317245) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((44849223836 : Rat) / 7401317245) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((44849223836 : Rat) / 7401317245) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((89698447672 : Rat) / 7401317245) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-44849223836 : Rat) / 7401317245) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-44849223836 : Rat) / 7401317245) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 7. -/
theorem ep_Q2_002_partial_07_0124_valid :
    mulPoly ep_Q2_002_coefficient_07_0124
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0125 : Poly :=
[
  term ((-17946956829521454582935602761120 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1)]
]

/-- Partial product 125 for generator 7. -/
def ep_Q2_002_partial_07_0125 : Poly :=
[
  term ((35893913659042909165871205522240 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1)],
  term ((-17946956829521454582935602761120 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (11, 1)],
  term ((-17946956829521454582935602761120 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (11, 1)],
  term ((-35893913659042909165871205522240 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1)],
  term ((17946956829521454582935602761120 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 2)],
  term ((17946956829521454582935602761120 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 7. -/
theorem ep_Q2_002_partial_07_0125_valid :
    mulPoly ep_Q2_002_coefficient_07_0125
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0126 : Poly :=
[
  term ((-575142771669409104941412655344 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 126 for generator 7. -/
def ep_Q2_002_partial_07_0126 : Poly :=
[
  term ((1150285543338818209882825310688 : Rat) / 115799135485108289802725034287) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-575142771669409104941412655344 : Rat) / 115799135485108289802725034287) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((-575142771669409104941412655344 : Rat) / 115799135485108289802725034287) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((575142771669409104941412655344 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-1150285543338818209882825310688 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (12, 2)],
  term ((575142771669409104941412655344 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 7. -/
theorem ep_Q2_002_partial_07_0126_valid :
    mulPoly ep_Q2_002_coefficient_07_0126
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0127 : Poly :=
[
  term ((1083101547076499288901917043648 : Rat) / 115799135485108289802725034287) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 127 for generator 7. -/
def ep_Q2_002_partial_07_0127 : Poly :=
[
  term ((-2166203094152998577803834087296 : Rat) / 115799135485108289802725034287) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((1083101547076499288901917043648 : Rat) / 115799135485108289802725034287) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((1083101547076499288901917043648 : Rat) / 115799135485108289802725034287) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((-1083101547076499288901917043648 : Rat) / 115799135485108289802725034287) [(9, 1), (12, 1), (13, 3)],
  term ((2166203094152998577803834087296 : Rat) / 115799135485108289802725034287) [(9, 1), (12, 2), (13, 1)],
  term ((-1083101547076499288901917043648 : Rat) / 115799135485108289802725034287) [(9, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 7. -/
theorem ep_Q2_002_partial_07_0127_valid :
    mulPoly ep_Q2_002_coefficient_07_0127
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0128 : Poly :=
[
  term ((-15852935068759934758332573304357250458128 : Rat) / 122438019774574775144195206323084197045) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 128 for generator 7. -/
def ep_Q2_002_partial_07_0128 : Poly :=
[
  term ((31705870137519869516665146608714500916256 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-15852935068759934758332573304357250458128 : Rat) / 122438019774574775144195206323084197045) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-15852935068759934758332573304357250458128 : Rat) / 122438019774574775144195206323084197045) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((15852935068759934758332573304357250458128 : Rat) / 122438019774574775144195206323084197045) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-31705870137519869516665146608714500916256 : Rat) / 122438019774574775144195206323084197045) [(9, 1), (12, 2), (15, 1)],
  term ((15852935068759934758332573304357250458128 : Rat) / 122438019774574775144195206323084197045) [(9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 7. -/
theorem ep_Q2_002_partial_07_0128_valid :
    mulPoly ep_Q2_002_coefficient_07_0128
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0129 : Poly :=
[
  term ((-490541904 : Rat) / 7401317245) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 7. -/
def ep_Q2_002_partial_07_0129 : Poly :=
[
  term ((981083808 : Rat) / 7401317245) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-490541904 : Rat) / 7401317245) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-490541904 : Rat) / 7401317245) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((490541904 : Rat) / 7401317245) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-981083808 : Rat) / 7401317245) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((490541904 : Rat) / 7401317245) [(9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 7. -/
theorem ep_Q2_002_partial_07_0129_valid :
    mulPoly ep_Q2_002_coefficient_07_0129
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0130 : Poly :=
[
  term ((33797480668926795708640842983040 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1)]
]

/-- Partial product 130 for generator 7. -/
def ep_Q2_002_partial_07_0130 : Poly :=
[
  term ((-67594961337853591417281685966080 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1)],
  term ((33797480668926795708640842983040 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (13, 1)],
  term ((33797480668926795708640842983040 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (13, 1)],
  term ((67594961337853591417281685966080 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1)],
  term ((-33797480668926795708640842983040 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 2), (13, 1)],
  term ((-33797480668926795708640842983040 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 7. -/
theorem ep_Q2_002_partial_07_0130_valid :
    mulPoly ep_Q2_002_coefficient_07_0130
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0131 : Poly :=
[
  term ((146671711757322441054093804489908326819560 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (15, 1)]
]

/-- Partial product 131 for generator 7. -/
def ep_Q2_002_partial_07_0131 : Poly :=
[
  term ((-293343423514644882108187608979816653639120 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (15, 1)],
  term ((146671711757322441054093804489908326819560 : Rat) / 269363643504064505317229453910785233499) [(0, 2), (9, 1), (15, 1)],
  term ((146671711757322441054093804489908326819560 : Rat) / 269363643504064505317229453910785233499) [(1, 2), (9, 1), (15, 1)],
  term ((293343423514644882108187608979816653639120 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (12, 1), (15, 1)],
  term ((-146671711757322441054093804489908326819560 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (12, 2), (15, 1)],
  term ((-146671711757322441054093804489908326819560 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 7. -/
theorem ep_Q2_002_partial_07_0131_valid :
    mulPoly ep_Q2_002_coefficient_07_0131
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0132 : Poly :=
[
  term ((6087141682 : Rat) / 1480263449) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 7. -/
def ep_Q2_002_partial_07_0132 : Poly :=
[
  term ((-12174283364 : Rat) / 1480263449) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((6087141682 : Rat) / 1480263449) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((6087141682 : Rat) / 1480263449) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((12174283364 : Rat) / 1480263449) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6087141682 : Rat) / 1480263449) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6087141682 : Rat) / 1480263449) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 7. -/
theorem ep_Q2_002_partial_07_0132_valid :
    mulPoly ep_Q2_002_coefficient_07_0132
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0133 : Poly :=
[
  term ((63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 133 for generator 7. -/
def ep_Q2_002_partial_07_0133 : Poly :=
[
  term ((-126161347082390730137441462017536 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((-63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 3)],
  term ((126161347082390730137441462017536 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 2), (13, 1)],
  term ((-63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 7. -/
theorem ep_Q2_002_partial_07_0133_valid :
    mulPoly ep_Q2_002_coefficient_07_0133
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0134 : Poly :=
[
  term ((77234071176245259251125708692338062663392 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 134 for generator 7. -/
def ep_Q2_002_partial_07_0134 : Poly :=
[
  term ((-154468142352490518502251417384676125326784 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((77234071176245259251125708692338062663392 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((77234071176245259251125708692338062663392 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-77234071176245259251125708692338062663392 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((154468142352490518502251417384676125326784 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 2), (15, 1)],
  term ((-77234071176245259251125708692338062663392 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 7. -/
theorem ep_Q2_002_partial_07_0134_valid :
    mulPoly ep_Q2_002_coefficient_07_0134
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0135 : Poly :=
[
  term ((23181015996 : Rat) / 7401317245) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 7. -/
def ep_Q2_002_partial_07_0135 : Poly :=
[
  term ((-46362031992 : Rat) / 7401317245) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((23181015996 : Rat) / 7401317245) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((23181015996 : Rat) / 7401317245) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-23181015996 : Rat) / 7401317245) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((46362031992 : Rat) / 7401317245) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-23181015996 : Rat) / 7401317245) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 7. -/
theorem ep_Q2_002_partial_07_0135_valid :
    mulPoly ep_Q2_002_coefficient_07_0135
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0136 : Poly :=
[
  term ((-1478631971385053139776972577552 : Rat) / 115799135485108289802725034287) [(11, 1), (13, 1)]
]

/-- Partial product 136 for generator 7. -/
def ep_Q2_002_partial_07_0136 : Poly :=
[
  term ((2957263942770106279553945155104 : Rat) / 115799135485108289802725034287) [(0, 1), (11, 1), (13, 1)],
  term ((-1478631971385053139776972577552 : Rat) / 115799135485108289802725034287) [(0, 2), (11, 1), (13, 1)],
  term ((-1478631971385053139776972577552 : Rat) / 115799135485108289802725034287) [(1, 2), (11, 1), (13, 1)],
  term ((-2957263942770106279553945155104 : Rat) / 115799135485108289802725034287) [(11, 1), (12, 1), (13, 1)],
  term ((1478631971385053139776972577552 : Rat) / 115799135485108289802725034287) [(11, 1), (12, 2), (13, 1)],
  term ((1478631971385053139776972577552 : Rat) / 115799135485108289802725034287) [(11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 7. -/
theorem ep_Q2_002_partial_07_0136_valid :
    mulPoly ep_Q2_002_coefficient_07_0136
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0137 : Poly :=
[
  term ((-125781151866158874115483347887807384991456 : Rat) / 269363643504064505317229453910785233499) [(11, 1), (15, 1)]
]

/-- Partial product 137 for generator 7. -/
def ep_Q2_002_partial_07_0137 : Poly :=
[
  term ((251562303732317748230966695775614769982912 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (11, 1), (15, 1)],
  term ((-125781151866158874115483347887807384991456 : Rat) / 269363643504064505317229453910785233499) [(0, 2), (11, 1), (15, 1)],
  term ((-125781151866158874115483347887807384991456 : Rat) / 269363643504064505317229453910785233499) [(1, 2), (11, 1), (15, 1)],
  term ((-251562303732317748230966695775614769982912 : Rat) / 269363643504064505317229453910785233499) [(11, 1), (12, 1), (15, 1)],
  term ((125781151866158874115483347887807384991456 : Rat) / 269363643504064505317229453910785233499) [(11, 1), (12, 2), (15, 1)],
  term ((125781151866158874115483347887807384991456 : Rat) / 269363643504064505317229453910785233499) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 7. -/
theorem ep_Q2_002_partial_07_0137_valid :
    mulPoly ep_Q2_002_coefficient_07_0137
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0138 : Poly :=
[
  term ((-7145891948 : Rat) / 1480263449) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 7. -/
def ep_Q2_002_partial_07_0138 : Poly :=
[
  term ((14291783896 : Rat) / 1480263449) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7145891948 : Rat) / 1480263449) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7145891948 : Rat) / 1480263449) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-14291783896 : Rat) / 1480263449) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7145891948 : Rat) / 1480263449) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((7145891948 : Rat) / 1480263449) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 7. -/
theorem ep_Q2_002_partial_07_0138_valid :
    mulPoly ep_Q2_002_coefficient_07_0138
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0139 : Poly :=
[
  term ((2881904983010106662916536021352 : Rat) / 115799135485108289802725034287) [(11, 2)]
]

/-- Partial product 139 for generator 7. -/
def ep_Q2_002_partial_07_0139 : Poly :=
[
  term ((-5763809966020213325833072042704 : Rat) / 115799135485108289802725034287) [(0, 1), (11, 2)],
  term ((2881904983010106662916536021352 : Rat) / 115799135485108289802725034287) [(0, 2), (11, 2)],
  term ((2881904983010106662916536021352 : Rat) / 115799135485108289802725034287) [(1, 2), (11, 2)],
  term ((5763809966020213325833072042704 : Rat) / 115799135485108289802725034287) [(11, 2), (12, 1)],
  term ((-2881904983010106662916536021352 : Rat) / 115799135485108289802725034287) [(11, 2), (12, 2)],
  term ((-2881904983010106662916536021352 : Rat) / 115799135485108289802725034287) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 7. -/
theorem ep_Q2_002_partial_07_0139_valid :
    mulPoly ep_Q2_002_coefficient_07_0139
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0140 : Poly :=
[
  term ((-33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1)]
]

/-- Partial product 140 for generator 7. -/
def ep_Q2_002_partial_07_0140 : Poly :=
[
  term ((66993521553328154838950219073408 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2), (12, 1)],
  term ((-33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 2), (12, 1)],
  term ((-33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(1, 2), (11, 2), (12, 1)],
  term ((33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1), (13, 2)],
  term ((-66993521553328154838950219073408 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 2)],
  term ((33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 7. -/
theorem ep_Q2_002_partial_07_0140_valid :
    mulPoly ep_Q2_002_coefficient_07_0140
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0141 : Poly :=
[
  term ((-20490360972580534061968358251968 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 141 for generator 7. -/
def ep_Q2_002_partial_07_0141 : Poly :=
[
  term ((40980721945161068123936716503936 : Rat) / 1273790490336191187829975377157) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-20490360972580534061968358251968 : Rat) / 1273790490336191187829975377157) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-20490360972580534061968358251968 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((20490360972580534061968358251968 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 3), (15, 1)],
  term ((-40980721945161068123936716503936 : Rat) / 1273790490336191187829975377157) [(12, 2), (13, 1), (15, 1)],
  term ((20490360972580534061968358251968 : Rat) / 1273790490336191187829975377157) [(12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 7. -/
theorem ep_Q2_002_partial_07_0141_valid :
    mulPoly ep_Q2_002_coefficient_07_0141
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0142 : Poly :=
[
  term ((-581373527092511540690727434301431354053056 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (15, 2)]
]

/-- Partial product 142 for generator 7. -/
def ep_Q2_002_partial_07_0142 : Poly :=
[
  term ((1162747054185023081381454868602862708106112 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 1), (15, 2)],
  term ((-581373527092511540690727434301431354053056 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (12, 1), (15, 2)],
  term ((-581373527092511540690727434301431354053056 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (12, 1), (15, 2)],
  term ((581373527092511540690727434301431354053056 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 2), (15, 2)],
  term ((-1162747054185023081381454868602862708106112 : Rat) / 1346818217520322526586147269553926167495) [(12, 2), (15, 2)],
  term ((581373527092511540690727434301431354053056 : Rat) / 1346818217520322526586147269553926167495) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 7. -/
theorem ep_Q2_002_partial_07_0142_valid :
    mulPoly ep_Q2_002_coefficient_07_0142
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0143 : Poly :=
[
  term ((-3380891244 : Rat) / 1057331035) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 143 for generator 7. -/
def ep_Q2_002_partial_07_0143 : Poly :=
[
  term ((6761782488 : Rat) / 1057331035) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3380891244 : Rat) / 1057331035) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-3380891244 : Rat) / 1057331035) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((3380891244 : Rat) / 1057331035) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-6761782488 : Rat) / 1057331035) [(12, 2), (15, 2), (16, 1)],
  term ((3380891244 : Rat) / 1057331035) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 7. -/
theorem ep_Q2_002_partial_07_0143_valid :
    mulPoly ep_Q2_002_coefficient_07_0143
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0144 : Poly :=
[
  term ((667840725615533836659084905203791892925748 : Rat) / 1346818217520322526586147269553926167495) [(13, 1), (15, 1)]
]

/-- Partial product 144 for generator 7. -/
def ep_Q2_002_partial_07_0144 : Poly :=
[
  term ((-1335681451231067673318169810407583785851496 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (13, 1), (15, 1)],
  term ((667840725615533836659084905203791892925748 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (13, 1), (15, 1)],
  term ((667840725615533836659084905203791892925748 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (13, 1), (15, 1)],
  term ((1335681451231067673318169810407583785851496 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (15, 1)],
  term ((-667840725615533836659084905203791892925748 : Rat) / 1346818217520322526586147269553926167495) [(12, 2), (13, 1), (15, 1)],
  term ((-667840725615533836659084905203791892925748 : Rat) / 1346818217520322526586147269553926167495) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 7. -/
theorem ep_Q2_002_partial_07_0144_valid :
    mulPoly ep_Q2_002_coefficient_07_0144
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0145 : Poly :=
[
  term ((-13308140771 : Rat) / 7401317245) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 7. -/
def ep_Q2_002_partial_07_0145 : Poly :=
[
  term ((26616281542 : Rat) / 7401317245) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13308140771 : Rat) / 7401317245) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-13308140771 : Rat) / 7401317245) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-26616281542 : Rat) / 7401317245) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((13308140771 : Rat) / 7401317245) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((13308140771 : Rat) / 7401317245) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 7. -/
theorem ep_Q2_002_partial_07_0145_valid :
    mulPoly ep_Q2_002_coefficient_07_0145
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0146 : Poly :=
[
  term ((-7435830498643859124695935316544 : Rat) / 115799135485108289802725034287) [(13, 2)]
]

/-- Partial product 146 for generator 7. -/
def ep_Q2_002_partial_07_0146 : Poly :=
[
  term ((14871660997287718249391870633088 : Rat) / 115799135485108289802725034287) [(0, 1), (13, 2)],
  term ((-7435830498643859124695935316544 : Rat) / 115799135485108289802725034287) [(0, 2), (13, 2)],
  term ((-7435830498643859124695935316544 : Rat) / 115799135485108289802725034287) [(1, 2), (13, 2)],
  term ((-14871660997287718249391870633088 : Rat) / 115799135485108289802725034287) [(12, 1), (13, 2)],
  term ((7435830498643859124695935316544 : Rat) / 115799135485108289802725034287) [(12, 2), (13, 2)],
  term ((7435830498643859124695935316544 : Rat) / 115799135485108289802725034287) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 7. -/
theorem ep_Q2_002_partial_07_0146_valid :
    mulPoly ep_Q2_002_coefficient_07_0146
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0147 : Poly :=
[
  term ((-725153873267170989937388239344316957145328 : Rat) / 1346818217520322526586147269553926167495) [(15, 2)]
]

/-- Partial product 147 for generator 7. -/
def ep_Q2_002_partial_07_0147 : Poly :=
[
  term ((1450307746534341979874776478688633914290656 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (15, 2)],
  term ((-725153873267170989937388239344316957145328 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (15, 2)],
  term ((-725153873267170989937388239344316957145328 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (15, 2)],
  term ((-1450307746534341979874776478688633914290656 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (15, 2)],
  term ((725153873267170989937388239344316957145328 : Rat) / 1346818217520322526586147269553926167495) [(12, 2), (15, 2)],
  term ((725153873267170989937388239344316957145328 : Rat) / 1346818217520322526586147269553926167495) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 7. -/
theorem ep_Q2_002_partial_07_0147_valid :
    mulPoly ep_Q2_002_coefficient_07_0147
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0148 : Poly :=
[
  term ((7783626386 : Rat) / 7401317245) [(15, 2), (16, 1)]
]

/-- Partial product 148 for generator 7. -/
def ep_Q2_002_partial_07_0148 : Poly :=
[
  term ((-15567252772 : Rat) / 7401317245) [(0, 1), (15, 2), (16, 1)],
  term ((7783626386 : Rat) / 7401317245) [(0, 2), (15, 2), (16, 1)],
  term ((7783626386 : Rat) / 7401317245) [(1, 2), (15, 2), (16, 1)],
  term ((15567252772 : Rat) / 7401317245) [(12, 1), (15, 2), (16, 1)],
  term ((-7783626386 : Rat) / 7401317245) [(12, 2), (15, 2), (16, 1)],
  term ((-7783626386 : Rat) / 7401317245) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 7. -/
theorem ep_Q2_002_partial_07_0148_valid :
    mulPoly ep_Q2_002_coefficient_07_0148
        ep_Q2_002_generator_07_0100_0148 =
      ep_Q2_002_partial_07_0148 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_07_0100_0148 : List Poly :=
[
  ep_Q2_002_partial_07_0100,
  ep_Q2_002_partial_07_0101,
  ep_Q2_002_partial_07_0102,
  ep_Q2_002_partial_07_0103,
  ep_Q2_002_partial_07_0104,
  ep_Q2_002_partial_07_0105,
  ep_Q2_002_partial_07_0106,
  ep_Q2_002_partial_07_0107,
  ep_Q2_002_partial_07_0108,
  ep_Q2_002_partial_07_0109,
  ep_Q2_002_partial_07_0110,
  ep_Q2_002_partial_07_0111,
  ep_Q2_002_partial_07_0112,
  ep_Q2_002_partial_07_0113,
  ep_Q2_002_partial_07_0114,
  ep_Q2_002_partial_07_0115,
  ep_Q2_002_partial_07_0116,
  ep_Q2_002_partial_07_0117,
  ep_Q2_002_partial_07_0118,
  ep_Q2_002_partial_07_0119,
  ep_Q2_002_partial_07_0120,
  ep_Q2_002_partial_07_0121,
  ep_Q2_002_partial_07_0122,
  ep_Q2_002_partial_07_0123,
  ep_Q2_002_partial_07_0124,
  ep_Q2_002_partial_07_0125,
  ep_Q2_002_partial_07_0126,
  ep_Q2_002_partial_07_0127,
  ep_Q2_002_partial_07_0128,
  ep_Q2_002_partial_07_0129,
  ep_Q2_002_partial_07_0130,
  ep_Q2_002_partial_07_0131,
  ep_Q2_002_partial_07_0132,
  ep_Q2_002_partial_07_0133,
  ep_Q2_002_partial_07_0134,
  ep_Q2_002_partial_07_0135,
  ep_Q2_002_partial_07_0136,
  ep_Q2_002_partial_07_0137,
  ep_Q2_002_partial_07_0138,
  ep_Q2_002_partial_07_0139,
  ep_Q2_002_partial_07_0140,
  ep_Q2_002_partial_07_0141,
  ep_Q2_002_partial_07_0142,
  ep_Q2_002_partial_07_0143,
  ep_Q2_002_partial_07_0144,
  ep_Q2_002_partial_07_0145,
  ep_Q2_002_partial_07_0146,
  ep_Q2_002_partial_07_0147,
  ep_Q2_002_partial_07_0148
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_07_0100_0148 : Poly :=
[
  term ((-1452279652081011473554971192081240278784 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((309204488 : Rat) / 125446055) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-126161347082390730137441462017536 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (11, 1), (13, 1)],
  term ((-6209115548406551350416648118141618000032 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((-892139896 : Rat) / 125446055) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((66993521553328154838950219073408 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (11, 2)],
  term ((-186995975799945789957973916650752 : Rat) / 268063527727966972480841957465) [(0, 1), (6, 1), (15, 2)],
  term ((-25096887488 : Rat) / 7401317245) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-2646039613649392990272166435008 : Rat) / 8907625806546791523286541099) [(0, 1), (7, 1), (8, 1), (11, 1)],
  term ((4982988121107241377708512084736 : Rat) / 8907625806546791523286541099) [(0, 1), (7, 1), (8, 1), (13, 1)],
  term ((-101847982213360759083310271207317145820768 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term ((211224456456 : Rat) / 7401317245) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((100045221827761825747579817744976 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1)],
  term ((-188403888350604186024528282345792 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1)],
  term ((-15553190318708934580380040364900886974448 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (7, 1), (15, 1)],
  term ((-68856932992 : Rat) / 7401317245) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((99980850372911103906438209901792 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((301364529172564661939547764396316510469056 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((14291783896 : Rat) / 1480263449) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-59810297699116538329377365866080 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (11, 2)],
  term ((-788737286012439762457504355892574190703456 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((-981083808 : Rat) / 7401317245) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((2166203094152998577803834087296 : Rat) / 115799135485108289802725034287) [(0, 1), (8, 1), (13, 2)],
  term ((1864703869943623676914298748054376267370016 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (15, 2)],
  term ((-89698447672 : Rat) / 7401317245) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((35893913659042909165871205522240 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1)],
  term ((1150285543338818209882825310688 : Rat) / 115799135485108289802725034287) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-2166203094152998577803834087296 : Rat) / 115799135485108289802725034287) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((31705870137519869516665146608714500916256 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((981083808 : Rat) / 7401317245) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-67594961337853591417281685966080 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1)],
  term ((-293343423514644882108187608979816653639120 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (15, 1)],
  term ((-12174283364 : Rat) / 1480263449) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-126161347082390730137441462017536 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-154468142352490518502251417384676125326784 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-46362031992 : Rat) / 7401317245) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2957263942770106279553945155104 : Rat) / 115799135485108289802725034287) [(0, 1), (11, 1), (13, 1)],
  term ((251562303732317748230966695775614769982912 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (11, 1), (15, 1)],
  term ((14291783896 : Rat) / 1480263449) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5763809966020213325833072042704 : Rat) / 115799135485108289802725034287) [(0, 1), (11, 2)],
  term ((66993521553328154838950219073408 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2), (12, 1)],
  term ((40980721945161068123936716503936 : Rat) / 1273790490336191187829975377157) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((1162747054185023081381454868602862708106112 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 1), (15, 2)],
  term ((6761782488 : Rat) / 1057331035) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1335681451231067673318169810407583785851496 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (13, 1), (15, 1)],
  term ((26616281542 : Rat) / 7401317245) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((14871660997287718249391870633088 : Rat) / 115799135485108289802725034287) [(0, 1), (13, 2)],
  term ((1450307746534341979874776478688633914290656 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (15, 2)],
  term ((-15567252772 : Rat) / 7401317245) [(0, 1), (15, 2), (16, 1)],
  term ((726139826040505736777485596040620139392 : Rat) / 22827427415598686891290631687354680805) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((-154602244 : Rat) / 125446055) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((3104557774203275675208324059070809000016 : Rat) / 22827427415598686891290631687354680805) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((446069948 : Rat) / 125446055) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(0, 2), (6, 1), (11, 2)],
  term ((93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(0, 2), (6, 1), (15, 2)],
  term ((12548443744 : Rat) / 7401317245) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(0, 2), (7, 1), (8, 1), (11, 1)],
  term ((-2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(0, 2), (7, 1), (8, 1), (13, 1)],
  term ((50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term ((-105612228228 : Rat) / 7401317245) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-50022610913880912873789908872488 : Rat) / 1273790490336191187829975377157) [(0, 2), (7, 1), (11, 1)],
  term ((94201944175302093012264141172896 : Rat) / 1273790490336191187829975377157) [(0, 2), (7, 1), (13, 1)],
  term ((7776595159354467290190020182450443487224 : Rat) / 103601401347717117429703636119532782115) [(0, 2), (7, 1), (15, 1)],
  term ((34428466496 : Rat) / 7401317245) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-49990425186455551953219104950896 : Rat) / 1273790490336191187829975377157) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((-150682264586282330969773882198158255234528 : Rat) / 269363643504064505317229453910785233499) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-7145891948 : Rat) / 1480263449) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(0, 2), (8, 1), (11, 2)],
  term ((394368643006219881228752177946287095351728 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((490541904 : Rat) / 7401317245) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1083101547076499288901917043648 : Rat) / 115799135485108289802725034287) [(0, 2), (8, 1), (13, 2)],
  term ((-932351934971811838457149374027188133685008 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (8, 1), (15, 2)],
  term ((44849223836 : Rat) / 7401317245) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-17946956829521454582935602761120 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (11, 1)],
  term ((-575142771669409104941412655344 : Rat) / 115799135485108289802725034287) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((1083101547076499288901917043648 : Rat) / 115799135485108289802725034287) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((-15852935068759934758332573304357250458128 : Rat) / 122438019774574775144195206323084197045) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-490541904 : Rat) / 7401317245) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((33797480668926795708640842983040 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (13, 1)],
  term ((146671711757322441054093804489908326819560 : Rat) / 269363643504064505317229453910785233499) [(0, 2), (9, 1), (15, 1)],
  term ((6087141682 : Rat) / 1480263449) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((77234071176245259251125708692338062663392 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((23181015996 : Rat) / 7401317245) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1478631971385053139776972577552 : Rat) / 115799135485108289802725034287) [(0, 2), (11, 1), (13, 1)],
  term ((-125781151866158874115483347887807384991456 : Rat) / 269363643504064505317229453910785233499) [(0, 2), (11, 1), (15, 1)],
  term ((-7145891948 : Rat) / 1480263449) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((2881904983010106662916536021352 : Rat) / 115799135485108289802725034287) [(0, 2), (11, 2)],
  term ((-33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 2), (12, 1)],
  term ((-20490360972580534061968358251968 : Rat) / 1273790490336191187829975377157) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-581373527092511540690727434301431354053056 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (12, 1), (15, 2)],
  term ((-3380891244 : Rat) / 1057331035) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((667840725615533836659084905203791892925748 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (13, 1), (15, 1)],
  term ((-13308140771 : Rat) / 7401317245) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7435830498643859124695935316544 : Rat) / 115799135485108289802725034287) [(0, 2), (13, 2)],
  term ((-725153873267170989937388239344316957145328 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (15, 2)],
  term ((7783626386 : Rat) / 7401317245) [(0, 2), (15, 2), (16, 1)],
  term ((726139826040505736777485596040620139392 : Rat) / 22827427415598686891290631687354680805) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((-154602244 : Rat) / 125446055) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((3104557774203275675208324059070809000016 : Rat) / 22827427415598686891290631687354680805) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((446069948 : Rat) / 125446055) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (11, 2)],
  term ((93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(1, 2), (6, 1), (15, 2)],
  term ((12548443744 : Rat) / 7401317245) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(1, 2), (7, 1), (8, 1), (11, 1)],
  term ((-2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(1, 2), (7, 1), (8, 1), (13, 1)],
  term ((50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(1, 2), (7, 1), (8, 1), (15, 1)],
  term ((-105612228228 : Rat) / 7401317245) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-50022610913880912873789908872488 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (11, 1)],
  term ((94201944175302093012264141172896 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (13, 1)],
  term ((7776595159354467290190020182450443487224 : Rat) / 103601401347717117429703636119532782115) [(1, 2), (7, 1), (15, 1)],
  term ((34428466496 : Rat) / 7401317245) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-49990425186455551953219104950896 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((-150682264586282330969773882198158255234528 : Rat) / 269363643504064505317229453910785233499) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-7145891948 : Rat) / 1480263449) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (11, 2)],
  term ((394368643006219881228752177946287095351728 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((490541904 : Rat) / 7401317245) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1083101547076499288901917043648 : Rat) / 115799135485108289802725034287) [(1, 2), (8, 1), (13, 2)],
  term ((-932351934971811838457149374027188133685008 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (8, 1), (15, 2)],
  term ((44849223836 : Rat) / 7401317245) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-17946956829521454582935602761120 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (11, 1)],
  term ((-575142771669409104941412655344 : Rat) / 115799135485108289802725034287) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((1083101547076499288901917043648 : Rat) / 115799135485108289802725034287) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((-15852935068759934758332573304357250458128 : Rat) / 122438019774574775144195206323084197045) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-490541904 : Rat) / 7401317245) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((33797480668926795708640842983040 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (13, 1)],
  term ((146671711757322441054093804489908326819560 : Rat) / 269363643504064505317229453910785233499) [(1, 2), (9, 1), (15, 1)],
  term ((6087141682 : Rat) / 1480263449) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((77234071176245259251125708692338062663392 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((23181015996 : Rat) / 7401317245) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1478631971385053139776972577552 : Rat) / 115799135485108289802725034287) [(1, 2), (11, 1), (13, 1)],
  term ((-125781151866158874115483347887807384991456 : Rat) / 269363643504064505317229453910785233499) [(1, 2), (11, 1), (15, 1)],
  term ((-7145891948 : Rat) / 1480263449) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((2881904983010106662916536021352 : Rat) / 115799135485108289802725034287) [(1, 2), (11, 2)],
  term ((-33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(1, 2), (11, 2), (12, 1)],
  term ((-20490360972580534061968358251968 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-581373527092511540690727434301431354053056 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (12, 1), (15, 2)],
  term ((-3380891244 : Rat) / 1057331035) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((667840725615533836659084905203791892925748 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (13, 1), (15, 1)],
  term ((-13308140771 : Rat) / 7401317245) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7435830498643859124695935316544 : Rat) / 115799135485108289802725034287) [(1, 2), (13, 2)],
  term ((-725153873267170989937388239344316957145328 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (15, 2)],
  term ((7783626386 : Rat) / 7401317245) [(1, 2), (15, 2), (16, 1)],
  term ((1452279652081011473554971192081240278784 : Rat) / 22827427415598686891290631687354680805) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-309204488 : Rat) / 125446055) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-726139826040505736777485596040620139392 : Rat) / 22827427415598686891290631687354680805) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((154602244 : Rat) / 125446055) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-726139826040505736777485596040620139392 : Rat) / 22827427415598686891290631687354680805) [(6, 1), (9, 1), (13, 2), (15, 1)],
  term ((154602244 : Rat) / 125446055) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((126161347082390730137441462017536 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((6209115548406551350416648118141618000032 : Rat) / 22827427415598686891290631687354680805) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((892139896 : Rat) / 125446055) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (12, 2), (13, 1)],
  term ((-3104557774203275675208324059070809000016 : Rat) / 22827427415598686891290631687354680805) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-446069948 : Rat) / 125446055) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3104557774203275675208324059070809000016 : Rat) / 22827427415598686891290631687354680805) [(6, 1), (11, 1), (13, 2), (15, 1)],
  term ((-446069948 : Rat) / 125446055) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 3)],
  term ((-66993521553328154838950219073408 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (12, 1)],
  term ((33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (12, 2)],
  term ((33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (13, 2)],
  term ((186995975799945789957973916650752 : Rat) / 268063527727966972480841957465) [(6, 1), (12, 1), (15, 2)],
  term ((25096887488 : Rat) / 7401317245) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(6, 1), (12, 2), (15, 2)],
  term ((-12548443744 : Rat) / 7401317245) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(6, 1), (13, 2), (15, 2)],
  term ((-12548443744 : Rat) / 7401317245) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((2646039613649392990272166435008 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1), (12, 2)],
  term ((-1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1), (13, 2)],
  term ((-4982988121107241377708512084736 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((101847982213360759083310271207317145820768 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-211224456456 : Rat) / 7401317245) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (12, 2), (13, 1)],
  term ((-50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (12, 2), (15, 1)],
  term ((105612228228 : Rat) / 7401317245) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (13, 2), (15, 1)],
  term ((105612228228 : Rat) / 7401317245) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (13, 3)],
  term ((-100045221827761825747579817744976 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1)],
  term ((50022610913880912873789908872488 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 2)],
  term ((50022610913880912873789908872488 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (13, 2)],
  term ((188403888350604186024528282345792 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1)],
  term ((15553190318708934580380040364900886974448 : Rat) / 103601401347717117429703636119532782115) [(7, 1), (12, 1), (15, 1)],
  term ((68856932992 : Rat) / 7401317245) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-94201944175302093012264141172896 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 2), (13, 1)],
  term ((-7776595159354467290190020182450443487224 : Rat) / 103601401347717117429703636119532782115) [(7, 1), (12, 2), (15, 1)],
  term ((-34428466496 : Rat) / 7401317245) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-7776595159354467290190020182450443487224 : Rat) / 103601401347717117429703636119532782115) [(7, 1), (13, 2), (15, 1)],
  term ((-34428466496 : Rat) / 7401317245) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-94201944175302093012264141172896 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 3)],
  term ((-99980850372911103906438209901792 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-301364529172564661939547764396316510469056 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-14291783896 : Rat) / 1480263449) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((49990425186455551953219104950896 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((150682264586282330969773882198158255234528 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((7145891948 : Rat) / 1480263449) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((150682264586282330969773882198158255234528 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((7145891948 : Rat) / 1480263449) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((49990425186455551953219104950896 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 3)],
  term ((59810297699116538329377365866080 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (12, 1)],
  term ((-29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (12, 2)],
  term ((-29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (13, 2)],
  term ((788737286012439762457504355892574190703456 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((981083808 : Rat) / 7401317245) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2166203094152998577803834087296 : Rat) / 115799135485108289802725034287) [(8, 1), (12, 1), (13, 2)],
  term ((-1864703869943623676914298748054376267370016 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 1), (15, 2)],
  term ((89698447672 : Rat) / 7401317245) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-394368643006219881228752177946287095351728 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 2), (13, 1), (15, 1)],
  term ((-490541904 : Rat) / 7401317245) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1083101547076499288901917043648 : Rat) / 115799135485108289802725034287) [(8, 1), (12, 2), (13, 2)],
  term ((932351934971811838457149374027188133685008 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 2), (15, 2)],
  term ((-44849223836 : Rat) / 7401317245) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((932351934971811838457149374027188133685008 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 2), (15, 2)],
  term ((-44849223836 : Rat) / 7401317245) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-394368643006219881228752177946287095351728 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 3), (15, 1)],
  term ((-490541904 : Rat) / 7401317245) [(8, 1), (13, 3), (15, 1), (16, 1)],
  term ((1083101547076499288901917043648 : Rat) / 115799135485108289802725034287) [(8, 1), (13, 4)],
  term ((-35893913659042909165871205522240 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1)],
  term ((575142771669409104941412655344 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((5293815852794454274224524343552 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 2)],
  term ((575142771669409104941412655344 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (12, 3)],
  term ((17946956829521454582935602761120 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (13, 2)],
  term ((67594961337853591417281685966080 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1)],
  term ((15852935068759934758332573304357250458128 : Rat) / 122438019774574775144195206323084197045) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((490541904 : Rat) / 7401317245) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1083101547076499288901917043648 : Rat) / 115799135485108289802725034287) [(9, 1), (12, 1), (13, 3)],
  term ((293343423514644882108187608979816653639120 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (12, 1), (15, 1)],
  term ((12174283364 : Rat) / 1480263449) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9969246633243811352798668022784 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 2), (13, 1)],
  term ((-1082123130299330769953785635145401144176616 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 2), (15, 1)],
  term ((-4488113174 : Rat) / 1057331035) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1083101547076499288901917043648 : Rat) / 115799135485108289802725034287) [(9, 1), (12, 3), (13, 1)],
  term ((15852935068759934758332573304357250458128 : Rat) / 122438019774574775144195206323084197045) [(9, 1), (12, 3), (15, 1)],
  term ((490541904 : Rat) / 7401317245) [(9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-146671711757322441054093804489908326819560 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (13, 2), (15, 1)],
  term ((-6087141682 : Rat) / 1480263449) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-33797480668926795708640842983040 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 3)],
  term ((-2957263942770106279553945155104 : Rat) / 115799135485108289802725034287) [(11, 1), (12, 1), (13, 1)],
  term ((-77234071176245259251125708692338062663392 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-23181015996 : Rat) / 7401317245) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 3)],
  term ((-251562303732317748230966695775614769982912 : Rat) / 269363643504064505317229453910785233499) [(11, 1), (12, 1), (15, 1)],
  term ((-14291783896 : Rat) / 1480263449) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((142426298767626314674988160370608 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 2), (13, 1)],
  term ((783373901683284889079668156823713050284064 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 2), (15, 1)],
  term ((82091491732 : Rat) / 7401317245) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 3), (13, 1)],
  term ((-77234071176245259251125708692338062663392 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 3), (15, 1)],
  term ((-23181015996 : Rat) / 7401317245) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((125781151866158874115483347887807384991456 : Rat) / 269363643504064505317229453910785233499) [(11, 1), (13, 2), (15, 1)],
  term ((7145891948 : Rat) / 1480263449) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1478631971385053139776972577552 : Rat) / 115799135485108289802725034287) [(11, 1), (13, 3)],
  term ((5763809966020213325833072042704 : Rat) / 115799135485108289802725034287) [(11, 2), (12, 1)],
  term ((33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1), (13, 2)],
  term ((-98694476366439328131032115308280 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 2)],
  term ((33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 3)],
  term ((-2881904983010106662916536021352 : Rat) / 115799135485108289802725034287) [(11, 2), (13, 2)],
  term ((1335681451231067673318169810407583785851496 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (15, 1)],
  term ((-26616281542 : Rat) / 7401317245) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14871660997287718249391870633088 : Rat) / 115799135485108289802725034287) [(12, 1), (13, 2)],
  term ((581373527092511540690727434301431354053056 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 2), (15, 2)],
  term ((3380891244 : Rat) / 1057331035) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((20490360972580534061968358251968 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 3), (15, 1)],
  term ((-1450307746534341979874776478688633914290656 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (15, 2)],
  term ((15567252772 : Rat) / 7401317245) [(12, 1), (15, 2), (16, 1)],
  term ((-711170914764858202060272421939400125379508 : Rat) / 1346818217520322526586147269553926167495) [(12, 2), (13, 1), (15, 1)],
  term ((13308140771 : Rat) / 7401317245) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((7435830498643859124695935316544 : Rat) / 115799135485108289802725034287) [(12, 2), (13, 2)],
  term ((-437593180917852091444066629258545750960784 : Rat) / 1346818217520322526586147269553926167495) [(12, 2), (15, 2)],
  term ((-55116103802 : Rat) / 7401317245) [(12, 2), (15, 2), (16, 1)],
  term ((20490360972580534061968358251968 : Rat) / 1273790490336191187829975377157) [(12, 3), (13, 1), (15, 1)],
  term ((581373527092511540690727434301431354053056 : Rat) / 1346818217520322526586147269553926167495) [(12, 3), (15, 2)],
  term ((3380891244 : Rat) / 1057331035) [(12, 3), (15, 2), (16, 1)],
  term ((725153873267170989937388239344316957145328 : Rat) / 1346818217520322526586147269553926167495) [(13, 2), (15, 2)],
  term ((-7783626386 : Rat) / 7401317245) [(13, 2), (15, 2), (16, 1)],
  term ((-667840725615533836659084905203791892925748 : Rat) / 1346818217520322526586147269553926167495) [(13, 3), (15, 1)],
  term ((13308140771 : Rat) / 7401317245) [(13, 3), (15, 1), (16, 1)],
  term ((7435830498643859124695935316544 : Rat) / 115799135485108289802725034287) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 100 through 148. -/
theorem ep_Q2_002_block_07_0100_0148_valid :
    checkProductSumEq ep_Q2_002_partials_07_0100_0148
      ep_Q2_002_block_07_0100_0148 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
