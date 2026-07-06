/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 28:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 28 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_28_0100_0199 : Poly :=
[
  term (2 : Rat) [(10, 1), (14, 1)],
  term (-1 : Rat) [(10, 2)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0100 : Poly :=
[
  term ((-1111262432868 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 100 for generator 28. -/
def ep_Q2_054_partial_28_0100 : Poly :=
[
  term ((-2222524865736 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((1111262432868 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 2), (12, 1)],
  term ((-2222524865736 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((1111262432868 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 28. -/
theorem ep_Q2_054_partial_28_0100_valid :
    mulPoly ep_Q2_054_coefficient_28_0100
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0101 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 101 for generator 28. -/
def ep_Q2_054_partial_28_0101 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 28. -/
theorem ep_Q2_054_partial_28_0101_valid :
    mulPoly ep_Q2_054_coefficient_28_0101
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0102 : Poly :=
[
  term ((-1685108414472 : Rat) / 45033486517) [(1, 1), (11, 1)]
]

/-- Partial product 102 for generator 28. -/
def ep_Q2_054_partial_28_0102 : Poly :=
[
  term ((-3370216828944 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (14, 1)],
  term ((1685108414472 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1)],
  term ((-3370216828944 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1)],
  term ((1685108414472 : Rat) / 45033486517) [(1, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 28. -/
theorem ep_Q2_054_partial_28_0102_valid :
    mulPoly ep_Q2_054_coefficient_28_0102
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0103 : Poly :=
[
  term ((-515943272403 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 103 for generator 28. -/
def ep_Q2_054_partial_28_0103 : Poly :=
[
  term ((-1031886544806 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((515943272403 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (12, 1)],
  term ((-1031886544806 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((515943272403 : Rat) / 45033486517) [(1, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 28. -/
theorem ep_Q2_054_partial_28_0103_valid :
    mulPoly ep_Q2_054_coefficient_28_0103
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0104 : Poly :=
[
  term ((-28798086109188 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 104 for generator 28. -/
def ep_Q2_054_partial_28_0104 : Poly :=
[
  term ((-57596172218376 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((28798086109188 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-57596172218376 : Rat) / 45033486517) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((28798086109188 : Rat) / 45033486517) [(1, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 28. -/
theorem ep_Q2_054_partial_28_0104_valid :
    mulPoly ep_Q2_054_coefficient_28_0104
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0105 : Poly :=
[
  term ((15079154132454 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 105 for generator 28. -/
def ep_Q2_054_partial_28_0105 : Poly :=
[
  term ((30158308264908 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-15079154132454 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((30158308264908 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 3)],
  term ((-15079154132454 : Rat) / 45033486517) [(1, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 28. -/
theorem ep_Q2_054_partial_28_0105_valid :
    mulPoly ep_Q2_054_coefficient_28_0105
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0106 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 106 for generator 28. -/
def ep_Q2_054_partial_28_0106 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 3), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 28. -/
theorem ep_Q2_054_partial_28_0106_valid :
    mulPoly ep_Q2_054_coefficient_28_0106
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0107 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 107 for generator 28. -/
def ep_Q2_054_partial_28_0107 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 2), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (11, 3), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 28. -/
theorem ep_Q2_054_partial_28_0107_valid :
    mulPoly ep_Q2_054_coefficient_28_0107
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0108 : Poly :=
[
  term ((-53027957271753 : Rat) / 90066973034) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 108 for generator 28. -/
def ep_Q2_054_partial_28_0108 : Poly :=
[
  term ((-53027957271753 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((53027957271753 : Rat) / 90066973034) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((-53027957271753 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((53027957271753 : Rat) / 90066973034) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 28. -/
theorem ep_Q2_054_partial_28_0108_valid :
    mulPoly ep_Q2_054_coefficient_28_0108
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0109 : Poly :=
[
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 28. -/
def ep_Q2_054_partial_28_0109 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 28. -/
theorem ep_Q2_054_partial_28_0109_valid :
    mulPoly ep_Q2_054_coefficient_28_0109
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0110 : Poly :=
[
  term ((-30507482344587 : Rat) / 180133946068) [(1, 1), (13, 1)]
]

/-- Partial product 110 for generator 28. -/
def ep_Q2_054_partial_28_0110 : Poly :=
[
  term ((-30507482344587 : Rat) / 90066973034) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((30507482344587 : Rat) / 180133946068) [(1, 1), (10, 2), (13, 1)],
  term ((-30507482344587 : Rat) / 90066973034) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((30507482344587 : Rat) / 180133946068) [(1, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 28. -/
theorem ep_Q2_054_partial_28_0110_valid :
    mulPoly ep_Q2_054_coefficient_28_0110
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0111 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 111 for generator 28. -/
def ep_Q2_054_partial_28_0111 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 28. -/
theorem ep_Q2_054_partial_28_0111_valid :
    mulPoly ep_Q2_054_coefficient_28_0111
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0112 : Poly :=
[
  term ((87158084834973 : Rat) / 90066973034) [(1, 1), (15, 1)]
]

/-- Partial product 112 for generator 28. -/
def ep_Q2_054_partial_28_0112 : Poly :=
[
  term ((87158084834973 : Rat) / 45033486517) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-87158084834973 : Rat) / 90066973034) [(1, 1), (10, 2), (15, 1)],
  term ((87158084834973 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2)],
  term ((-87158084834973 : Rat) / 90066973034) [(1, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 28. -/
theorem ep_Q2_054_partial_28_0112_valid :
    mulPoly ep_Q2_054_coefficient_28_0112
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0113 : Poly :=
[
  term ((-453407385240 : Rat) / 45033486517) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 28. -/
def ep_Q2_054_partial_28_0113 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((453407385240 : Rat) / 45033486517) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((453407385240 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 28. -/
theorem ep_Q2_054_partial_28_0113_valid :
    mulPoly ep_Q2_054_coefficient_28_0113
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0114 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 114 for generator 28. -/
def ep_Q2_054_partial_28_0114 : Poly :=
[
  term ((146431800000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 2), (13, 1)],
  term ((146431800000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 28. -/
theorem ep_Q2_054_partial_28_0114_valid :
    mulPoly ep_Q2_054_coefficient_28_0114
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0115 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 115 for generator 28. -/
def ep_Q2_054_partial_28_0115 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 2), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 28. -/
theorem ep_Q2_054_partial_28_0115_valid :
    mulPoly ep_Q2_054_coefficient_28_0115
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0116 : Poly :=
[
  term ((-3391908239079 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1)]
]

/-- Partial product 116 for generator 28. -/
def ep_Q2_054_partial_28_0116 : Poly :=
[
  term ((-6783816478158 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((3391908239079 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 2)],
  term ((-6783816478158 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((3391908239079 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 28. -/
theorem ep_Q2_054_partial_28_0116_valid :
    mulPoly ep_Q2_054_coefficient_28_0116
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0117 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 117 for generator 28. -/
def ep_Q2_054_partial_28_0117 : Poly :=
[
  term ((878590800000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((878590800000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 28. -/
theorem ep_Q2_054_partial_28_0117_valid :
    mulPoly ep_Q2_054_coefficient_28_0117
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0118 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 118 for generator 28. -/
def ep_Q2_054_partial_28_0118 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (15, 2)],
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 28. -/
theorem ep_Q2_054_partial_28_0118_valid :
    mulPoly ep_Q2_054_coefficient_28_0118
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0119 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (12, 1)]
]

/-- Partial product 119 for generator 28. -/
def ep_Q2_054_partial_28_0119 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 2), (12, 1)],
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 28. -/
theorem ep_Q2_054_partial_28_0119_valid :
    mulPoly ep_Q2_054_coefficient_28_0119
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0120 : Poly :=
[
  term ((54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 120 for generator 28. -/
def ep_Q2_054_partial_28_0120 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 28. -/
theorem ep_Q2_054_partial_28_0120_valid :
    mulPoly ep_Q2_054_coefficient_28_0120
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0121 : Poly :=
[
  term ((-913808907756 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 121 for generator 28. -/
def ep_Q2_054_partial_28_0121 : Poly :=
[
  term ((-1827617815512 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((913808907756 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 2), (11, 1)],
  term ((-1827617815512 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 2), (15, 1)],
  term ((913808907756 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 28. -/
theorem ep_Q2_054_partial_28_0121_valid :
    mulPoly ep_Q2_054_coefficient_28_0121
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0122 : Poly :=
[
  term ((-67114575000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 122 for generator 28. -/
def ep_Q2_054_partial_28_0122 : Poly :=
[
  term ((-134229150000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((67114575000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-134229150000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((67114575000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 28. -/
theorem ep_Q2_054_partial_28_0122_valid :
    mulPoly ep_Q2_054_coefficient_28_0122
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0123 : Poly :=
[
  term ((-6326226138780 : Rat) / 45033486517) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 123 for generator 28. -/
def ep_Q2_054_partial_28_0123 : Poly :=
[
  term ((-12652452277560 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((6326226138780 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 2), (13, 1)],
  term ((-12652452277560 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((6326226138780 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 28. -/
theorem ep_Q2_054_partial_28_0123_valid :
    mulPoly ep_Q2_054_coefficient_28_0123
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0124 : Poly :=
[
  term ((2761120540512 : Rat) / 45033486517) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 124 for generator 28. -/
def ep_Q2_054_partial_28_0124 : Poly :=
[
  term ((5522241081024 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2761120540512 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 2), (15, 1)],
  term ((5522241081024 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (15, 2)],
  term ((-2761120540512 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 28. -/
theorem ep_Q2_054_partial_28_0124_valid :
    mulPoly ep_Q2_054_coefficient_28_0124
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0125 : Poly :=
[
  term ((-61013250000 : Rat) / 45033486517) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 28. -/
def ep_Q2_054_partial_28_0125 : Poly :=
[
  term ((-122026500000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((61013250000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-122026500000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((61013250000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 28. -/
theorem ep_Q2_054_partial_28_0125_valid :
    mulPoly ep_Q2_054_coefficient_28_0125
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0126 : Poly :=
[
  term ((-1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 126 for generator 28. -/
def ep_Q2_054_partial_28_0126 : Poly :=
[
  term ((-2418172721280 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-2418172721280 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 28. -/
theorem ep_Q2_054_partial_28_0126_valid :
    mulPoly ep_Q2_054_coefficient_28_0126
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0127 : Poly :=
[
  term ((604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (15, 2)]
]

/-- Partial product 127 for generator 28. -/
def ep_Q2_054_partial_28_0127 : Poly :=
[
  term ((1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 2), (15, 2)],
  term ((1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 1), (15, 3)],
  term ((-604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 28. -/
theorem ep_Q2_054_partial_28_0127_valid :
    mulPoly ep_Q2_054_coefficient_28_0127
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0128 : Poly :=
[
  term ((-7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 128 for generator 28. -/
def ep_Q2_054_partial_28_0128 : Poly :=
[
  term ((-14509036327680 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-14509036327680 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (13, 1), (15, 2)],
  term ((7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 28. -/
theorem ep_Q2_054_partial_28_0128_valid :
    mulPoly ep_Q2_054_coefficient_28_0128
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0129 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 129 for generator 28. -/
def ep_Q2_054_partial_28_0129 : Poly :=
[
  term ((7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (11, 1), (15, 2)],
  term ((7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (15, 3)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 28. -/
theorem ep_Q2_054_partial_28_0129_valid :
    mulPoly ep_Q2_054_coefficient_28_0129
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0130 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 130 for generator 28. -/
def ep_Q2_054_partial_28_0130 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 28. -/
theorem ep_Q2_054_partial_28_0130_valid :
    mulPoly ep_Q2_054_coefficient_28_0130
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0131 : Poly :=
[
  term ((3839665223268 : Rat) / 45033486517) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 131 for generator 28. -/
def ep_Q2_054_partial_28_0131 : Poly :=
[
  term ((7679330446536 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 28. -/
theorem ep_Q2_054_partial_28_0131_valid :
    mulPoly ep_Q2_054_coefficient_28_0131
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0132 : Poly :=
[
  term ((16322665868640 : Rat) / 45033486517) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 132 for generator 28. -/
def ep_Q2_054_partial_28_0132 : Poly :=
[
  term ((32645331737280 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (15, 1)],
  term ((32645331737280 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 28. -/
theorem ep_Q2_054_partial_28_0132_valid :
    mulPoly ep_Q2_054_coefficient_28_0132
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0133 : Poly :=
[
  term ((1437433626015 : Rat) / 45033486517) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 28. -/
def ep_Q2_054_partial_28_0133 : Poly :=
[
  term ((2874867252030 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1437433626015 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((2874867252030 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1437433626015 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 28. -/
theorem ep_Q2_054_partial_28_0133_valid :
    mulPoly ep_Q2_054_coefficient_28_0133
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0134 : Poly :=
[
  term ((-6201715029633 : Rat) / 45033486517) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 134 for generator 28. -/
def ep_Q2_054_partial_28_0134 : Poly :=
[
  term ((-12403430059266 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((6201715029633 : Rat) / 45033486517) [(2, 1), (10, 2), (11, 1), (15, 1)],
  term ((-12403430059266 : Rat) / 45033486517) [(2, 1), (11, 2), (15, 2)],
  term ((6201715029633 : Rat) / 45033486517) [(2, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 28. -/
theorem ep_Q2_054_partial_28_0134_valid :
    mulPoly ep_Q2_054_coefficient_28_0134
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0135 : Poly :=
[
  term ((847857119865 : Rat) / 45033486517) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 28. -/
def ep_Q2_054_partial_28_0135 : Poly :=
[
  term ((1695714239730 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-847857119865 : Rat) / 45033486517) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((1695714239730 : Rat) / 45033486517) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((-847857119865 : Rat) / 45033486517) [(2, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 28. -/
theorem ep_Q2_054_partial_28_0135_valid :
    mulPoly ep_Q2_054_coefficient_28_0135
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0136 : Poly :=
[
  term ((-260472044055 : Rat) / 90066973034) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 136 for generator 28. -/
def ep_Q2_054_partial_28_0136 : Poly :=
[
  term ((-260472044055 : Rat) / 45033486517) [(2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((260472044055 : Rat) / 90066973034) [(2, 1), (10, 2), (12, 1), (16, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((260472044055 : Rat) / 90066973034) [(2, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 28. -/
theorem ep_Q2_054_partial_28_0136_valid :
    mulPoly ep_Q2_054_coefficient_28_0136
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0137 : Poly :=
[
  term ((-796530294737 : Rat) / 45033486517) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 137 for generator 28. -/
def ep_Q2_054_partial_28_0137 : Poly :=
[
  term ((-1593060589474 : Rat) / 45033486517) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((796530294737 : Rat) / 45033486517) [(2, 1), (10, 2), (13, 1), (15, 1)],
  term ((-1593060589474 : Rat) / 45033486517) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((796530294737 : Rat) / 45033486517) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 28. -/
theorem ep_Q2_054_partial_28_0137_valid :
    mulPoly ep_Q2_054_coefficient_28_0137
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0138 : Poly :=
[
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 28. -/
def ep_Q2_054_partial_28_0138 : Poly :=
[
  term ((520944088110 : Rat) / 45033486517) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((520944088110 : Rat) / 45033486517) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 28. -/
theorem ep_Q2_054_partial_28_0138_valid :
    mulPoly ep_Q2_054_coefficient_28_0138
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0139 : Poly :=
[
  term ((-3609407137928 : Rat) / 45033486517) [(2, 1), (15, 2)]
]

/-- Partial product 139 for generator 28. -/
def ep_Q2_054_partial_28_0139 : Poly :=
[
  term ((-7218814275856 : Rat) / 45033486517) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((3609407137928 : Rat) / 45033486517) [(2, 1), (10, 2), (15, 2)],
  term ((-7218814275856 : Rat) / 45033486517) [(2, 1), (11, 1), (15, 3)],
  term ((3609407137928 : Rat) / 45033486517) [(2, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 28. -/
theorem ep_Q2_054_partial_28_0139_valid :
    mulPoly ep_Q2_054_coefficient_28_0139
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0140 : Poly :=
[
  term ((747099923145 : Rat) / 45033486517) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 140 for generator 28. -/
def ep_Q2_054_partial_28_0140 : Poly :=
[
  term ((1494199846290 : Rat) / 45033486517) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-747099923145 : Rat) / 45033486517) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((1494199846290 : Rat) / 45033486517) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-747099923145 : Rat) / 45033486517) [(2, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 28. -/
theorem ep_Q2_054_partial_28_0140_valid :
    mulPoly ep_Q2_054_coefficient_28_0140
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0141 : Poly :=
[
  term ((260472044055 : Rat) / 180133946068) [(2, 1), (16, 1)]
]

/-- Partial product 141 for generator 28. -/
def ep_Q2_054_partial_28_0141 : Poly :=
[
  term ((260472044055 : Rat) / 90066973034) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((-260472044055 : Rat) / 180133946068) [(2, 1), (10, 2), (16, 1)],
  term ((260472044055 : Rat) / 90066973034) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-260472044055 : Rat) / 180133946068) [(2, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 28. -/
theorem ep_Q2_054_partial_28_0141_valid :
    mulPoly ep_Q2_054_coefficient_28_0141
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0142 : Poly :=
[
  term ((-6207245783469 : Rat) / 45033486517) [(3, 1), (7, 1)]
]

/-- Partial product 142 for generator 28. -/
def ep_Q2_054_partial_28_0142 : Poly :=
[
  term ((-12414491566938 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (14, 1)],
  term ((6207245783469 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2)],
  term ((-12414491566938 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((6207245783469 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 28. -/
theorem ep_Q2_054_partial_28_0142_valid :
    mulPoly ep_Q2_054_coefficient_28_0142
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0143 : Poly :=
[
  term ((3382756251579 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1)]
]

/-- Partial product 143 for generator 28. -/
def ep_Q2_054_partial_28_0143 : Poly :=
[
  term ((6765512503158 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (14, 1)],
  term ((-3382756251579 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 2)],
  term ((6765512503158 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-3382756251579 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 28. -/
theorem ep_Q2_054_partial_28_0143_valid :
    mulPoly ep_Q2_054_coefficient_28_0143
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0144 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 144 for generator 28. -/
def ep_Q2_054_partial_28_0144 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 2), (11, 1), (13, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 28. -/
theorem ep_Q2_054_partial_28_0144_valid :
    mulPoly ep_Q2_054_coefficient_28_0144
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0145 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 145 for generator 28. -/
def ep_Q2_054_partial_28_0145 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (15, 2)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 28. -/
theorem ep_Q2_054_partial_28_0145_valid :
    mulPoly ep_Q2_054_coefficient_28_0145
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0146 : Poly :=
[
  term ((-54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 146 for generator 28. -/
def ep_Q2_054_partial_28_0146 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 2), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 28. -/
theorem ep_Q2_054_partial_28_0146_valid :
    mulPoly ep_Q2_054_coefficient_28_0146
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0147 : Poly :=
[
  term ((64063912500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 147 for generator 28. -/
def ep_Q2_054_partial_28_0147 : Poly :=
[
  term ((128127825000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-64063912500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 2), (11, 1)],
  term ((128127825000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((-64063912500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 28. -/
theorem ep_Q2_054_partial_28_0147_valid :
    mulPoly ep_Q2_054_coefficient_28_0147
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0148 : Poly :=
[
  term ((-54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 148 for generator 28. -/
def ep_Q2_054_partial_28_0148 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 28. -/
theorem ep_Q2_054_partial_28_0148_valid :
    mulPoly ep_Q2_054_coefficient_28_0148
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0149 : Poly :=
[
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 149 for generator 28. -/
def ep_Q2_054_partial_28_0149 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (11, 1), (13, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 28. -/
theorem ep_Q2_054_partial_28_0149_valid :
    mulPoly ep_Q2_054_coefficient_28_0149
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0150 : Poly :=
[
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 150 for generator 28. -/
def ep_Q2_054_partial_28_0150 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (11, 1), (15, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (15, 2)],
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 28. -/
theorem ep_Q2_054_partial_28_0150_valid :
    mulPoly ep_Q2_054_coefficient_28_0150
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0151 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 151 for generator 28. -/
def ep_Q2_054_partial_28_0151 : Poly :=
[
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 28. -/
theorem ep_Q2_054_partial_28_0151_valid :
    mulPoly ep_Q2_054_coefficient_28_0151
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0152 : Poly :=
[
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2)]
]

/-- Partial product 152 for generator 28. -/
def ep_Q2_054_partial_28_0152 : Poly :=
[
  term ((-54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 2), (14, 1)],
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (11, 2)],
  term ((-54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 3), (15, 1)],
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 28. -/
theorem ep_Q2_054_partial_28_0152_valid :
    mulPoly ep_Q2_054_coefficient_28_0152
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0153 : Poly :=
[
  term ((1284464401506 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1)]
]

/-- Partial product 153 for generator 28. -/
def ep_Q2_054_partial_28_0153 : Poly :=
[
  term ((2568928803012 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((-1284464401506 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (12, 1)],
  term ((2568928803012 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1284464401506 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 28. -/
theorem ep_Q2_054_partial_28_0153_valid :
    mulPoly ep_Q2_054_coefficient_28_0153
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0154 : Poly :=
[
  term ((6101325000 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 154 for generator 28. -/
def ep_Q2_054_partial_28_0154 : Poly :=
[
  term ((12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 28. -/
theorem ep_Q2_054_partial_28_0154_valid :
    mulPoly ep_Q2_054_coefficient_28_0154
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0155 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 155 for generator 28. -/
def ep_Q2_054_partial_28_0155 : Poly :=
[
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 28. -/
theorem ep_Q2_054_partial_28_0155_valid :
    mulPoly ep_Q2_054_coefficient_28_0155
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0156 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 156 for generator 28. -/
def ep_Q2_054_partial_28_0156 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 28. -/
theorem ep_Q2_054_partial_28_0156_valid :
    mulPoly ep_Q2_054_coefficient_28_0156
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0157 : Poly :=
[
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 157 for generator 28. -/
def ep_Q2_054_partial_28_0157 : Poly :=
[
  term ((-1209086360640 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 28. -/
theorem ep_Q2_054_partial_28_0157_valid :
    mulPoly ep_Q2_054_coefficient_28_0157
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0158 : Poly :=
[
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 158 for generator 28. -/
def ep_Q2_054_partial_28_0158 : Poly :=
[
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (11, 1), (15, 2)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (15, 3)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 28. -/
theorem ep_Q2_054_partial_28_0158_valid :
    mulPoly ep_Q2_054_coefficient_28_0158
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0159 : Poly :=
[
  term ((-3839665223268 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 159 for generator 28. -/
def ep_Q2_054_partial_28_0159 : Poly :=
[
  term ((-7679330446536 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 28. -/
theorem ep_Q2_054_partial_28_0159_valid :
    mulPoly ep_Q2_054_coefficient_28_0159
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0160 : Poly :=
[
  term ((-16171530073560 : Rat) / 45033486517) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 160 for generator 28. -/
def ep_Q2_054_partial_28_0160 : Poly :=
[
  term ((-32343060147120 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((16171530073560 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (15, 1)],
  term ((-32343060147120 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((16171530073560 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 28. -/
theorem ep_Q2_054_partial_28_0160_valid :
    mulPoly ep_Q2_054_coefficient_28_0160
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0161 : Poly :=
[
  term ((-1437433626015 : Rat) / 45033486517) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 161 for generator 28. -/
def ep_Q2_054_partial_28_0161 : Poly :=
[
  term ((-2874867252030 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1437433626015 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2874867252030 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((1437433626015 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 28. -/
theorem ep_Q2_054_partial_28_0161_valid :
    mulPoly ep_Q2_054_coefficient_28_0161
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0162 : Poly :=
[
  term ((-1057950565560 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 162 for generator 28. -/
def ep_Q2_054_partial_28_0162 : Poly :=
[
  term ((-2115901131120 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1057950565560 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-2115901131120 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 2), (15, 2)],
  term ((1057950565560 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 28. -/
theorem ep_Q2_054_partial_28_0162_valid :
    mulPoly ep_Q2_054_coefficient_28_0162
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0163 : Poly :=
[
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 163 for generator 28. -/
def ep_Q2_054_partial_28_0163 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 28. -/
theorem ep_Q2_054_partial_28_0163_valid :
    mulPoly ep_Q2_054_coefficient_28_0163
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0164 : Poly :=
[
  term ((-218251834008 : Rat) / 45033486517) [(3, 1), (11, 1)]
]

/-- Partial product 164 for generator 28. -/
def ep_Q2_054_partial_28_0164 : Poly :=
[
  term ((-436503668016 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((218251834008 : Rat) / 45033486517) [(3, 1), (10, 2), (11, 1)],
  term ((-436503668016 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 1)],
  term ((218251834008 : Rat) / 45033486517) [(3, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 28. -/
theorem ep_Q2_054_partial_28_0164_valid :
    mulPoly ep_Q2_054_coefficient_28_0164
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0165 : Poly :=
[
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 165 for generator 28. -/
def ep_Q2_054_partial_28_0165 : Poly :=
[
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 28. -/
theorem ep_Q2_054_partial_28_0165_valid :
    mulPoly ep_Q2_054_coefficient_28_0165
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0166 : Poly :=
[
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (11, 1), (15, 2)]
]

/-- Partial product 166 for generator 28. -/
def ep_Q2_054_partial_28_0166 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (10, 2), (11, 1), (15, 2)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 3)],
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 28. -/
theorem ep_Q2_054_partial_28_0166_valid :
    mulPoly ep_Q2_054_coefficient_28_0166
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0167 : Poly :=
[
  term ((201514393440 : Rat) / 45033486517) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 167 for generator 28. -/
def ep_Q2_054_partial_28_0167 : Poly :=
[
  term ((403028786880 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-201514393440 : Rat) / 45033486517) [(3, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((403028786880 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 3), (16, 1)],
  term ((-201514393440 : Rat) / 45033486517) [(3, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 28. -/
theorem ep_Q2_054_partial_28_0167_valid :
    mulPoly ep_Q2_054_coefficient_28_0167
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0168 : Poly :=
[
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 168 for generator 28. -/
def ep_Q2_054_partial_28_0168 : Poly :=
[
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (10, 2), (11, 2), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (11, 3), (15, 2)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 28. -/
theorem ep_Q2_054_partial_28_0168_valid :
    mulPoly ep_Q2_054_coefficient_28_0168
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0169 : Poly :=
[
  term ((80715328893 : Rat) / 45033486517) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 169 for generator 28. -/
def ep_Q2_054_partial_28_0169 : Poly :=
[
  term ((161430657786 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-80715328893 : Rat) / 45033486517) [(3, 1), (10, 2), (12, 1), (15, 1)],
  term ((161430657786 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-80715328893 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 28. -/
theorem ep_Q2_054_partial_28_0169_valid :
    mulPoly ep_Q2_054_coefficient_28_0169
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0170 : Poly :=
[
  term ((-100757196720 : Rat) / 45033486517) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 28. -/
def ep_Q2_054_partial_28_0170 : Poly :=
[
  term ((-201514393440 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((100757196720 : Rat) / 45033486517) [(3, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-201514393440 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((100757196720 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 28. -/
theorem ep_Q2_054_partial_28_0170_valid :
    mulPoly ep_Q2_054_coefficient_28_0170
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0171 : Poly :=
[
  term ((1876874506790 : Rat) / 45033486517) [(3, 1), (13, 1)]
]

/-- Partial product 171 for generator 28. -/
def ep_Q2_054_partial_28_0171 : Poly :=
[
  term ((3753749013580 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1876874506790 : Rat) / 45033486517) [(3, 1), (10, 2), (13, 1)],
  term ((3753749013580 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1876874506790 : Rat) / 45033486517) [(3, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 28. -/
theorem ep_Q2_054_partial_28_0171_valid :
    mulPoly ep_Q2_054_coefficient_28_0171
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0172 : Poly :=
[
  term ((201514393440 : Rat) / 45033486517) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 172 for generator 28. -/
def ep_Q2_054_partial_28_0172 : Poly :=
[
  term ((403028786880 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-201514393440 : Rat) / 45033486517) [(3, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((403028786880 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-201514393440 : Rat) / 45033486517) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 28. -/
theorem ep_Q2_054_partial_28_0172_valid :
    mulPoly ep_Q2_054_coefficient_28_0172
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0173 : Poly :=
[
  term ((20314585812237 : Rat) / 90066973034) [(3, 1), (15, 1)]
]

/-- Partial product 173 for generator 28. -/
def ep_Q2_054_partial_28_0173 : Poly :=
[
  term ((20314585812237 : Rat) / 45033486517) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-20314585812237 : Rat) / 90066973034) [(3, 1), (10, 2), (15, 1)],
  term ((20314585812237 : Rat) / 45033486517) [(3, 1), (11, 1), (15, 2)],
  term ((-20314585812237 : Rat) / 90066973034) [(3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 28. -/
theorem ep_Q2_054_partial_28_0173_valid :
    mulPoly ep_Q2_054_coefficient_28_0173
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0174 : Poly :=
[
  term ((2177050212075 : Rat) / 90066973034) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 174 for generator 28. -/
def ep_Q2_054_partial_28_0174 : Poly :=
[
  term ((2177050212075 : Rat) / 45033486517) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2177050212075 : Rat) / 90066973034) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((2177050212075 : Rat) / 45033486517) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2177050212075 : Rat) / 90066973034) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 28. -/
theorem ep_Q2_054_partial_28_0174_valid :
    mulPoly ep_Q2_054_coefficient_28_0174
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0175 : Poly :=
[
  term ((-5893439645016 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1)]
]

/-- Partial product 175 for generator 28. -/
def ep_Q2_054_partial_28_0175 : Poly :=
[
  term ((-11786879290032 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (10, 1), (14, 1)],
  term ((5893439645016 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (10, 2)],
  term ((-11786879290032 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((5893439645016 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 28. -/
theorem ep_Q2_054_partial_28_0175_valid :
    mulPoly ep_Q2_054_coefficient_28_0175
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0176 : Poly :=
[
  term ((2381405728560 : Rat) / 45033486517) [(5, 1), (7, 1)]
]

/-- Partial product 176 for generator 28. -/
def ep_Q2_054_partial_28_0176 : Poly :=
[
  term ((4762811457120 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 1), (14, 1)],
  term ((-2381405728560 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 2)],
  term ((4762811457120 : Rat) / 45033486517) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-2381405728560 : Rat) / 45033486517) [(5, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 28. -/
theorem ep_Q2_054_partial_28_0176_valid :
    mulPoly ep_Q2_054_coefficient_28_0176
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0177 : Poly :=
[
  term ((367622707952592 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 177 for generator 28. -/
def ep_Q2_054_partial_28_0177 : Poly :=
[
  term ((735245415905184 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-367622707952592 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((735245415905184 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-367622707952592 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 28. -/
theorem ep_Q2_054_partial_28_0177_valid :
    mulPoly ep_Q2_054_coefficient_28_0177
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0178 : Poly :=
[
  term ((326607707952 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 178 for generator 28. -/
def ep_Q2_054_partial_28_0178 : Poly :=
[
  term ((653215415904 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term ((653215415904 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 28. -/
theorem ep_Q2_054_partial_28_0178_valid :
    mulPoly ep_Q2_054_coefficient_28_0178
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0179 : Poly :=
[
  term ((-159038119382616 : Rat) / 45033486517) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 179 for generator 28. -/
def ep_Q2_054_partial_28_0179 : Poly :=
[
  term ((-318076238765232 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((159038119382616 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((-318076238765232 : Rat) / 45033486517) [(5, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((159038119382616 : Rat) / 45033486517) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 28. -/
theorem ep_Q2_054_partial_28_0179_valid :
    mulPoly ep_Q2_054_coefficient_28_0179
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0180 : Poly :=
[
  term ((-13727981250000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (13, 1)]
]

/-- Partial product 180 for generator 28. -/
def ep_Q2_054_partial_28_0180 : Poly :=
[
  term ((-27455962500000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (10, 2), (13, 1)],
  term ((-27455962500000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 28. -/
theorem ep_Q2_054_partial_28_0180_valid :
    mulPoly ep_Q2_054_coefficient_28_0180
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0181 : Poly :=
[
  term ((-1057909264920 : Rat) / 45033486517) [(5, 1), (7, 2), (13, 1)]
]

/-- Partial product 181 for generator 28. -/
def ep_Q2_054_partial_28_0181 : Poly :=
[
  term ((-2115818529840 : Rat) / 45033486517) [(5, 1), (7, 2), (10, 1), (13, 1), (14, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(5, 1), (7, 2), (10, 2), (13, 1)],
  term ((-2115818529840 : Rat) / 45033486517) [(5, 1), (7, 2), (11, 1), (13, 1), (15, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(5, 1), (7, 2), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 28. -/
theorem ep_Q2_054_partial_28_0181_valid :
    mulPoly ep_Q2_054_coefficient_28_0181
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0182 : Poly :=
[
  term ((-841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 182 for generator 28. -/
def ep_Q2_054_partial_28_0182 : Poly :=
[
  term ((-1683965700000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 2), (13, 1)],
  term ((-1683965700000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 28. -/
theorem ep_Q2_054_partial_28_0182_valid :
    mulPoly ep_Q2_054_coefficient_28_0182
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0183 : Poly :=
[
  term ((420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 183 for generator 28. -/
def ep_Q2_054_partial_28_0183 : Poly :=
[
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 2), (15, 1)],
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((-420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 28. -/
theorem ep_Q2_054_partial_28_0183_valid :
    mulPoly ep_Q2_054_coefficient_28_0183
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0184 : Poly :=
[
  term ((-210495712500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 184 for generator 28. -/
def ep_Q2_054_partial_28_0184 : Poly :=
[
  term ((-420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((210495712500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 2)],
  term ((-420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((210495712500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 28. -/
theorem ep_Q2_054_partial_28_0184_valid :
    mulPoly ep_Q2_054_coefficient_28_0184
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0185 : Poly :=
[
  term ((-1404775043127 : Rat) / 90066973034) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 185 for generator 28. -/
def ep_Q2_054_partial_28_0185 : Poly :=
[
  term ((-1404775043127 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((1404775043127 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 2), (11, 1)],
  term ((-1404775043127 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 2), (15, 1)],
  term ((1404775043127 : Rat) / 90066973034) [(6, 1), (7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 28. -/
theorem ep_Q2_054_partial_28_0185_valid :
    mulPoly ep_Q2_054_coefficient_28_0185
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0186 : Poly :=
[
  term ((9046464453135 : Rat) / 90066973034) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 186 for generator 28. -/
def ep_Q2_054_partial_28_0186 : Poly :=
[
  term ((9046464453135 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-9046464453135 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 2), (13, 1)],
  term ((9046464453135 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9046464453135 : Rat) / 90066973034) [(6, 1), (7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 28. -/
theorem ep_Q2_054_partial_28_0186_valid :
    mulPoly ep_Q2_054_coefficient_28_0186
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0187 : Poly :=
[
  term ((3253256365635 : Rat) / 90066973034) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 187 for generator 28. -/
def ep_Q2_054_partial_28_0187 : Poly :=
[
  term ((3253256365635 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-3253256365635 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 2), (15, 1)],
  term ((3253256365635 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 1), (15, 2)],
  term ((-3253256365635 : Rat) / 90066973034) [(6, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 28. -/
theorem ep_Q2_054_partial_28_0187_valid :
    mulPoly ep_Q2_054_coefficient_28_0187
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0188 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 188 for generator 28. -/
def ep_Q2_054_partial_28_0188 : Poly :=
[
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 28. -/
theorem ep_Q2_054_partial_28_0188_valid :
    mulPoly ep_Q2_054_coefficient_28_0188
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0189 : Poly :=
[
  term ((6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 189 for generator 28. -/
def ep_Q2_054_partial_28_0189 : Poly :=
[
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (12, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 28. -/
theorem ep_Q2_054_partial_28_0189_valid :
    mulPoly ep_Q2_054_coefficient_28_0189
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0190 : Poly :=
[
  term ((14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 190 for generator 28. -/
def ep_Q2_054_partial_28_0190 : Poly :=
[
  term ((28058566045536 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((28058566045536 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 28. -/
theorem ep_Q2_054_partial_28_0190_valid :
    mulPoly ep_Q2_054_coefficient_28_0190
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0191 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 191 for generator 28. -/
def ep_Q2_054_partial_28_0191 : Poly :=
[
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 28. -/
theorem ep_Q2_054_partial_28_0191_valid :
    mulPoly ep_Q2_054_coefficient_28_0191
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0192 : Poly :=
[
  term ((-7014641511384 : Rat) / 45033486517) [(6, 1), (8, 1), (15, 2)]
]

/-- Partial product 192 for generator 28. -/
def ep_Q2_054_partial_28_0192 : Poly :=
[
  term ((-14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((7014641511384 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (15, 2)],
  term ((-14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (15, 3)],
  term ((7014641511384 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 28. -/
theorem ep_Q2_054_partial_28_0192_valid :
    mulPoly ep_Q2_054_coefficient_28_0192
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0193 : Poly :=
[
  term ((-3050662500 : Rat) / 45033486517) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 193 for generator 28. -/
def ep_Q2_054_partial_28_0193 : Poly :=
[
  term ((-6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((3050662500 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3050662500 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 28. -/
theorem ep_Q2_054_partial_28_0193_valid :
    mulPoly ep_Q2_054_coefficient_28_0193
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0194 : Poly :=
[
  term ((-2020885192953 : Rat) / 90066973034) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 194 for generator 28. -/
def ep_Q2_054_partial_28_0194 : Poly :=
[
  term ((-2020885192953 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((2020885192953 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 2), (11, 1)],
  term ((-2020885192953 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((2020885192953 : Rat) / 90066973034) [(6, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 28. -/
theorem ep_Q2_054_partial_28_0194_valid :
    mulPoly ep_Q2_054_coefficient_28_0194
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0195 : Poly :=
[
  term ((-689898597651 : Rat) / 90066973034) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 195 for generator 28. -/
def ep_Q2_054_partial_28_0195 : Poly :=
[
  term ((-689898597651 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((689898597651 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 2), (13, 1)],
  term ((-689898597651 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((689898597651 : Rat) / 90066973034) [(6, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 28. -/
theorem ep_Q2_054_partial_28_0195_valid :
    mulPoly ep_Q2_054_coefficient_28_0195
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0196 : Poly :=
[
  term ((6300337613733 : Rat) / 90066973034) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 196 for generator 28. -/
def ep_Q2_054_partial_28_0196 : Poly :=
[
  term ((6300337613733 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-6300337613733 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 2), (15, 1)],
  term ((6300337613733 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-6300337613733 : Rat) / 90066973034) [(6, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 28. -/
theorem ep_Q2_054_partial_28_0196_valid :
    mulPoly ep_Q2_054_coefficient_28_0196
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0197 : Poly :=
[
  term ((13065458464521 : Rat) / 45033486517) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 197 for generator 28. -/
def ep_Q2_054_partial_28_0197 : Poly :=
[
  term ((26130916929042 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-13065458464521 : Rat) / 45033486517) [(6, 1), (10, 2), (11, 1), (15, 1)],
  term ((26130916929042 : Rat) / 45033486517) [(6, 1), (11, 2), (15, 2)],
  term ((-13065458464521 : Rat) / 45033486517) [(6, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 28. -/
theorem ep_Q2_054_partial_28_0197_valid :
    mulPoly ep_Q2_054_coefficient_28_0197
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0198 : Poly :=
[
  term ((-312515105154 : Rat) / 45033486517) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 198 for generator 28. -/
def ep_Q2_054_partial_28_0198 : Poly :=
[
  term ((-625030210308 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((312515105154 : Rat) / 45033486517) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-625030210308 : Rat) / 45033486517) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((312515105154 : Rat) / 45033486517) [(6, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 28. -/
theorem ep_Q2_054_partial_28_0198_valid :
    mulPoly ep_Q2_054_coefficient_28_0198
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0199 : Poly :=
[
  term ((473642722245 : Rat) / 45033486517) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 199 for generator 28. -/
def ep_Q2_054_partial_28_0199 : Poly :=
[
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-473642722245 : Rat) / 45033486517) [(6, 1), (10, 2), (12, 1), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-473642722245 : Rat) / 45033486517) [(6, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 28. -/
theorem ep_Q2_054_partial_28_0199_valid :
    mulPoly ep_Q2_054_coefficient_28_0199
        ep_Q2_054_generator_28_0100_0199 =
      ep_Q2_054_partial_28_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_28_0100_0199 : List Poly :=
[
  ep_Q2_054_partial_28_0100,
  ep_Q2_054_partial_28_0101,
  ep_Q2_054_partial_28_0102,
  ep_Q2_054_partial_28_0103,
  ep_Q2_054_partial_28_0104,
  ep_Q2_054_partial_28_0105,
  ep_Q2_054_partial_28_0106,
  ep_Q2_054_partial_28_0107,
  ep_Q2_054_partial_28_0108,
  ep_Q2_054_partial_28_0109,
  ep_Q2_054_partial_28_0110,
  ep_Q2_054_partial_28_0111,
  ep_Q2_054_partial_28_0112,
  ep_Q2_054_partial_28_0113,
  ep_Q2_054_partial_28_0114,
  ep_Q2_054_partial_28_0115,
  ep_Q2_054_partial_28_0116,
  ep_Q2_054_partial_28_0117,
  ep_Q2_054_partial_28_0118,
  ep_Q2_054_partial_28_0119,
  ep_Q2_054_partial_28_0120,
  ep_Q2_054_partial_28_0121,
  ep_Q2_054_partial_28_0122,
  ep_Q2_054_partial_28_0123,
  ep_Q2_054_partial_28_0124,
  ep_Q2_054_partial_28_0125,
  ep_Q2_054_partial_28_0126,
  ep_Q2_054_partial_28_0127,
  ep_Q2_054_partial_28_0128,
  ep_Q2_054_partial_28_0129,
  ep_Q2_054_partial_28_0130,
  ep_Q2_054_partial_28_0131,
  ep_Q2_054_partial_28_0132,
  ep_Q2_054_partial_28_0133,
  ep_Q2_054_partial_28_0134,
  ep_Q2_054_partial_28_0135,
  ep_Q2_054_partial_28_0136,
  ep_Q2_054_partial_28_0137,
  ep_Q2_054_partial_28_0138,
  ep_Q2_054_partial_28_0139,
  ep_Q2_054_partial_28_0140,
  ep_Q2_054_partial_28_0141,
  ep_Q2_054_partial_28_0142,
  ep_Q2_054_partial_28_0143,
  ep_Q2_054_partial_28_0144,
  ep_Q2_054_partial_28_0145,
  ep_Q2_054_partial_28_0146,
  ep_Q2_054_partial_28_0147,
  ep_Q2_054_partial_28_0148,
  ep_Q2_054_partial_28_0149,
  ep_Q2_054_partial_28_0150,
  ep_Q2_054_partial_28_0151,
  ep_Q2_054_partial_28_0152,
  ep_Q2_054_partial_28_0153,
  ep_Q2_054_partial_28_0154,
  ep_Q2_054_partial_28_0155,
  ep_Q2_054_partial_28_0156,
  ep_Q2_054_partial_28_0157,
  ep_Q2_054_partial_28_0158,
  ep_Q2_054_partial_28_0159,
  ep_Q2_054_partial_28_0160,
  ep_Q2_054_partial_28_0161,
  ep_Q2_054_partial_28_0162,
  ep_Q2_054_partial_28_0163,
  ep_Q2_054_partial_28_0164,
  ep_Q2_054_partial_28_0165,
  ep_Q2_054_partial_28_0166,
  ep_Q2_054_partial_28_0167,
  ep_Q2_054_partial_28_0168,
  ep_Q2_054_partial_28_0169,
  ep_Q2_054_partial_28_0170,
  ep_Q2_054_partial_28_0171,
  ep_Q2_054_partial_28_0172,
  ep_Q2_054_partial_28_0173,
  ep_Q2_054_partial_28_0174,
  ep_Q2_054_partial_28_0175,
  ep_Q2_054_partial_28_0176,
  ep_Q2_054_partial_28_0177,
  ep_Q2_054_partial_28_0178,
  ep_Q2_054_partial_28_0179,
  ep_Q2_054_partial_28_0180,
  ep_Q2_054_partial_28_0181,
  ep_Q2_054_partial_28_0182,
  ep_Q2_054_partial_28_0183,
  ep_Q2_054_partial_28_0184,
  ep_Q2_054_partial_28_0185,
  ep_Q2_054_partial_28_0186,
  ep_Q2_054_partial_28_0187,
  ep_Q2_054_partial_28_0188,
  ep_Q2_054_partial_28_0189,
  ep_Q2_054_partial_28_0190,
  ep_Q2_054_partial_28_0191,
  ep_Q2_054_partial_28_0192,
  ep_Q2_054_partial_28_0193,
  ep_Q2_054_partial_28_0194,
  ep_Q2_054_partial_28_0195,
  ep_Q2_054_partial_28_0196,
  ep_Q2_054_partial_28_0197,
  ep_Q2_054_partial_28_0198,
  ep_Q2_054_partial_28_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_28_0100_0199 : Poly :=
[
  term ((-2222524865736 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1111262432868 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 2), (12, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-2222524865736 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((1111262432868 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1031886544806 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-57596172218376 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3370216828944 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (14, 1)],
  term ((30158308264908 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-53027957271753 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30507482344587 : Rat) / 90066973034) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((87158084834973 : Rat) / 45033486517) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1685108414472 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1)],
  term ((515943272403 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (12, 1)],
  term ((28798086109188 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-15079154132454 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 2), (15, 1)],
  term ((53027957271753 : Rat) / 90066973034) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((30507482344587 : Rat) / 180133946068) [(1, 1), (10, 2), (13, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-87158084834973 : Rat) / 90066973034) [(1, 1), (10, 2), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-53027957271753 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-30507482344587 : Rat) / 90066973034) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((87158084834973 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((50964184182141 : Rat) / 90066973034) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((30507482344587 : Rat) / 180133946068) [(1, 1), (11, 2), (13, 1)],
  term ((-57596172218376 : Rat) / 45033486517) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-93898518492861 : Rat) / 90066973034) [(1, 1), (11, 2), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((30158308264908 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 3)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 3), (16, 1)],
  term ((1685108414472 : Rat) / 45033486517) [(1, 1), (11, 3)],
  term ((515943272403 : Rat) / 45033486517) [(1, 1), (11, 3), (12, 1)],
  term ((28798086109188 : Rat) / 45033486517) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((-23240487066774 : Rat) / 45033486517) [(1, 1), (11, 3), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (11, 3), (15, 2), (16, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (11, 4), (15, 1)],
  term ((146431800000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 2), (13, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 2), (15, 1)],
  term ((146431800000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 2), (13, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-6783816478158 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((3391908239079 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 2), (12, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6783816478158 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3391908239079 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2)],
  term ((-109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (12, 1)],
  term ((878590800000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (15, 2)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 3), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 3), (15, 1)],
  term ((-1827617815512 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-134229150000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-12652452277560 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((5522241081024 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-122026500000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((913808907756 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 2), (11, 1)],
  term ((67114575000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((6326226138780 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 2), (13, 1)],
  term ((-2761120540512 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 2), (15, 1)],
  term ((61013250000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-12652452277560 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((5522241081024 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (15, 2)],
  term ((-122026500000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((6326226138780 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 2), (13, 1)],
  term ((-4588738356024 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 2), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((913808907756 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 3)],
  term ((67114575000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 3), (16, 1)],
  term ((-2418172721280 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 2), (15, 2)],
  term ((-2418172721280 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 1), (15, 3)],
  term ((1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 2), (15, 2)],
  term ((-14509036327680 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((32645331737280 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((2874867252030 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (11, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (13, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (15, 1)],
  term ((-1437433626015 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((7679330446536 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((32645331737280 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((2874867252030 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (13, 1)],
  term ((-14509036327680 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-1437433626015 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (15, 3)],
  term ((7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 3), (13, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 3), (15, 2)],
  term ((-12403430059266 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1695714239730 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1593060589474 : Rat) / 45033486517) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((520944088110 : Rat) / 45033486517) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7218814275856 : Rat) / 45033486517) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((1494199846290 : Rat) / 45033486517) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((260472044055 : Rat) / 90066973034) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((6201715029633 : Rat) / 45033486517) [(2, 1), (10, 2), (11, 1), (15, 1)],
  term ((-847857119865 : Rat) / 45033486517) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((260472044055 : Rat) / 90066973034) [(2, 1), (10, 2), (12, 1), (16, 1)],
  term ((796530294737 : Rat) / 45033486517) [(2, 1), (10, 2), (13, 1), (15, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((3609407137928 : Rat) / 45033486517) [(2, 1), (10, 2), (15, 2)],
  term ((-747099923145 : Rat) / 45033486517) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((-260472044055 : Rat) / 180133946068) [(2, 1), (10, 2), (16, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1593060589474 : Rat) / 45033486517) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((520944088110 : Rat) / 45033486517) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((260472044055 : Rat) / 90066973034) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7218814275856 : Rat) / 45033486517) [(2, 1), (11, 1), (15, 3)],
  term ((1494199846290 : Rat) / 45033486517) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((260472044055 : Rat) / 90066973034) [(2, 1), (11, 2), (12, 1), (16, 1)],
  term ((796530294737 : Rat) / 45033486517) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8794022921338 : Rat) / 45033486517) [(2, 1), (11, 2), (15, 2)],
  term ((948614316585 : Rat) / 45033486517) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((-260472044055 : Rat) / 180133946068) [(2, 1), (11, 2), (16, 1)],
  term ((6201715029633 : Rat) / 45033486517) [(2, 1), (11, 3), (15, 1)],
  term ((-847857119865 : Rat) / 45033486517) [(2, 1), (11, 3), (15, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((6765512503158 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (14, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-3382756251579 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 2)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 2), (11, 1), (13, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 2), (16, 1)],
  term ((6765512503158 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3382756251579 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (15, 2)],
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 3), (13, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 3), (15, 1)],
  term ((128127825000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-64063912500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 2), (11, 1)],
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((128127825000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((-64063912500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 3)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 2), (14, 1)],
  term ((2568928803012 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12414491566938 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (14, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((6207245783469 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2)],
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (11, 1), (13, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (11, 1), (15, 1)],
  term ((12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (11, 2)],
  term ((-1284464401506 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (12, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term ((2568928803012 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12414491566938 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((6207245783469 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2)],
  term ((-1284464401506 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (15, 2)],
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 3), (13, 1)],
  term ((-64063912500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 3), (15, 1)],
  term ((12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 4)],
  term ((-1209086360640 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-7679330446536 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-32343060147120 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2874867252030 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (11, 1), (15, 2)],
  term ((3839665223268 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (13, 1)],
  term ((16171530073560 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (15, 1)],
  term ((1437433626015 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-32343060147120 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-2874867252030 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (13, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((16171530073560 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (15, 1)],
  term ((1437433626015 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (15, 3)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 3), (13, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 3), (15, 2)],
  term ((-2115901131120 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1057950565560 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2115901131120 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 2), (15, 2)],
  term ((1057950565560 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 3), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-436503668016 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((403028786880 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((161430657786 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-201514393440 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3753749013580 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term ((403028786880 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((20314585812237 : Rat) / 45033486517) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((2177050212075 : Rat) / 45033486517) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((218251834008 : Rat) / 45033486517) [(3, 1), (10, 2), (11, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (10, 2), (11, 1), (15, 2)],
  term ((-201514393440 : Rat) / 45033486517) [(3, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (10, 2), (11, 2), (15, 1)],
  term ((-80715328893 : Rat) / 45033486517) [(3, 1), (10, 2), (12, 1), (15, 1)],
  term ((100757196720 : Rat) / 45033486517) [(3, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1876874506790 : Rat) / 45033486517) [(3, 1), (10, 2), (13, 1)],
  term ((-201514393440 : Rat) / 45033486517) [(3, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-20314585812237 : Rat) / 90066973034) [(3, 1), (10, 2), (15, 1)],
  term ((-2177050212075 : Rat) / 90066973034) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((161430657786 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-201514393440 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((3753749013580 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((403028786880 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((20314585812237 : Rat) / 45033486517) [(3, 1), (11, 1), (15, 2)],
  term ((2177050212075 : Rat) / 45033486517) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-80715328893 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 1), (15, 1)],
  term ((100757196720 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1876874506790 : Rat) / 45033486517) [(3, 1), (11, 2), (13, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((-201514393440 : Rat) / 45033486517) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-21187593148269 : Rat) / 90066973034) [(3, 1), (11, 2), (15, 1)],
  term ((-2177050212075 : Rat) / 90066973034) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 3)],
  term ((403028786880 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 3), (16, 1)],
  term ((218251834008 : Rat) / 45033486517) [(3, 1), (11, 3)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (11, 3), (13, 1), (15, 1)],
  term ((1057950565560 : Rat) / 45033486517) [(3, 1), (11, 3), (15, 2)],
  term ((-201514393440 : Rat) / 45033486517) [(3, 1), (11, 3), (15, 2), (16, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (11, 4), (15, 1)],
  term ((-11786879290032 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (10, 1), (14, 1)],
  term ((5893439645016 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (10, 2)],
  term ((-11786879290032 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((5893439645016 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (11, 2)],
  term ((735245415905184 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-367622707952592 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((735245415905184 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-367622707952592 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((653215415904 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term ((653215415904 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((-318076238765232 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((4762811457120 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 1), (14, 1)],
  term ((-2381405728560 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 2)],
  term ((159038119382616 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((-318076238765232 : Rat) / 45033486517) [(5, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((4762811457120 : Rat) / 45033486517) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-2381405728560 : Rat) / 45033486517) [(5, 1), (7, 1), (11, 2)],
  term ((159038119382616 : Rat) / 45033486517) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-27455962500000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (10, 2), (13, 1)],
  term ((-27455962500000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (11, 2), (13, 1)],
  term ((-2115818529840 : Rat) / 45033486517) [(5, 1), (7, 2), (10, 1), (13, 1), (14, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(5, 1), (7, 2), (10, 2), (13, 1)],
  term ((-2115818529840 : Rat) / 45033486517) [(5, 1), (7, 2), (11, 1), (13, 1), (15, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(5, 1), (7, 2), (11, 2), (13, 1)],
  term ((-1683965700000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 2), (13, 1)],
  term ((-420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 2), (15, 1)],
  term ((-1683965700000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 2), (13, 1)],
  term ((-420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((210495712500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 2)],
  term ((-420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((210495712500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 2)],
  term ((-1404775043127 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((9046464453135 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((3253256365635 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((1404775043127 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 2), (11, 1)],
  term ((-9046464453135 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 2), (13, 1)],
  term ((-3253256365635 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 2), (15, 1)],
  term ((9046464453135 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((3253256365635 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 1), (15, 2)],
  term ((-9046464453135 : Rat) / 90066973034) [(6, 1), (7, 1), (11, 2), (13, 1)],
  term ((-6062806451889 : Rat) / 90066973034) [(6, 1), (7, 1), (11, 2), (15, 1)],
  term ((1404775043127 : Rat) / 90066973034) [(6, 1), (7, 1), (11, 3)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((28058566045536 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((7014641511384 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (15, 2)],
  term ((3050662500 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((28058566045536 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (15, 3)],
  term ((-6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((-14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((7014641511384 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (15, 2)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((3050662500 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 3), (15, 1), (16, 1)],
  term ((-2020885192953 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-689898597651 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((6300337613733 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((2020885192953 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 2), (11, 1)],
  term ((689898597651 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 2), (13, 1)],
  term ((-6300337613733 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 2), (15, 1)],
  term ((-689898597651 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((6300337613733 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((689898597651 : Rat) / 90066973034) [(6, 1), (9, 1), (11, 2), (13, 1)],
  term ((-10342107999639 : Rat) / 90066973034) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((2020885192953 : Rat) / 90066973034) [(6, 1), (9, 1), (11, 3)],
  term ((26130916929042 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-625030210308 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-13065458464521 : Rat) / 45033486517) [(6, 1), (10, 2), (11, 1), (15, 1)],
  term ((312515105154 : Rat) / 45033486517) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-473642722245 : Rat) / 45033486517) [(6, 1), (10, 2), (12, 1), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-473642722245 : Rat) / 45033486517) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((26130916929042 : Rat) / 45033486517) [(6, 1), (11, 2), (15, 2)],
  term ((-625030210308 : Rat) / 45033486517) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-13065458464521 : Rat) / 45033486517) [(6, 1), (11, 3), (15, 1)],
  term ((312515105154 : Rat) / 45033486517) [(6, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 100 through 199. -/
theorem ep_Q2_054_block_28_0100_0199_valid :
    checkProductSumEq ep_Q2_054_partials_28_0100_0199
      ep_Q2_054_block_28_0100_0199 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
