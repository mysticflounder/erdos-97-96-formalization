/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 21:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_21_0100_0199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0100 : Poly :=
[
  term ((10876579288942112060614201675584 : Rat) / 97983883872014706756151952089) [(0, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 100 for generator 21. -/
def ep_Q2_002_partial_21_0100 : Poly :=
[
  term ((21753158577884224121228403351168 : Rat) / 97983883872014706756151952089) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-10876579288942112060614201675584 : Rat) / 97983883872014706756151952089) [(0, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 21. -/
theorem ep_Q2_002_partial_21_0100_valid :
    mulPoly ep_Q2_002_coefficient_21_0100
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0101 : Poly :=
[
  term ((1191695864314642796032005299005311538911336 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 101 for generator 21. -/
def ep_Q2_002_partial_21_0101 : Poly :=
[
  term ((2383391728629285592064010598010623077822672 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1191695864314642796032005299005311538911336 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 21. -/
theorem ep_Q2_002_partial_21_0101_valid :
    mulPoly ep_Q2_002_coefficient_21_0101
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0102 : Poly :=
[
  term ((82374253558 : Rat) / 7401317245) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 21. -/
def ep_Q2_002_partial_21_0102 : Poly :=
[
  term ((164748507116 : Rat) / 7401317245) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-82374253558 : Rat) / 7401317245) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 21. -/
theorem ep_Q2_002_partial_21_0102_valid :
    mulPoly ep_Q2_002_coefficient_21_0102
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0103 : Poly :=
[
  term ((11867691863422455787953000776736 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 103 for generator 21. -/
def ep_Q2_002_partial_21_0103 : Poly :=
[
  term ((23735383726844911575906001553472 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((-11867691863422455787953000776736 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 21. -/
theorem ep_Q2_002_partial_21_0103_valid :
    mulPoly ep_Q2_002_coefficient_21_0103
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0104 : Poly :=
[
  term ((223458924574059573643502792147828071885704 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 104 for generator 21. -/
def ep_Q2_002_partial_21_0104 : Poly :=
[
  term ((446917849148119147287005584295656143771408 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((-223458924574059573643502792147828071885704 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 21. -/
theorem ep_Q2_002_partial_21_0104_valid :
    mulPoly ep_Q2_002_coefficient_21_0104
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0105 : Poly :=
[
  term ((9010369992 : Rat) / 7401317245) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 21. -/
def ep_Q2_002_partial_21_0105 : Poly :=
[
  term ((18020739984 : Rat) / 7401317245) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9010369992 : Rat) / 7401317245) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 21. -/
theorem ep_Q2_002_partial_21_0105_valid :
    mulPoly ep_Q2_002_coefficient_21_0105
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0106 : Poly :=
[
  term ((-1069891365385373922720 : Rat) / 253528477699481291099) [(0, 1), (7, 2)]
]

/-- Partial product 106 for generator 21. -/
def ep_Q2_002_partial_21_0106 : Poly :=
[
  term ((1069891365385373922720 : Rat) / 253528477699481291099) [(0, 1), (7, 2)],
  term ((-2139782730770747845440 : Rat) / 253528477699481291099) [(0, 1), (7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 21. -/
theorem ep_Q2_002_partial_21_0106_valid :
    mulPoly ep_Q2_002_coefficient_21_0106
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0107 : Poly :=
[
  term ((1226220236850208348483097070960 : Rat) / 115799135485108289802725034287) [(0, 1), (8, 1), (9, 1), (11, 1)]
]

/-- Partial product 107 for generator 21. -/
def ep_Q2_002_partial_21_0107 : Poly :=
[
  term ((2452440473700416696966194141920 : Rat) / 115799135485108289802725034287) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-1226220236850208348483097070960 : Rat) / 115799135485108289802725034287) [(0, 1), (8, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 21. -/
theorem ep_Q2_002_partial_21_0107_valid :
    mulPoly ep_Q2_002_coefficient_21_0107
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0108 : Poly :=
[
  term ((-2309202342461800623891648208320 : Rat) / 115799135485108289802725034287) [(0, 1), (8, 1), (9, 1), (13, 1)]
]

/-- Partial product 108 for generator 21. -/
def ep_Q2_002_partial_21_0108 : Poly :=
[
  term ((-4618404684923601247783296416640 : Rat) / 115799135485108289802725034287) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((2309202342461800623891648208320 : Rat) / 115799135485108289802725034287) [(0, 1), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 21. -/
theorem ep_Q2_002_partial_21_0108_valid :
    mulPoly ep_Q2_002_coefficient_21_0108
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0109 : Poly :=
[
  term ((-88077041215055602719325856128508759392392 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 109 for generator 21. -/
def ep_Q2_002_partial_21_0109 : Poly :=
[
  term ((-176154082430111205438651712257017518784784 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((88077041215055602719325856128508759392392 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 21. -/
theorem ep_Q2_002_partial_21_0109_valid :
    mulPoly ep_Q2_002_coefficient_21_0109
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0110 : Poly :=
[
  term ((-35365643506 : Rat) / 7401317245) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 21. -/
def ep_Q2_002_partial_21_0110 : Poly :=
[
  term ((-70731287012 : Rat) / 7401317245) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((35365643506 : Rat) / 7401317245) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 21. -/
theorem ep_Q2_002_partial_21_0110_valid :
    mulPoly ep_Q2_002_coefficient_21_0110
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0111 : Poly :=
[
  term ((184158052855433886480099047924256 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 111 for generator 21. -/
def ep_Q2_002_partial_21_0111 : Poly :=
[
  term ((368316105710867772960198095848512 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-184158052855433886480099047924256 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 21. -/
theorem ep_Q2_002_partial_21_0111_valid :
    mulPoly ep_Q2_002_coefficient_21_0111
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0112 : Poly :=
[
  term ((57571518990372291022497163251395465637576 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 112 for generator 21. -/
def ep_Q2_002_partial_21_0112 : Poly :=
[
  term ((115143037980744582044994326502790931275152 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-57571518990372291022497163251395465637576 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 21. -/
theorem ep_Q2_002_partial_21_0112_valid :
    mulPoly ep_Q2_002_coefficient_21_0112
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0113 : Poly :=
[
  term ((41805008824 : Rat) / 7401317245) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 21. -/
def ep_Q2_002_partial_21_0113 : Poly :=
[
  term ((83610017648 : Rat) / 7401317245) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41805008824 : Rat) / 7401317245) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 21. -/
theorem ep_Q2_002_partial_21_0113_valid :
    mulPoly ep_Q2_002_coefficient_21_0113
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0114 : Poly :=
[
  term ((-30983962068450231303346308567828 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (11, 2)]
]

/-- Partial product 114 for generator 21. -/
def ep_Q2_002_partial_21_0114 : Poly :=
[
  term ((-61967924136900462606692617135656 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (10, 1), (11, 2)],
  term ((30983962068450231303346308567828 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 21. -/
theorem ep_Q2_002_partial_21_0114_valid :
    mulPoly ep_Q2_002_coefficient_21_0114
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0115 : Poly :=
[
  term ((-2328057058464704246330278694708812723027104 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 115 for generator 21. -/
def ep_Q2_002_partial_21_0115 : Poly :=
[
  term ((-4656114116929408492660557389417625446054208 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((2328057058464704246330278694708812723027104 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 21. -/
theorem ep_Q2_002_partial_21_0115_valid :
    mulPoly ep_Q2_002_coefficient_21_0115
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0116 : Poly :=
[
  term ((-148296700512 : Rat) / 7401317245) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 21. -/
def ep_Q2_002_partial_21_0116 : Poly :=
[
  term ((-296593401024 : Rat) / 7401317245) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((148296700512 : Rat) / 7401317245) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 21. -/
theorem ep_Q2_002_partial_21_0116_valid :
    mulPoly ep_Q2_002_coefficient_21_0116
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0117 : Poly :=
[
  term ((-236922754645216939625237110167360 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (13, 2)]
]

/-- Partial product 117 for generator 21. -/
def ep_Q2_002_partial_21_0117 : Poly :=
[
  term ((-473845509290433879250474220334720 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (10, 1), (13, 2)],
  term ((236922754645216939625237110167360 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 21. -/
theorem ep_Q2_002_partial_21_0117_valid :
    mulPoly ep_Q2_002_coefficient_21_0117
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0118 : Poly :=
[
  term ((781190051557075007202419673669592000230468 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (15, 2)]
]

/-- Partial product 118 for generator 21. -/
def ep_Q2_002_partial_21_0118 : Poly :=
[
  term ((1562380103114150014404839347339184000460936 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((-781190051557075007202419673669592000230468 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 21. -/
theorem ep_Q2_002_partial_21_0118_valid :
    mulPoly ep_Q2_002_coefficient_21_0118
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0119 : Poly :=
[
  term ((41805008824 : Rat) / 7401317245) [(0, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 119 for generator 21. -/
def ep_Q2_002_partial_21_0119 : Poly :=
[
  term ((83610017648 : Rat) / 7401317245) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-41805008824 : Rat) / 7401317245) [(0, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 21. -/
theorem ep_Q2_002_partial_21_0119_valid :
    mulPoly ep_Q2_002_coefficient_21_0119
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0120 : Poly :=
[
  term ((-95776190582291910924615357584616 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 120 for generator 21. -/
def ep_Q2_002_partial_21_0120 : Poly :=
[
  term ((-191552381164583821849230715169232 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((95776190582291910924615357584616 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 21. -/
theorem ep_Q2_002_partial_21_0120_valid :
    mulPoly ep_Q2_002_coefficient_21_0120
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0121 : Poly :=
[
  term ((-77329948326598055499362235204984 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 121 for generator 21. -/
def ep_Q2_002_partial_21_0121 : Poly :=
[
  term ((-154659896653196110998724470409968 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((77329948326598055499362235204984 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 21. -/
theorem ep_Q2_002_partial_21_0121_valid :
    mulPoly ep_Q2_002_coefficient_21_0121
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0122 : Poly :=
[
  term ((145626774417721426073328713730528 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 122 for generator 21. -/
def ep_Q2_002_partial_21_0122 : Poly :=
[
  term ((291253548835442852146657427461056 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-145626774417721426073328713730528 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 21. -/
theorem ep_Q2_002_partial_21_0122_valid :
    mulPoly ep_Q2_002_coefficient_21_0122
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0123 : Poly :=
[
  term ((359243639502818425159559638400374373576928 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 123 for generator 21. -/
def ep_Q2_002_partial_21_0123 : Poly :=
[
  term ((718487279005636850319119276800748747153856 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-359243639502818425159559638400374373576928 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 21. -/
theorem ep_Q2_002_partial_21_0123_valid :
    mulPoly ep_Q2_002_coefficient_21_0123
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0124 : Poly :=
[
  term ((20010465274 : Rat) / 1480263449) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 21. -/
def ep_Q2_002_partial_21_0124 : Poly :=
[
  term ((40020930548 : Rat) / 1480263449) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20010465274 : Rat) / 1480263449) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 21. -/
theorem ep_Q2_002_partial_21_0124_valid :
    mulPoly ep_Q2_002_coefficient_21_0124
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0125 : Poly :=
[
  term ((180364503046212102097253639712672 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 125 for generator 21. -/
def ep_Q2_002_partial_21_0125 : Poly :=
[
  term ((360729006092424204194507279425344 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((-180364503046212102097253639712672 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 21. -/
theorem ep_Q2_002_partial_21_0125_valid :
    mulPoly ep_Q2_002_coefficient_21_0125
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0126 : Poly :=
[
  term ((-918314234122244474019984398431250859519336 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 126 for generator 21. -/
def ep_Q2_002_partial_21_0126 : Poly :=
[
  term ((-1836628468244488948039968796862501719038672 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((918314234122244474019984398431250859519336 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 21. -/
theorem ep_Q2_002_partial_21_0126_valid :
    mulPoly ep_Q2_002_coefficient_21_0126
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0127 : Poly :=
[
  term ((37533553252 : Rat) / 7401317245) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 21. -/
def ep_Q2_002_partial_21_0127 : Poly :=
[
  term ((75067106504 : Rat) / 7401317245) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-37533553252 : Rat) / 7401317245) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 21. -/
theorem ep_Q2_002_partial_21_0127_valid :
    mulPoly ep_Q2_002_coefficient_21_0127
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0128 : Poly :=
[
  term ((72582489282046027510003271321016 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 128 for generator 21. -/
def ep_Q2_002_partial_21_0128 : Poly :=
[
  term ((-72582489282046027510003271321016 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((145164978564092055020006542642032 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 21. -/
theorem ep_Q2_002_partial_21_0128_valid :
    mulPoly ep_Q2_002_coefficient_21_0128
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0129 : Poly :=
[
  term ((1300799879193468184634986586965595111458212 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 129 for generator 21. -/
def ep_Q2_002_partial_21_0129 : Poly :=
[
  term ((-1300799879193468184634986586965595111458212 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((2601599758386936369269973173931190222916424 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 21. -/
theorem ep_Q2_002_partial_21_0129_valid :
    mulPoly ep_Q2_002_coefficient_21_0129
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0130 : Poly :=
[
  term ((-11063501329 : Rat) / 7401317245) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 21. -/
def ep_Q2_002_partial_21_0130 : Poly :=
[
  term ((11063501329 : Rat) / 7401317245) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22127002658 : Rat) / 7401317245) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 21. -/
theorem ep_Q2_002_partial_21_0130_valid :
    mulPoly ep_Q2_002_coefficient_21_0130
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0131 : Poly :=
[
  term ((-136686419971621874887908844661472 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (13, 2)]
]

/-- Partial product 131 for generator 21. -/
def ep_Q2_002_partial_21_0131 : Poly :=
[
  term ((136686419971621874887908844661472 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (13, 2)],
  term ((-273372839943243749775817689322944 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 21. -/
theorem ep_Q2_002_partial_21_0131_valid :
    mulPoly ep_Q2_002_coefficient_21_0131
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0132 : Poly :=
[
  term ((-41137480386799181308256183831232 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 132 for generator 21. -/
def ep_Q2_002_partial_21_0132 : Poly :=
[
  term ((-82274960773598362616512367662464 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((41137480386799181308256183831232 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 21. -/
theorem ep_Q2_002_partial_21_0132_valid :
    mulPoly ep_Q2_002_coefficient_21_0132
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0133 : Poly :=
[
  term ((-1171977525163723785672041573438017566187884 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 133 for generator 21. -/
def ep_Q2_002_partial_21_0133 : Poly :=
[
  term ((-2343955050327447571344083146876035132375768 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((1171977525163723785672041573438017566187884 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 21. -/
theorem ep_Q2_002_partial_21_0133_valid :
    mulPoly ep_Q2_002_coefficient_21_0133
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0134 : Poly :=
[
  term ((-20232544817 : Rat) / 7401317245) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 21. -/
def ep_Q2_002_partial_21_0134 : Poly :=
[
  term ((-40465089634 : Rat) / 7401317245) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((20232544817 : Rat) / 7401317245) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 21. -/
theorem ep_Q2_002_partial_21_0134_valid :
    mulPoly ep_Q2_002_coefficient_21_0134
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0135 : Poly :=
[
  term ((-151171858842198144967901540518380 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 135 for generator 21. -/
def ep_Q2_002_partial_21_0135 : Poly :=
[
  term ((-302343717684396289935803081036760 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((151171858842198144967901540518380 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 21. -/
theorem ep_Q2_002_partial_21_0135_valid :
    mulPoly ep_Q2_002_coefficient_21_0135
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0136 : Poly :=
[
  term ((78172353181462164369248979645951269597466 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 136 for generator 21. -/
def ep_Q2_002_partial_21_0136 : Poly :=
[
  term ((156344706362924328738497959291902539194932 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-78172353181462164369248979645951269597466 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 21. -/
theorem ep_Q2_002_partial_21_0136_valid :
    mulPoly ep_Q2_002_coefficient_21_0136
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0137 : Poly :=
[
  term ((-114070604819 : Rat) / 14802634490) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 21. -/
def ep_Q2_002_partial_21_0137 : Poly :=
[
  term ((-114070604819 : Rat) / 7401317245) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((114070604819 : Rat) / 14802634490) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 21. -/
theorem ep_Q2_002_partial_21_0137_valid :
    mulPoly ep_Q2_002_coefficient_21_0137
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0138 : Poly :=
[
  term ((89110093170619461794145469410744 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2)]
]

/-- Partial product 138 for generator 21. -/
def ep_Q2_002_partial_21_0138 : Poly :=
[
  term ((178220186341238923588290938821488 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (11, 2)],
  term ((-89110093170619461794145469410744 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 21. -/
theorem ep_Q2_002_partial_21_0138_valid :
    mulPoly ep_Q2_002_coefficient_21_0138
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0139 : Poly :=
[
  term ((-18308615303396716363250512407864 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2), (12, 1)]
]

/-- Partial product 139 for generator 21. -/
def ep_Q2_002_partial_21_0139 : Poly :=
[
  term ((-36617230606793432726501024815728 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((18308615303396716363250512407864 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 21. -/
theorem ep_Q2_002_partial_21_0139_valid :
    mulPoly ep_Q2_002_coefficient_21_0139
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0140 : Poly :=
[
  term ((-945328508900309220060542100599421146975184 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 140 for generator 21. -/
def ep_Q2_002_partial_21_0140 : Poly :=
[
  term ((-1890657017800618440121084201198842293950368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((945328508900309220060542100599421146975184 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 21. -/
theorem ep_Q2_002_partial_21_0140_valid :
    mulPoly ep_Q2_002_coefficient_21_0140
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0141 : Poly :=
[
  term ((21924681348 : Rat) / 7401317245) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 141 for generator 21. -/
def ep_Q2_002_partial_21_0141 : Poly :=
[
  term ((43849362696 : Rat) / 7401317245) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21924681348 : Rat) / 7401317245) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 21. -/
theorem ep_Q2_002_partial_21_0141_valid :
    mulPoly ep_Q2_002_coefficient_21_0141
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0142 : Poly :=
[
  term ((142399148423630570202429974298240 : Rat) / 1273790490336191187829975377157) [(0, 1), (12, 1), (13, 2)]
]

/-- Partial product 142 for generator 21. -/
def ep_Q2_002_partial_21_0142 : Poly :=
[
  term ((284798296847261140404859948596480 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (12, 1), (13, 2)],
  term ((-142399148423630570202429974298240 : Rat) / 1273790490336191187829975377157) [(0, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 21. -/
theorem ep_Q2_002_partial_21_0142_valid :
    mulPoly ep_Q2_002_coefficient_21_0142
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0143 : Poly :=
[
  term ((-1058442783410683667962740071407918000626468 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 1), (15, 2)]
]

/-- Partial product 143 for generator 21. -/
def ep_Q2_002_partial_21_0143 : Poly :=
[
  term ((-2116885566821367335925480142815836001252936 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((1058442783410683667962740071407918000626468 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 21. -/
theorem ep_Q2_002_partial_21_0143_valid :
    mulPoly ep_Q2_002_coefficient_21_0143
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0144 : Poly :=
[
  term ((-3177893687 : Rat) / 1057331035) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 144 for generator 21. -/
def ep_Q2_002_partial_21_0144 : Poly :=
[
  term ((-6355787374 : Rat) / 1057331035) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((3177893687 : Rat) / 1057331035) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 21. -/
theorem ep_Q2_002_partial_21_0144_valid :
    mulPoly ep_Q2_002_coefficient_21_0144
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0145 : Poly :=
[
  term ((6632818107818607855425045540013048760158 : Rat) / 9418309213428828857245785101775707465) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 145 for generator 21. -/
def ep_Q2_002_partial_21_0145 : Poly :=
[
  term ((13265636215637215710850091080026097520316 : Rat) / 9418309213428828857245785101775707465) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((-6632818107818607855425045540013048760158 : Rat) / 9418309213428828857245785101775707465) [(0, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 21. -/
theorem ep_Q2_002_partial_21_0145_valid :
    mulPoly ep_Q2_002_coefficient_21_0145
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0146 : Poly :=
[
  term ((7480225699 : Rat) / 14802634490) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 146 for generator 21. -/
def ep_Q2_002_partial_21_0146 : Poly :=
[
  term ((7480225699 : Rat) / 7401317245) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7480225699 : Rat) / 14802634490) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 21. -/
theorem ep_Q2_002_partial_21_0146_valid :
    mulPoly ep_Q2_002_coefficient_21_0146
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0147 : Poly :=
[
  term ((-85733057285375846549368009343184 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2)]
]

/-- Partial product 147 for generator 21. -/
def ep_Q2_002_partial_21_0147 : Poly :=
[
  term ((-171466114570751693098736018686368 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (13, 2)],
  term ((85733057285375846549368009343184 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 21. -/
theorem ep_Q2_002_partial_21_0147_valid :
    mulPoly ep_Q2_002_coefficient_21_0147
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0148 : Poly :=
[
  term ((-4456500631316371938802642752298913121174 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (15, 2)]
]

/-- Partial product 148 for generator 21. -/
def ep_Q2_002_partial_21_0148 : Poly :=
[
  term ((-8913001262632743877605285504597826242348 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 1), (15, 2)],
  term ((4456500631316371938802642752298913121174 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 21. -/
theorem ep_Q2_002_partial_21_0148_valid :
    mulPoly ep_Q2_002_coefficient_21_0148
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0149 : Poly :=
[
  term ((-75009813239 : Rat) / 14802634490) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 149 for generator 21. -/
def ep_Q2_002_partial_21_0149 : Poly :=
[
  term ((-75009813239 : Rat) / 7401317245) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((75009813239 : Rat) / 14802634490) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 21. -/
theorem ep_Q2_002_partial_21_0149_valid :
    mulPoly ep_Q2_002_coefficient_21_0149
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0150 : Poly :=
[
  term ((6028482677517970479574292759424 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (9, 1)]
]

/-- Partial product 150 for generator 21. -/
def ep_Q2_002_partial_21_0150 : Poly :=
[
  term ((-6028482677517970479574292759424 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (9, 1)],
  term ((12056965355035940959148585518848 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 21. -/
theorem ep_Q2_002_partial_21_0150_valid :
    mulPoly ep_Q2_002_coefficient_21_0150
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0151 : Poly :=
[
  term ((2794367418875165877431952490080 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (11, 1)]
]

/-- Partial product 151 for generator 21. -/
def ep_Q2_002_partial_21_0151 : Poly :=
[
  term ((5588734837750331754863904980160 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (10, 1), (11, 1)],
  term ((-2794367418875165877431952490080 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 21. -/
theorem ep_Q2_002_partial_21_0151_valid :
    mulPoly ep_Q2_002_coefficient_21_0151
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0152 : Poly :=
[
  term ((-1056110683206209294039836158144 : Rat) / 115799135485108289802725034287) [(0, 2), (1, 1), (13, 1)]
]

/-- Partial product 152 for generator 21. -/
def ep_Q2_002_partial_21_0152 : Poly :=
[
  term ((-2112221366412418588079672316288 : Rat) / 115799135485108289802725034287) [(0, 2), (1, 1), (10, 1), (13, 1)],
  term ((1056110683206209294039836158144 : Rat) / 115799135485108289802725034287) [(0, 2), (1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 21. -/
theorem ep_Q2_002_partial_21_0152_valid :
    mulPoly ep_Q2_002_coefficient_21_0152
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0153 : Poly :=
[
  term ((2794367418875165877431952490080 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (15, 1)]
]

/-- Partial product 153 for generator 21. -/
def ep_Q2_002_partial_21_0153 : Poly :=
[
  term ((5588734837750331754863904980160 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((-2794367418875165877431952490080 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 21. -/
theorem ep_Q2_002_partial_21_0153_valid :
    mulPoly ep_Q2_002_coefficient_21_0153
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0154 : Poly :=
[
  term ((-85231808465447375648246435218848 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (11, 1)]
]

/-- Partial product 154 for generator 21. -/
def ep_Q2_002_partial_21_0154 : Poly :=
[
  term ((-170463616930894751296492870437696 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((85231808465447375648246435218848 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 21. -/
theorem ep_Q2_002_partial_21_0154_valid :
    mulPoly ep_Q2_002_coefficient_21_0154
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0155 : Poly :=
[
  term ((160507456854758534940484610918016 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (13, 1)]
]

/-- Partial product 155 for generator 21. -/
def ep_Q2_002_partial_21_0155 : Poly :=
[
  term ((321014913709517069880969221836032 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((-160507456854758534940484610918016 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 21. -/
theorem ep_Q2_002_partial_21_0155_valid :
    mulPoly ep_Q2_002_coefficient_21_0155
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0156 : Poly :=
[
  term ((1435230499300277704977200348182644950316768 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (9, 1), (15, 1)]
]

/-- Partial product 156 for generator 21. -/
def ep_Q2_002_partial_21_0156 : Poly :=
[
  term ((2870460998600555409954400696365289900633536 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-1435230499300277704977200348182644950316768 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 21. -/
theorem ep_Q2_002_partial_21_0156_valid :
    mulPoly ep_Q2_002_coefficient_21_0156
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0157 : Poly :=
[
  term ((92924848704 : Rat) / 7401317245) [(0, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 157 for generator 21. -/
def ep_Q2_002_partial_21_0157 : Poly :=
[
  term ((185849697408 : Rat) / 7401317245) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-92924848704 : Rat) / 7401317245) [(0, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 21. -/
theorem ep_Q2_002_partial_21_0157_valid :
    mulPoly ep_Q2_002_coefficient_21_0157
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0158 : Poly :=
[
  term ((238645998179522592469136269383888 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 1), (13, 1)]
]

/-- Partial product 158 for generator 21. -/
def ep_Q2_002_partial_21_0158 : Poly :=
[
  term ((477291996359045184938272538767776 : Rat) / 1273790490336191187829975377157) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-238645998179522592469136269383888 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 21. -/
theorem ep_Q2_002_partial_21_0158_valid :
    mulPoly ep_Q2_002_coefficient_21_0158
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0159 : Poly :=
[
  term ((-1247146320385495398621607864486028865927684 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (11, 1), (15, 1)]
]

/-- Partial product 159 for generator 21. -/
def ep_Q2_002_partial_21_0159 : Poly :=
[
  term ((-2494292640770990797243215728972057731855368 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((1247146320385495398621607864486028865927684 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 21. -/
theorem ep_Q2_002_partial_21_0159_valid :
    mulPoly ep_Q2_002_coefficient_21_0159
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0160 : Poly :=
[
  term ((-5296248637 : Rat) / 7401317245) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 21. -/
def ep_Q2_002_partial_21_0160 : Poly :=
[
  term ((-10592497274 : Rat) / 7401317245) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((5296248637 : Rat) / 7401317245) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 21. -/
theorem ep_Q2_002_partial_21_0160_valid :
    mulPoly ep_Q2_002_coefficient_21_0160
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0161 : Poly :=
[
  term ((-39507285890670079124849207105160 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 2)]
]

/-- Partial product 161 for generator 21. -/
def ep_Q2_002_partial_21_0161 : Poly :=
[
  term ((-79014571781340158249698414210320 : Rat) / 1273790490336191187829975377157) [(0, 2), (10, 1), (11, 2)],
  term ((39507285890670079124849207105160 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 21. -/
theorem ep_Q2_002_partial_21_0161_valid :
    mulPoly ep_Q2_002_coefficient_21_0161
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0162 : Poly :=
[
  term ((16218193962176772752564021743052310446040 : Rat) / 20720280269543423485940727223906556423) [(0, 2), (13, 1), (15, 1)]
]

/-- Partial product 162 for generator 21. -/
def ep_Q2_002_partial_21_0162 : Poly :=
[
  term ((32436387924353545505128043486104620892080 : Rat) / 20720280269543423485940727223906556423) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((-16218193962176772752564021743052310446040 : Rat) / 20720280269543423485940727223906556423) [(0, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 21. -/
theorem ep_Q2_002_partial_21_0162_valid :
    mulPoly ep_Q2_002_coefficient_21_0162
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0163 : Poly :=
[
  term ((-2352352898 : Rat) / 211466207) [(0, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 21. -/
def ep_Q2_002_partial_21_0163 : Poly :=
[
  term ((-4704705796 : Rat) / 211466207) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2352352898 : Rat) / 211466207) [(0, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 21. -/
theorem ep_Q2_002_partial_21_0163_valid :
    mulPoly ep_Q2_002_coefficient_21_0163
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0164 : Poly :=
[
  term ((-28118790247293513825715222802496 : Rat) / 115799135485108289802725034287) [(0, 2), (13, 2)]
]

/-- Partial product 164 for generator 21. -/
def ep_Q2_002_partial_21_0164 : Poly :=
[
  term ((-56237580494587027651430445604992 : Rat) / 115799135485108289802725034287) [(0, 2), (10, 1), (13, 2)],
  term ((28118790247293513825715222802496 : Rat) / 115799135485108289802725034287) [(0, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 21. -/
theorem ep_Q2_002_partial_21_0164_valid :
    mulPoly ep_Q2_002_coefficient_21_0164
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0165 : Poly :=
[
  term ((-1205374040904672307016999158118600689287084 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (15, 2)]
]

/-- Partial product 165 for generator 21. -/
def ep_Q2_002_partial_21_0165 : Poly :=
[
  term ((-2410748081809344614033998316237201378574168 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (10, 1), (15, 2)],
  term ((1205374040904672307016999158118600689287084 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 21. -/
theorem ep_Q2_002_partial_21_0165_valid :
    mulPoly ep_Q2_002_coefficient_21_0165
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0166 : Poly :=
[
  term ((-5296248637 : Rat) / 7401317245) [(0, 2), (15, 2), (16, 1)]
]

/-- Partial product 166 for generator 21. -/
def ep_Q2_002_partial_21_0166 : Poly :=
[
  term ((-10592497274 : Rat) / 7401317245) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((5296248637 : Rat) / 7401317245) [(0, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 21. -/
theorem ep_Q2_002_partial_21_0166_valid :
    mulPoly ep_Q2_002_coefficient_21_0166
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0167 : Poly :=
[
  term ((2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (6, 1)]
]

/-- Partial product 167 for generator 21. -/
def ep_Q2_002_partial_21_0167 : Poly :=
[
  term ((-2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (6, 1)],
  term ((4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (6, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 21. -/
theorem ep_Q2_002_partial_21_0167_valid :
    mulPoly ep_Q2_002_coefficient_21_0167
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0168 : Poly :=
[
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (6, 1), (12, 1)]
]

/-- Partial product 168 for generator 21. -/
def ep_Q2_002_partial_21_0168 : Poly :=
[
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (6, 1), (10, 1), (12, 1)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (6, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 21. -/
theorem ep_Q2_002_partial_21_0168_valid :
    mulPoly ep_Q2_002_coefficient_21_0168
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0169 : Poly :=
[
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (6, 1), (7, 1)]
]

/-- Partial product 169 for generator 21. -/
def ep_Q2_002_partial_21_0169 : Poly :=
[
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (6, 1), (7, 1)],
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (6, 1), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 21. -/
theorem ep_Q2_002_partial_21_0169_valid :
    mulPoly ep_Q2_002_coefficient_21_0169
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0170 : Poly :=
[
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1)]
]

/-- Partial product 170 for generator 21. -/
def ep_Q2_002_partial_21_0170 : Poly :=
[
  term ((-4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (10, 1), (15, 1)],
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 21. -/
theorem ep_Q2_002_partial_21_0170_valid :
    mulPoly ep_Q2_002_coefficient_21_0170
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0171 : Poly :=
[
  term ((-222308460748264059718356855240 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (6, 1)]
]

/-- Partial product 171 for generator 21. -/
def ep_Q2_002_partial_21_0171 : Poly :=
[
  term ((222308460748264059718356855240 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (6, 1)],
  term ((-444616921496528119436713710480 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (6, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 21. -/
theorem ep_Q2_002_partial_21_0171_valid :
    mulPoly ep_Q2_002_coefficient_21_0171
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0172 : Poly :=
[
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (9, 1)]
]

/-- Partial product 172 for generator 21. -/
def ep_Q2_002_partial_21_0172 : Poly :=
[
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (9, 1)],
  term ((-16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 21. -/
theorem ep_Q2_002_partial_21_0172_valid :
    mulPoly ep_Q2_002_coefficient_21_0172
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0173 : Poly :=
[
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (11, 1)]
]

/-- Partial product 173 for generator 21. -/
def ep_Q2_002_partial_21_0173 : Poly :=
[
  term ((-195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 21. -/
theorem ep_Q2_002_partial_21_0173_valid :
    mulPoly ep_Q2_002_coefficient_21_0173
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0174 : Poly :=
[
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1)]
]

/-- Partial product 174 for generator 21. -/
def ep_Q2_002_partial_21_0174 : Poly :=
[
  term ((367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 21. -/
theorem ep_Q2_002_partial_21_0174_valid :
    mulPoly ep_Q2_002_coefficient_21_0174
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0175 : Poly :=
[
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1)]
]

/-- Partial product 175 for generator 21. -/
def ep_Q2_002_partial_21_0175 : Poly :=
[
  term ((1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((-561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 21. -/
theorem ep_Q2_002_partial_21_0175_valid :
    mulPoly ep_Q2_002_coefficient_21_0175
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0176 : Poly :=
[
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 176 for generator 21. -/
def ep_Q2_002_partial_21_0176 : Poly :=
[
  term ((152960326704 : Rat) / 7401317245) [(1, 1), (3, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 21. -/
theorem ep_Q2_002_partial_21_0176_valid :
    mulPoly ep_Q2_002_coefficient_21_0176
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0177 : Poly :=
[
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 2)]
]

/-- Partial product 177 for generator 21. -/
def ep_Q2_002_partial_21_0177 : Poly :=
[
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 2)],
  term ((-28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 21. -/
theorem ep_Q2_002_partial_21_0177_valid :
    mulPoly ep_Q2_002_coefficient_21_0177
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0178 : Poly :=
[
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (8, 1)]
]

/-- Partial product 178 for generator 21. -/
def ep_Q2_002_partial_21_0178 : Poly :=
[
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (8, 1)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 21. -/
theorem ep_Q2_002_partial_21_0178_valid :
    mulPoly ep_Q2_002_coefficient_21_0178
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0179 : Poly :=
[
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 179 for generator 21. -/
def ep_Q2_002_partial_21_0179 : Poly :=
[
  term ((5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 21. -/
theorem ep_Q2_002_partial_21_0179_valid :
    mulPoly ep_Q2_002_coefficient_21_0179
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0180 : Poly :=
[
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 180 for generator 21. -/
def ep_Q2_002_partial_21_0180 : Poly :=
[
  term ((65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 21. -/
theorem ep_Q2_002_partial_21_0180_valid :
    mulPoly ep_Q2_002_coefficient_21_0180
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0181 : Poly :=
[
  term ((626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (6, 1), (12, 1)]
]

/-- Partial product 181 for generator 21. -/
def ep_Q2_002_partial_21_0181 : Poly :=
[
  term ((1252951825237464718032818647488 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (6, 1), (10, 1), (12, 1)],
  term ((-626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (6, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 21. -/
theorem ep_Q2_002_partial_21_0181_valid :
    mulPoly ep_Q2_002_coefficient_21_0181
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0182 : Poly :=
[
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 182 for generator 21. -/
def ep_Q2_002_partial_21_0182 : Poly :=
[
  term ((-122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 21. -/
theorem ep_Q2_002_partial_21_0182_valid :
    mulPoly ep_Q2_002_coefficient_21_0182
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0183 : Poly :=
[
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (6, 1), (15, 2)]
]

/-- Partial product 183 for generator 21. -/
def ep_Q2_002_partial_21_0183 : Poly :=
[
  term ((-372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (6, 1), (10, 1), (15, 2)],
  term ((186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 21. -/
theorem ep_Q2_002_partial_21_0183_valid :
    mulPoly ep_Q2_002_coefficient_21_0183
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0184 : Poly :=
[
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 184 for generator 21. -/
def ep_Q2_002_partial_21_0184 : Poly :=
[
  term ((-50986775568 : Rat) / 7401317245) [(1, 1), (3, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 21. -/
theorem ep_Q2_002_partial_21_0184_valid :
    mulPoly ep_Q2_002_coefficient_21_0184
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0185 : Poly :=
[
  term ((3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (9, 1)]
]

/-- Partial product 185 for generator 21. -/
def ep_Q2_002_partial_21_0185 : Poly :=
[
  term ((-3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (9, 1)],
  term ((6009014872703505400747753501440 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 21. -/
theorem ep_Q2_002_partial_21_0185_valid :
    mulPoly ep_Q2_002_coefficient_21_0185
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0186 : Poly :=
[
  term ((2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1)]
]

/-- Partial product 186 for generator 21. -/
def ep_Q2_002_partial_21_0186 : Poly :=
[
  term ((4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (10, 1), (11, 1)],
  term ((-2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 21. -/
theorem ep_Q2_002_partial_21_0186_valid :
    mulPoly ep_Q2_002_coefficient_21_0186
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0187 : Poly :=
[
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 187 for generator 21. -/
def ep_Q2_002_partial_21_0187 : Poly :=
[
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (10, 1), (11, 1), (12, 1)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 21. -/
theorem ep_Q2_002_partial_21_0187_valid :
    mulPoly ep_Q2_002_coefficient_21_0187
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0188 : Poly :=
[
  term ((-4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (13, 1)]
]

/-- Partial product 188 for generator 21. -/
def ep_Q2_002_partial_21_0188 : Poly :=
[
  term ((-9870251280062719201013309565696 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (10, 1), (13, 1)],
  term ((4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 21. -/
theorem ep_Q2_002_partial_21_0188_valid :
    mulPoly ep_Q2_002_coefficient_21_0188
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0189 : Poly :=
[
  term ((-1066087736257266730282620340040 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1)]
]

/-- Partial product 189 for generator 21. -/
def ep_Q2_002_partial_21_0189 : Poly :=
[
  term ((1066087736257266730282620340040 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1)],
  term ((-2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 21. -/
theorem ep_Q2_002_partial_21_0189_valid :
    mulPoly ep_Q2_002_coefficient_21_0189
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0190 : Poly :=
[
  term ((-2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (10, 1)]
]

/-- Partial product 190 for generator 21. -/
def ep_Q2_002_partial_21_0190 : Poly :=
[
  term ((2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (10, 1)],
  term ((-4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 21. -/
theorem ep_Q2_002_partial_21_0190_valid :
    mulPoly ep_Q2_002_coefficient_21_0190
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0191 : Poly :=
[
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (10, 1), (12, 1)]
]

/-- Partial product 191 for generator 21. -/
def ep_Q2_002_partial_21_0191 : Poly :=
[
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (10, 1), (12, 1)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (10, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 21. -/
theorem ep_Q2_002_partial_21_0191_valid :
    mulPoly ep_Q2_002_coefficient_21_0191
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0192 : Poly :=
[
  term ((7681589302515211534053804017184 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (12, 1)]
]

/-- Partial product 192 for generator 21. -/
def ep_Q2_002_partial_21_0192 : Poly :=
[
  term ((15363178605030423068107608034368 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (10, 1), (12, 1)],
  term ((-7681589302515211534053804017184 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 21. -/
theorem ep_Q2_002_partial_21_0192_valid :
    mulPoly ep_Q2_002_coefficient_21_0192
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0193 : Poly :=
[
  term ((3599555765101987274023930872480 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (11, 1)]
]

/-- Partial product 193 for generator 21. -/
def ep_Q2_002_partial_21_0193 : Poly :=
[
  term ((7199111530203974548047861744960 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 1)],
  term ((-3599555765101987274023930872480 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 21. -/
theorem ep_Q2_002_partial_21_0193_valid :
    mulPoly ep_Q2_002_coefficient_21_0193
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0194 : Poly :=
[
  term ((5198872329002523637307475422784 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (13, 1)]
]

/-- Partial product 194 for generator 21. -/
def ep_Q2_002_partial_21_0194 : Poly :=
[
  term ((10397744658005047274614950845568 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (10, 1), (13, 1)],
  term ((-5198872329002523637307475422784 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 21. -/
theorem ep_Q2_002_partial_21_0194_valid :
    mulPoly ep_Q2_002_coefficient_21_0194
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0195 : Poly :=
[
  term ((-345387197016836488974301231189950857205072 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (8, 1), (15, 1)]
]

/-- Partial product 195 for generator 21. -/
def ep_Q2_002_partial_21_0195 : Poly :=
[
  term ((-690774394033672977948602462379901714410144 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 1)],
  term ((345387197016836488974301231189950857205072 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 21. -/
theorem ep_Q2_002_partial_21_0195_valid :
    mulPoly ep_Q2_002_coefficient_21_0195
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0196 : Poly :=
[
  term ((-11834005716 : Rat) / 7401317245) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 196 for generator 21. -/
def ep_Q2_002_partial_21_0196 : Poly :=
[
  term ((-23668011432 : Rat) / 7401317245) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((11834005716 : Rat) / 7401317245) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 21. -/
theorem ep_Q2_002_partial_21_0196_valid :
    mulPoly ep_Q2_002_coefficient_21_0196
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0197 : Poly :=
[
  term ((-11977509929982494498261795530944 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (12, 1)]
]

/-- Partial product 197 for generator 21. -/
def ep_Q2_002_partial_21_0197 : Poly :=
[
  term ((-23955019859964988996523591061888 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (10, 1), (12, 1)],
  term ((11977509929982494498261795530944 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 21. -/
theorem ep_Q2_002_partial_21_0197_valid :
    mulPoly ep_Q2_002_coefficient_21_0197
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0198 : Poly :=
[
  term ((21249531066455895606476934331296 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 1), (11, 1)]
]

/-- Partial product 198 for generator 21. -/
def ep_Q2_002_partial_21_0198 : Poly :=
[
  term ((-21249531066455895606476934331296 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 1), (11, 1)],
  term ((42499062132911791212953868662592 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 21. -/
theorem ep_Q2_002_partial_21_0198_valid :
    mulPoly ep_Q2_002_coefficient_21_0198
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0199 : Poly :=
[
  term ((-42015261474669651015645113053888 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 1), (13, 1)]
]

/-- Partial product 199 for generator 21. -/
def ep_Q2_002_partial_21_0199 : Poly :=
[
  term ((42015261474669651015645113053888 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 1), (13, 1)],
  term ((-84030522949339302031290226107776 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 21. -/
theorem ep_Q2_002_partial_21_0199_valid :
    mulPoly ep_Q2_002_coefficient_21_0199
        ep_Q2_002_generator_21_0100_0199 =
      ep_Q2_002_partial_21_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_21_0100_0199 : List Poly :=
[
  ep_Q2_002_partial_21_0100,
  ep_Q2_002_partial_21_0101,
  ep_Q2_002_partial_21_0102,
  ep_Q2_002_partial_21_0103,
  ep_Q2_002_partial_21_0104,
  ep_Q2_002_partial_21_0105,
  ep_Q2_002_partial_21_0106,
  ep_Q2_002_partial_21_0107,
  ep_Q2_002_partial_21_0108,
  ep_Q2_002_partial_21_0109,
  ep_Q2_002_partial_21_0110,
  ep_Q2_002_partial_21_0111,
  ep_Q2_002_partial_21_0112,
  ep_Q2_002_partial_21_0113,
  ep_Q2_002_partial_21_0114,
  ep_Q2_002_partial_21_0115,
  ep_Q2_002_partial_21_0116,
  ep_Q2_002_partial_21_0117,
  ep_Q2_002_partial_21_0118,
  ep_Q2_002_partial_21_0119,
  ep_Q2_002_partial_21_0120,
  ep_Q2_002_partial_21_0121,
  ep_Q2_002_partial_21_0122,
  ep_Q2_002_partial_21_0123,
  ep_Q2_002_partial_21_0124,
  ep_Q2_002_partial_21_0125,
  ep_Q2_002_partial_21_0126,
  ep_Q2_002_partial_21_0127,
  ep_Q2_002_partial_21_0128,
  ep_Q2_002_partial_21_0129,
  ep_Q2_002_partial_21_0130,
  ep_Q2_002_partial_21_0131,
  ep_Q2_002_partial_21_0132,
  ep_Q2_002_partial_21_0133,
  ep_Q2_002_partial_21_0134,
  ep_Q2_002_partial_21_0135,
  ep_Q2_002_partial_21_0136,
  ep_Q2_002_partial_21_0137,
  ep_Q2_002_partial_21_0138,
  ep_Q2_002_partial_21_0139,
  ep_Q2_002_partial_21_0140,
  ep_Q2_002_partial_21_0141,
  ep_Q2_002_partial_21_0142,
  ep_Q2_002_partial_21_0143,
  ep_Q2_002_partial_21_0144,
  ep_Q2_002_partial_21_0145,
  ep_Q2_002_partial_21_0146,
  ep_Q2_002_partial_21_0147,
  ep_Q2_002_partial_21_0148,
  ep_Q2_002_partial_21_0149,
  ep_Q2_002_partial_21_0150,
  ep_Q2_002_partial_21_0151,
  ep_Q2_002_partial_21_0152,
  ep_Q2_002_partial_21_0153,
  ep_Q2_002_partial_21_0154,
  ep_Q2_002_partial_21_0155,
  ep_Q2_002_partial_21_0156,
  ep_Q2_002_partial_21_0157,
  ep_Q2_002_partial_21_0158,
  ep_Q2_002_partial_21_0159,
  ep_Q2_002_partial_21_0160,
  ep_Q2_002_partial_21_0161,
  ep_Q2_002_partial_21_0162,
  ep_Q2_002_partial_21_0163,
  ep_Q2_002_partial_21_0164,
  ep_Q2_002_partial_21_0165,
  ep_Q2_002_partial_21_0166,
  ep_Q2_002_partial_21_0167,
  ep_Q2_002_partial_21_0168,
  ep_Q2_002_partial_21_0169,
  ep_Q2_002_partial_21_0170,
  ep_Q2_002_partial_21_0171,
  ep_Q2_002_partial_21_0172,
  ep_Q2_002_partial_21_0173,
  ep_Q2_002_partial_21_0174,
  ep_Q2_002_partial_21_0175,
  ep_Q2_002_partial_21_0176,
  ep_Q2_002_partial_21_0177,
  ep_Q2_002_partial_21_0178,
  ep_Q2_002_partial_21_0179,
  ep_Q2_002_partial_21_0180,
  ep_Q2_002_partial_21_0181,
  ep_Q2_002_partial_21_0182,
  ep_Q2_002_partial_21_0183,
  ep_Q2_002_partial_21_0184,
  ep_Q2_002_partial_21_0185,
  ep_Q2_002_partial_21_0186,
  ep_Q2_002_partial_21_0187,
  ep_Q2_002_partial_21_0188,
  ep_Q2_002_partial_21_0189,
  ep_Q2_002_partial_21_0190,
  ep_Q2_002_partial_21_0191,
  ep_Q2_002_partial_21_0192,
  ep_Q2_002_partial_21_0193,
  ep_Q2_002_partial_21_0194,
  ep_Q2_002_partial_21_0195,
  ep_Q2_002_partial_21_0196,
  ep_Q2_002_partial_21_0197,
  ep_Q2_002_partial_21_0198,
  ep_Q2_002_partial_21_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_21_0100_0199 : Poly :=
[
  term ((21753158577884224121228403351168 : Rat) / 97983883872014706756151952089) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((2383391728629285592064010598010623077822672 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((164748507116 : Rat) / 7401317245) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((23735383726844911575906001553472 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((446917849148119147287005584295656143771408 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((18020739984 : Rat) / 7401317245) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-10876579288942112060614201675584 : Rat) / 97983883872014706756151952089) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((-1191695864314642796032005299005311538911336 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-82374253558 : Rat) / 7401317245) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11867691863422455787953000776736 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1)],
  term ((-223458924574059573643502792147828071885704 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (15, 1)],
  term ((-9010369992 : Rat) / 7401317245) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((1069891365385373922720 : Rat) / 253528477699481291099) [(0, 1), (7, 2)],
  term ((-2139782730770747845440 : Rat) / 253528477699481291099) [(0, 1), (7, 2), (10, 1)],
  term ((2452440473700416696966194141920 : Rat) / 115799135485108289802725034287) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-4618404684923601247783296416640 : Rat) / 115799135485108289802725034287) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-176154082430111205438651712257017518784784 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-70731287012 : Rat) / 7401317245) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1226220236850208348483097070960 : Rat) / 115799135485108289802725034287) [(0, 1), (8, 1), (9, 1), (11, 1)],
  term ((2309202342461800623891648208320 : Rat) / 115799135485108289802725034287) [(0, 1), (8, 1), (9, 1), (13, 1)],
  term ((88077041215055602719325856128508759392392 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((35365643506 : Rat) / 7401317245) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((368316105710867772960198095848512 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((115143037980744582044994326502790931275152 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((83610017648 : Rat) / 7401317245) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-61967924136900462606692617135656 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (10, 1), (11, 2)],
  term ((-4656114116929408492660557389417625446054208 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-296593401024 : Rat) / 7401317245) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-473845509290433879250474220334720 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (10, 1), (13, 2)],
  term ((1562380103114150014404839347339184000460936 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((83610017648 : Rat) / 7401317245) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-184158052855433886480099047924256 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((-57571518990372291022497163251395465637576 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((-41805008824 : Rat) / 7401317245) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((30983962068450231303346308567828 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (11, 2)],
  term ((2328057058464704246330278694708812723027104 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((148296700512 : Rat) / 7401317245) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((236922754645216939625237110167360 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (13, 2)],
  term ((-781190051557075007202419673669592000230468 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (15, 2)],
  term ((-41805008824 : Rat) / 7401317245) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((-191552381164583821849230715169232 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((-154659896653196110998724470409968 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((291253548835442852146657427461056 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((718487279005636850319119276800748747153856 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((40020930548 : Rat) / 1480263449) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((360729006092424204194507279425344 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((-1836628468244488948039968796862501719038672 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((75067106504 : Rat) / 7401317245) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((95776190582291910924615357584616 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1)],
  term ((77329948326598055499362235204984 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-145626774417721426073328713730528 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((-359243639502818425159559638400374373576928 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-20010465274 : Rat) / 1480263449) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-180364503046212102097253639712672 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1)],
  term ((918314234122244474019984398431250859519336 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (15, 1)],
  term ((-37533553252 : Rat) / 7401317245) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-82274960773598362616512367662464 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-2343955050327447571344083146876035132375768 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-40465089634 : Rat) / 7401317245) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-374926206966442317445806352357776 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((156344706362924328738497959291902539194932 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-114070604819 : Rat) / 7401317245) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((178220186341238923588290938821488 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (11, 2)],
  term ((-36617230606793432726501024815728 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((-1890657017800618440121084201198842293950368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((43849362696 : Rat) / 7401317245) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((284798296847261140404859948596480 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (12, 1), (13, 2)],
  term ((-2116885566821367335925480142815836001252936 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-6355787374 : Rat) / 1057331035) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((596186099642653662016576437478136833946976 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((18543727028 : Rat) / 7401317245) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2675361123009986016217474924992 : Rat) / 97983883872014706756151952089) [(0, 1), (10, 1), (13, 2)],
  term ((-8913001262632743877605285504597826242348 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 1), (15, 2)],
  term ((-75009813239 : Rat) / 7401317245) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((145164978564092055020006542642032 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term ((2601599758386936369269973173931190222916424 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((-22127002658 : Rat) / 7401317245) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-273372839943243749775817689322944 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 2), (13, 2)],
  term ((41137480386799181308256183831232 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((1171977525163723785672041573438017566187884 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((20232544817 : Rat) / 7401317245) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((151171858842198144967901540518380 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1)],
  term ((-78172353181462164369248979645951269597466 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (15, 1)],
  term ((114070604819 : Rat) / 14802634490) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-89110093170619461794145469410744 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2)],
  term ((18308615303396716363250512407864 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2), (12, 1)],
  term ((945328508900309220060542100599421146975184 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-21924681348 : Rat) / 7401317245) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-142399148423630570202429974298240 : Rat) / 1273790490336191187829975377157) [(0, 1), (12, 1), (13, 2)],
  term ((1058442783410683667962740071407918000626468 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 1), (15, 2)],
  term ((3177893687 : Rat) / 1057331035) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6632818107818607855425045540013048760158 : Rat) / 9418309213428828857245785101775707465) [(0, 1), (13, 1), (15, 1)],
  term ((-7480225699 : Rat) / 14802634490) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((85733057285375846549368009343184 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2)],
  term ((4456500631316371938802642752298913121174 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (15, 2)],
  term ((75009813239 : Rat) / 14802634490) [(0, 1), (15, 2), (16, 1)],
  term ((-6028482677517970479574292759424 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (9, 1)],
  term ((12056965355035940959148585518848 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (9, 1), (10, 1)],
  term ((5588734837750331754863904980160 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (10, 1), (11, 1)],
  term ((-2112221366412418588079672316288 : Rat) / 115799135485108289802725034287) [(0, 2), (1, 1), (10, 1), (13, 1)],
  term ((5588734837750331754863904980160 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((-2794367418875165877431952490080 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (11, 1)],
  term ((1056110683206209294039836158144 : Rat) / 115799135485108289802725034287) [(0, 2), (1, 1), (13, 1)],
  term ((-2794367418875165877431952490080 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (15, 1)],
  term ((-170463616930894751296492870437696 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((321014913709517069880969221836032 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((2870460998600555409954400696365289900633536 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((185849697408 : Rat) / 7401317245) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((85231808465447375648246435218848 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (11, 1)],
  term ((-160507456854758534940484610918016 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (13, 1)],
  term ((-1435230499300277704977200348182644950316768 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (9, 1), (15, 1)],
  term ((-92924848704 : Rat) / 7401317245) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((477291996359045184938272538767776 : Rat) / 1273790490336191187829975377157) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-2494292640770990797243215728972057731855368 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-10592497274 : Rat) / 7401317245) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-79014571781340158249698414210320 : Rat) / 1273790490336191187829975377157) [(0, 2), (10, 1), (11, 2)],
  term ((32436387924353545505128043486104620892080 : Rat) / 20720280269543423485940727223906556423) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((-4704705796 : Rat) / 211466207) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-56237580494587027651430445604992 : Rat) / 115799135485108289802725034287) [(0, 2), (10, 1), (13, 2)],
  term ((-2410748081809344614033998316237201378574168 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (10, 1), (15, 2)],
  term ((-10592497274 : Rat) / 7401317245) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-238645998179522592469136269383888 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 1), (13, 1)],
  term ((1247146320385495398621607864486028865927684 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (11, 1), (15, 1)],
  term ((5296248637 : Rat) / 7401317245) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((39507285890670079124849207105160 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 2)],
  term ((-16218193962176772752564021743052310446040 : Rat) / 20720280269543423485940727223906556423) [(0, 2), (13, 1), (15, 1)],
  term ((2352352898 : Rat) / 211466207) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((28118790247293513825715222802496 : Rat) / 115799135485108289802725034287) [(0, 2), (13, 2)],
  term ((1205374040904672307016999158118600689287084 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (15, 2)],
  term ((5296248637 : Rat) / 7401317245) [(0, 2), (15, 2), (16, 1)],
  term ((-2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (6, 1)],
  term ((4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (6, 1), (10, 1)],
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (6, 1), (10, 1), (12, 1)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (6, 1), (12, 1)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (6, 1), (7, 1)],
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (6, 1), (7, 1), (10, 1)],
  term ((-4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (10, 1), (15, 1)],
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1)],
  term ((222308460748264059718356855240 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (6, 1)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (9, 1)],
  term ((-16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (9, 1), (10, 1)],
  term ((-195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((152960326704 : Rat) / 7401317245) [(1, 1), (3, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (11, 1)],
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1)],
  term ((-561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 2)],
  term ((-28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 2), (10, 1)],
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (8, 1)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (8, 1), (10, 1)],
  term ((5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((-444616921496528119436713710480 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (6, 1), (10, 1)],
  term ((65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((1252951825237464718032818647488 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (6, 1), (10, 1), (12, 1)],
  term ((-122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (6, 1), (10, 1), (15, 2)],
  term ((-50986775568 : Rat) / 7401317245) [(1, 1), (3, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((-626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (6, 1), (12, 1)],
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((-3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (9, 1)],
  term ((6009014872703505400747753501440 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (9, 1), (10, 1)],
  term ((4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (10, 1), (11, 1)],
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (10, 1), (11, 1), (12, 1)],
  term ((-9870251280062719201013309565696 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (10, 1), (13, 1)],
  term ((-2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1)],
  term ((4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (13, 1)],
  term ((1066087736257266730282620340040 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1)],
  term ((9870251280062719201013309565696 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (10, 1), (12, 1)],
  term ((-4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (10, 2)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (10, 2), (12, 1)],
  term ((-7681589302515211534053804017184 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (12, 1)],
  term ((7199111530203974548047861744960 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 1)],
  term ((10397744658005047274614950845568 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (10, 1), (13, 1)],
  term ((-690774394033672977948602462379901714410144 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 1)],
  term ((-23668011432 : Rat) / 7401317245) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3599555765101987274023930872480 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (11, 1)],
  term ((-5198872329002523637307475422784 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (13, 1)],
  term ((345387197016836488974301231189950857205072 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (8, 1), (15, 1)],
  term ((11834005716 : Rat) / 7401317245) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-23955019859964988996523591061888 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (10, 1), (12, 1)],
  term ((11977509929982494498261795530944 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (12, 1)],
  term ((-21249531066455895606476934331296 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 1), (11, 1)],
  term ((42015261474669651015645113053888 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 1), (13, 1)],
  term ((42499062132911791212953868662592 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 2), (11, 1)],
  term ((-84030522949339302031290226107776 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 100 through 199. -/
theorem ep_Q2_002_block_21_0100_0199_valid :
    checkProductSumEq ep_Q2_002_partials_21_0100_0199
      ep_Q2_002_block_21_0100_0199 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
