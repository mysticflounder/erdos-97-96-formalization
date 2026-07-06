/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 2:100-136

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 2 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_02_0100_0136 : Poly :=
[
  term (2 : Rat) [(0, 1), (10, 1)],
  term (2 : Rat) [(1, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0100 : Poly :=
[
  term ((4292577564400512 : Rat) / 1230365000756557) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 100 for generator 2. -/
def ep_Q2_020_partial_02_0100 : Poly :=
[
  term ((8585155128801024 : Rat) / 1230365000756557) [(0, 1), (7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((8585155128801024 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(7, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 2. -/
theorem ep_Q2_020_partial_02_0100_valid :
    mulPoly ep_Q2_020_coefficient_02_0100
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0101 : Poly :=
[
  term ((-420652821811728678 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 101 for generator 2. -/
def ep_Q2_020_partial_02_0101 : Poly :=
[
  term ((-841305643623457356 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-841305643623457356 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((420652821811728678 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((420652821811728678 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 2. -/
theorem ep_Q2_020_partial_02_0101_valid :
    mulPoly ep_Q2_020_coefficient_02_0101
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0102 : Poly :=
[
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 1), (9, 3), (16, 1)]
]

/-- Partial product 102 for generator 2. -/
def ep_Q2_020_partial_02_0102 : Poly :=
[
  term ((383786804270990016 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 3), (10, 1), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 1), (9, 3), (10, 2), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 1), (9, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 2. -/
theorem ep_Q2_020_partial_02_0102_valid :
    mulPoly ep_Q2_020_coefficient_02_0102
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0103 : Poly :=
[
  term ((-46770128650620000 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 2. -/
def ep_Q2_020_partial_02_0103 : Poly :=
[
  term ((-93540257301240000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-93540257301240000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((46770128650620000 : Rat) / 28298395017400811) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((46770128650620000 : Rat) / 28298395017400811) [(7, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 2. -/
theorem ep_Q2_020_partial_02_0103_valid :
    mulPoly ep_Q2_020_coefficient_02_0103
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0104 : Poly :=
[
  term ((-2146288782200256 : Rat) / 1230365000756557) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 104 for generator 2. -/
def ep_Q2_020_partial_02_0104 : Poly :=
[
  term ((-4292577564400512 : Rat) / 1230365000756557) [(0, 1), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((2146288782200256 : Rat) / 1230365000756557) [(7, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((2146288782200256 : Rat) / 1230365000756557) [(7, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 2. -/
theorem ep_Q2_020_partial_02_0104_valid :
    mulPoly ep_Q2_020_coefficient_02_0104
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0105 : Poly :=
[
  term ((5759956455579255 : Rat) / 975806724737959) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 105 for generator 2. -/
def ep_Q2_020_partial_02_0105 : Poly :=
[
  term ((11519912911158510 : Rat) / 975806724737959) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((11519912911158510 : Rat) / 975806724737959) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-5759956455579255 : Rat) / 975806724737959) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-5759956455579255 : Rat) / 975806724737959) [(7, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 2. -/
theorem ep_Q2_020_partial_02_0105_valid :
    mulPoly ep_Q2_020_coefficient_02_0105
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0106 : Poly :=
[
  term ((-19487553604425000 : Rat) / 28298395017400811) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 106 for generator 2. -/
def ep_Q2_020_partial_02_0106 : Poly :=
[
  term ((-38975107208850000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((19487553604425000 : Rat) / 28298395017400811) [(7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((19487553604425000 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 2. -/
theorem ep_Q2_020_partial_02_0106_valid :
    mulPoly ep_Q2_020_coefficient_02_0106
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0107 : Poly :=
[
  term ((68215340162740824 : Rat) / 28298395017400811) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 107 for generator 2. -/
def ep_Q2_020_partial_02_0107 : Poly :=
[
  term ((136430680325481648 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((136430680325481648 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-68215340162740824 : Rat) / 28298395017400811) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-68215340162740824 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 2. -/
theorem ep_Q2_020_partial_02_0107_valid :
    mulPoly ep_Q2_020_coefficient_02_0107
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0108 : Poly :=
[
  term ((-894286992583440 : Rat) / 1230365000756557) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 2. -/
def ep_Q2_020_partial_02_0108 : Poly :=
[
  term ((-1788573985166880 : Rat) / 1230365000756557) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((894286992583440 : Rat) / 1230365000756557) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((894286992583440 : Rat) / 1230365000756557) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 2. -/
theorem ep_Q2_020_partial_02_0108_valid :
    mulPoly ep_Q2_020_coefficient_02_0108
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0109 : Poly :=
[
  term ((87391229380409241 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 2. -/
def ep_Q2_020_partial_02_0109 : Poly :=
[
  term ((174782458760818482 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((174782458760818482 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-87391229380409241 : Rat) / 28298395017400811) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-87391229380409241 : Rat) / 28298395017400811) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 2. -/
theorem ep_Q2_020_partial_02_0109_valid :
    mulPoly ep_Q2_020_coefficient_02_0109
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0110 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 110 for generator 2. -/
def ep_Q2_020_partial_02_0110 : Poly :=
[
  term ((191893402135495008 : Rat) / 28298395017400811) [(0, 1), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 2. -/
theorem ep_Q2_020_partial_02_0110_valid :
    mulPoly ep_Q2_020_coefficient_02_0110
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0111 : Poly :=
[
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 2), (16, 1)]
]

/-- Partial product 111 for generator 2. -/
def ep_Q2_020_partial_02_0111 : Poly :=
[
  term ((-383786804270990016 : Rat) / 28298395017400811) [(0, 1), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((-383786804270990016 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 2), (10, 2), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 2. -/
theorem ep_Q2_020_partial_02_0111_valid :
    mulPoly ep_Q2_020_coefficient_02_0111
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0112 : Poly :=
[
  term ((-71960025800810628 : Rat) / 28298395017400811) [(7, 2), (16, 1)]
]

/-- Partial product 112 for generator 2. -/
def ep_Q2_020_partial_02_0112 : Poly :=
[
  term ((-143920051601621256 : Rat) / 28298395017400811) [(0, 1), (7, 2), (10, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(7, 2), (10, 2), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 2. -/
theorem ep_Q2_020_partial_02_0112_valid :
    mulPoly ep_Q2_020_coefficient_02_0112
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0113 : Poly :=
[
  term ((40979858146626028 : Rat) / 975806724737959) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 113 for generator 2. -/
def ep_Q2_020_partial_02_0113 : Poly :=
[
  term ((81959716293252056 : Rat) / 975806724737959) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((81959716293252056 : Rat) / 975806724737959) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-40979858146626028 : Rat) / 975806724737959) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-40979858146626028 : Rat) / 975806724737959) [(9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 2. -/
theorem ep_Q2_020_partial_02_0113_valid :
    mulPoly ep_Q2_020_coefficient_02_0113
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0114 : Poly :=
[
  term ((6495851201475000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 114 for generator 2. -/
def ep_Q2_020_partial_02_0114 : Poly :=
[
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 2. -/
theorem ep_Q2_020_partial_02_0114_valid :
    mulPoly ep_Q2_020_coefficient_02_0114
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0115 : Poly :=
[
  term ((2256325073537110911 : Rat) / 113193580069603244) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 115 for generator 2. -/
def ep_Q2_020_partial_02_0115 : Poly :=
[
  term ((2256325073537110911 : Rat) / 56596790034801622) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((2256325073537110911 : Rat) / 56596790034801622) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2256325073537110911 : Rat) / 113193580069603244) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-2256325073537110911 : Rat) / 113193580069603244) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 2. -/
theorem ep_Q2_020_partial_02_0115_valid :
    mulPoly ep_Q2_020_coefficient_02_0115
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0116 : Poly :=
[
  term ((298095664194480 : Rat) / 1230365000756557) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 2. -/
def ep_Q2_020_partial_02_0116 : Poly :=
[
  term ((596191328388960 : Rat) / 1230365000756557) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 2. -/
theorem ep_Q2_020_partial_02_0116_valid :
    mulPoly ep_Q2_020_coefficient_02_0116
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0117 : Poly :=
[
  term ((695858523694589259 : Rat) / 56596790034801622) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 2. -/
def ep_Q2_020_partial_02_0117 : Poly :=
[
  term ((695858523694589259 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((695858523694589259 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-695858523694589259 : Rat) / 56596790034801622) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-695858523694589259 : Rat) / 56596790034801622) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 2. -/
theorem ep_Q2_020_partial_02_0117_valid :
    mulPoly ep_Q2_020_coefficient_02_0117
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0118 : Poly :=
[
  term ((-31180085767080000 : Rat) / 28298395017400811) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 2. -/
def ep_Q2_020_partial_02_0118 : Poly :=
[
  term ((-62360171534160000 : Rat) / 28298395017400811) [(0, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-62360171534160000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((31180085767080000 : Rat) / 28298395017400811) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((31180085767080000 : Rat) / 28298395017400811) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 2. -/
theorem ep_Q2_020_partial_02_0118_valid :
    mulPoly ep_Q2_020_coefficient_02_0118
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0119 : Poly :=
[
  term ((-1430859188133504 : Rat) / 1230365000756557) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 119 for generator 2. -/
def ep_Q2_020_partial_02_0119 : Poly :=
[
  term ((-2861718376267008 : Rat) / 1230365000756557) [(0, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2861718376267008 : Rat) / 1230365000756557) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((1430859188133504 : Rat) / 1230365000756557) [(9, 2), (10, 2), (15, 2), (16, 1)],
  term ((1430859188133504 : Rat) / 1230365000756557) [(9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 2. -/
theorem ep_Q2_020_partial_02_0119_valid :
    mulPoly ep_Q2_020_coefficient_02_0119
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0120 : Poly :=
[
  term ((184840446274448725 : Rat) / 28298395017400811) [(9, 2), (16, 1)]
]

/-- Partial product 120 for generator 2. -/
def ep_Q2_020_partial_02_0120 : Poly :=
[
  term ((369680892548897450 : Rat) / 28298395017400811) [(0, 1), (9, 2), (10, 1), (16, 1)],
  term ((369680892548897450 : Rat) / 28298395017400811) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((-184840446274448725 : Rat) / 28298395017400811) [(9, 2), (10, 2), (16, 1)],
  term ((-184840446274448725 : Rat) / 28298395017400811) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 2. -/
theorem ep_Q2_020_partial_02_0120_valid :
    mulPoly ep_Q2_020_coefficient_02_0120
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0121 : Poly :=
[
  term ((-164030632278182688 : Rat) / 28298395017400811) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 2. -/
def ep_Q2_020_partial_02_0121 : Poly :=
[
  term ((-328061264556365376 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-328061264556365376 : Rat) / 28298395017400811) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((164030632278182688 : Rat) / 28298395017400811) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((164030632278182688 : Rat) / 28298395017400811) [(11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 2. -/
theorem ep_Q2_020_partial_02_0121_valid :
    mulPoly ep_Q2_020_coefficient_02_0121
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0122 : Poly :=
[
  term ((63009756654307500 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 122 for generator 2. -/
def ep_Q2_020_partial_02_0122 : Poly :=
[
  term ((126019513308615000 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((126019513308615000 : Rat) / 28298395017400811) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-63009756654307500 : Rat) / 28298395017400811) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-63009756654307500 : Rat) / 28298395017400811) [(11, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 2. -/
theorem ep_Q2_020_partial_02_0122_valid :
    mulPoly ep_Q2_020_coefficient_02_0122
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0123 : Poly :=
[
  term ((15590042883540000 : Rat) / 28298395017400811) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 123 for generator 2. -/
def ep_Q2_020_partial_02_0123 : Poly :=
[
  term ((31180085767080000 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((31180085767080000 : Rat) / 28298395017400811) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 2. -/
theorem ep_Q2_020_partial_02_0123_valid :
    mulPoly ep_Q2_020_coefficient_02_0123
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0124 : Poly :=
[
  term ((-206932265528512692 : Rat) / 28298395017400811) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 124 for generator 2. -/
def ep_Q2_020_partial_02_0124 : Poly :=
[
  term ((-413864531057025384 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-413864531057025384 : Rat) / 28298395017400811) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((206932265528512692 : Rat) / 28298395017400811) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((206932265528512692 : Rat) / 28298395017400811) [(11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 2. -/
theorem ep_Q2_020_partial_02_0124_valid :
    mulPoly ep_Q2_020_coefficient_02_0124
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0125 : Poly :=
[
  term ((-1848193118005776 : Rat) / 1230365000756557) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 2. -/
def ep_Q2_020_partial_02_0125 : Poly :=
[
  term ((-3696386236011552 : Rat) / 1230365000756557) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3696386236011552 : Rat) / 1230365000756557) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((1848193118005776 : Rat) / 1230365000756557) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1848193118005776 : Rat) / 1230365000756557) [(11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 2. -/
theorem ep_Q2_020_partial_02_0125_valid :
    mulPoly ep_Q2_020_coefficient_02_0125
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0126 : Poly :=
[
  term ((-97117694093985517 : Rat) / 28298395017400811) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 2. -/
def ep_Q2_020_partial_02_0126 : Poly :=
[
  term ((-194235388187971034 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-194235388187971034 : Rat) / 28298395017400811) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((97117694093985517 : Rat) / 28298395017400811) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((97117694093985517 : Rat) / 28298395017400811) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 2. -/
theorem ep_Q2_020_partial_02_0126_valid :
    mulPoly ep_Q2_020_coefficient_02_0126
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0127 : Poly :=
[
  term ((715429594066752 : Rat) / 1230365000756557) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 127 for generator 2. -/
def ep_Q2_020_partial_02_0127 : Poly :=
[
  term ((1430859188133504 : Rat) / 1230365000756557) [(0, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((1430859188133504 : Rat) / 1230365000756557) [(1, 1), (11, 2), (15, 3), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 2. -/
theorem ep_Q2_020_partial_02_0127_valid :
    mulPoly ep_Q2_020_coefficient_02_0127
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0128 : Poly :=
[
  term ((-589410376663348278 : Rat) / 28298395017400811) [(11, 2), (16, 1)]
]

/-- Partial product 128 for generator 2. -/
def ep_Q2_020_partial_02_0128 : Poly :=
[
  term ((-1178820753326696556 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((-1178820753326696556 : Rat) / 28298395017400811) [(1, 1), (11, 3), (16, 1)],
  term ((589410376663348278 : Rat) / 28298395017400811) [(10, 2), (11, 2), (16, 1)],
  term ((589410376663348278 : Rat) / 28298395017400811) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 2. -/
theorem ep_Q2_020_partial_02_0128_valid :
    mulPoly ep_Q2_020_coefficient_02_0128
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0129 : Poly :=
[
  term ((328061264556365376 : Rat) / 28298395017400811) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 129 for generator 2. -/
def ep_Q2_020_partial_02_0129 : Poly :=
[
  term ((656122529112730752 : Rat) / 28298395017400811) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((656122529112730752 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-328061264556365376 : Rat) / 28298395017400811) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-328061264556365376 : Rat) / 28298395017400811) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 2. -/
theorem ep_Q2_020_partial_02_0129_valid :
    mulPoly ep_Q2_020_coefficient_02_0129
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0130 : Poly :=
[
  term ((-22239498191917428 : Rat) / 28298395017400811) [(12, 1), (16, 1)]
]

/-- Partial product 130 for generator 2. -/
def ep_Q2_020_partial_02_0130 : Poly :=
[
  term ((-44478996383834856 : Rat) / 28298395017400811) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-44478996383834856 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((22239498191917428 : Rat) / 28298395017400811) [(10, 2), (12, 1), (16, 1)],
  term ((22239498191917428 : Rat) / 28298395017400811) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 2. -/
theorem ep_Q2_020_partial_02_0130_valid :
    mulPoly ep_Q2_020_coefficient_02_0130
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0131 : Poly :=
[
  term ((-105232789463895000 : Rat) / 28298395017400811) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 2. -/
def ep_Q2_020_partial_02_0131 : Poly :=
[
  term ((-210465578927790000 : Rat) / 28298395017400811) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-210465578927790000 : Rat) / 28298395017400811) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((105232789463895000 : Rat) / 28298395017400811) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((105232789463895000 : Rat) / 28298395017400811) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 2. -/
theorem ep_Q2_020_partial_02_0131_valid :
    mulPoly ep_Q2_020_coefficient_02_0131
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0132 : Poly :=
[
  term ((-1879759862338997463 : Rat) / 113193580069603244) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 2. -/
def ep_Q2_020_partial_02_0132 : Poly :=
[
  term ((-1879759862338997463 : Rat) / 56596790034801622) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1879759862338997463 : Rat) / 56596790034801622) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1879759862338997463 : Rat) / 113193580069603244) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((1879759862338997463 : Rat) / 113193580069603244) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 2. -/
theorem ep_Q2_020_partial_02_0132_valid :
    mulPoly ep_Q2_020_coefficient_02_0132
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0133 : Poly :=
[
  term ((4650292361433888 : Rat) / 1230365000756557) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 133 for generator 2. -/
def ep_Q2_020_partial_02_0133 : Poly :=
[
  term ((9300584722867776 : Rat) / 1230365000756557) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((9300584722867776 : Rat) / 1230365000756557) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4650292361433888 : Rat) / 1230365000756557) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4650292361433888 : Rat) / 1230365000756557) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 2. -/
theorem ep_Q2_020_partial_02_0133_valid :
    mulPoly ep_Q2_020_coefficient_02_0133
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0134 : Poly :=
[
  term ((-521767858300788421 : Rat) / 56596790034801622) [(14, 1), (16, 1)]
]

/-- Partial product 134 for generator 2. -/
def ep_Q2_020_partial_02_0134 : Poly :=
[
  term ((-521767858300788421 : Rat) / 28298395017400811) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((-521767858300788421 : Rat) / 28298395017400811) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((521767858300788421 : Rat) / 56596790034801622) [(10, 2), (14, 1), (16, 1)],
  term ((521767858300788421 : Rat) / 56596790034801622) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 2. -/
theorem ep_Q2_020_partial_02_0134_valid :
    mulPoly ep_Q2_020_coefficient_02_0134
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0135 : Poly :=
[
  term ((-893983428053964423 : Rat) / 56596790034801622) [(15, 2), (16, 1)]
]

/-- Partial product 135 for generator 2. -/
def ep_Q2_020_partial_02_0135 : Poly :=
[
  term ((-893983428053964423 : Rat) / 28298395017400811) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-893983428053964423 : Rat) / 28298395017400811) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((893983428053964423 : Rat) / 56596790034801622) [(10, 2), (15, 2), (16, 1)],
  term ((893983428053964423 : Rat) / 56596790034801622) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 2. -/
theorem ep_Q2_020_partial_02_0135_valid :
    mulPoly ep_Q2_020_coefficient_02_0135
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 2. -/
def ep_Q2_020_coefficient_02_0136 : Poly :=
[
  term ((16990792537917459 : Rat) / 2760819026087884) [(16, 1)]
]

/-- Partial product 136 for generator 2. -/
def ep_Q2_020_partial_02_0136 : Poly :=
[
  term ((16990792537917459 : Rat) / 1380409513043942) [(0, 1), (10, 1), (16, 1)],
  term ((16990792537917459 : Rat) / 1380409513043942) [(1, 1), (11, 1), (16, 1)],
  term ((-16990792537917459 : Rat) / 2760819026087884) [(10, 2), (16, 1)],
  term ((-16990792537917459 : Rat) / 2760819026087884) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 2. -/
theorem ep_Q2_020_partial_02_0136_valid :
    mulPoly ep_Q2_020_coefficient_02_0136
        ep_Q2_020_generator_02_0100_0136 =
      ep_Q2_020_partial_02_0136 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_02_0100_0136 : List Poly :=
[
  ep_Q2_020_partial_02_0100,
  ep_Q2_020_partial_02_0101,
  ep_Q2_020_partial_02_0102,
  ep_Q2_020_partial_02_0103,
  ep_Q2_020_partial_02_0104,
  ep_Q2_020_partial_02_0105,
  ep_Q2_020_partial_02_0106,
  ep_Q2_020_partial_02_0107,
  ep_Q2_020_partial_02_0108,
  ep_Q2_020_partial_02_0109,
  ep_Q2_020_partial_02_0110,
  ep_Q2_020_partial_02_0111,
  ep_Q2_020_partial_02_0112,
  ep_Q2_020_partial_02_0113,
  ep_Q2_020_partial_02_0114,
  ep_Q2_020_partial_02_0115,
  ep_Q2_020_partial_02_0116,
  ep_Q2_020_partial_02_0117,
  ep_Q2_020_partial_02_0118,
  ep_Q2_020_partial_02_0119,
  ep_Q2_020_partial_02_0120,
  ep_Q2_020_partial_02_0121,
  ep_Q2_020_partial_02_0122,
  ep_Q2_020_partial_02_0123,
  ep_Q2_020_partial_02_0124,
  ep_Q2_020_partial_02_0125,
  ep_Q2_020_partial_02_0126,
  ep_Q2_020_partial_02_0127,
  ep_Q2_020_partial_02_0128,
  ep_Q2_020_partial_02_0129,
  ep_Q2_020_partial_02_0130,
  ep_Q2_020_partial_02_0131,
  ep_Q2_020_partial_02_0132,
  ep_Q2_020_partial_02_0133,
  ep_Q2_020_partial_02_0134,
  ep_Q2_020_partial_02_0135,
  ep_Q2_020_partial_02_0136
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_02_0100_0136 : Poly :=
[
  term ((8585155128801024 : Rat) / 1230365000756557) [(0, 1), (7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-841305643623457356 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 3), (10, 1), (16, 1)],
  term ((-93540257301240000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(0, 1), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((11519912911158510 : Rat) / 975806724737959) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((136430680325481648 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((174782458760818482 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(0, 1), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-383786804270990016 : Rat) / 28298395017400811) [(0, 1), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(0, 1), (7, 2), (10, 1), (16, 1)],
  term ((81959716293252056 : Rat) / 975806724737959) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((2256325073537110911 : Rat) / 56596790034801622) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((695858523694589259 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-62360171534160000 : Rat) / 28298395017400811) [(0, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2861718376267008 : Rat) / 1230365000756557) [(0, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((369680892548897450 : Rat) / 28298395017400811) [(0, 1), (9, 2), (10, 1), (16, 1)],
  term ((-328061264556365376 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((126019513308615000 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((31180085767080000 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-413864531057025384 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3696386236011552 : Rat) / 1230365000756557) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-194235388187971034 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1430859188133504 : Rat) / 1230365000756557) [(0, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1178820753326696556 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((656122529112730752 : Rat) / 28298395017400811) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-44478996383834856 : Rat) / 28298395017400811) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-210465578927790000 : Rat) / 28298395017400811) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1879759862338997463 : Rat) / 56596790034801622) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((9300584722867776 : Rat) / 1230365000756557) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-521767858300788421 : Rat) / 28298395017400811) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((-893983428053964423 : Rat) / 28298395017400811) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((16990792537917459 : Rat) / 1380409513043942) [(0, 1), (10, 1), (16, 1)],
  term ((8585155128801024 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-841305643623457356 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((136430680325481648 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((174782458760818482 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-93540257301240000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((11519912911158510 : Rat) / 975806724737959) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((-383786804270990016 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2256325073537110911 : Rat) / 56596790034801622) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((695858523694589259 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((81959716293252056 : Rat) / 975806724737959) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-62360171534160000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2861718376267008 : Rat) / 1230365000756557) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((369680892548897450 : Rat) / 28298395017400811) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((656122529112730752 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-44478996383834856 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-210465578927790000 : Rat) / 28298395017400811) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1879759862338997463 : Rat) / 56596790034801622) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9300584722867776 : Rat) / 1230365000756557) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-521767858300788421 : Rat) / 28298395017400811) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-893983428053964423 : Rat) / 28298395017400811) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((16990792537917459 : Rat) / 1380409513043942) [(1, 1), (11, 1), (16, 1)],
  term ((-328061264556365376 : Rat) / 28298395017400811) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((126019513308615000 : Rat) / 28298395017400811) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((31180085767080000 : Rat) / 28298395017400811) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-413864531057025384 : Rat) / 28298395017400811) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-3696386236011552 : Rat) / 1230365000756557) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-194235388187971034 : Rat) / 28298395017400811) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((1430859188133504 : Rat) / 1230365000756557) [(1, 1), (11, 2), (15, 3), (16, 1)],
  term ((-1178820753326696556 : Rat) / 28298395017400811) [(1, 1), (11, 3), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(7, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((420652821811728678 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((420652821811728678 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 1), (9, 3), (10, 2), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 1), (9, 3), (11, 2), (16, 1)],
  term ((46770128650620000 : Rat) / 28298395017400811) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2146288782200256 : Rat) / 1230365000756557) [(7, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-5759956455579255 : Rat) / 975806724737959) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((19487553604425000 : Rat) / 28298395017400811) [(7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-68215340162740824 : Rat) / 28298395017400811) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((894286992583440 : Rat) / 1230365000756557) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-87391229380409241 : Rat) / 28298395017400811) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((19487553604425000 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-68215340162740824 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((894286992583440 : Rat) / 1230365000756557) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-87391229380409241 : Rat) / 28298395017400811) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((46770128650620000 : Rat) / 28298395017400811) [(7, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((2146288782200256 : Rat) / 1230365000756557) [(7, 1), (11, 3), (15, 2), (16, 1)],
  term ((-5759956455579255 : Rat) / 975806724737959) [(7, 1), (11, 3), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 3), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 2), (10, 2), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 2), (11, 2), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(7, 2), (10, 2), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(7, 2), (11, 2), (16, 1)],
  term ((-40979858146626028 : Rat) / 975806724737959) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2256325073537110911 : Rat) / 113193580069603244) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-695858523694589259 : Rat) / 56596790034801622) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2256325073537110911 : Rat) / 113193580069603244) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-695858523694589259 : Rat) / 56596790034801622) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-40979858146626028 : Rat) / 975806724737959) [(9, 1), (11, 3), (16, 1)],
  term ((31180085767080000 : Rat) / 28298395017400811) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((1430859188133504 : Rat) / 1230365000756557) [(9, 2), (10, 2), (15, 2), (16, 1)],
  term ((-184840446274448725 : Rat) / 28298395017400811) [(9, 2), (10, 2), (16, 1)],
  term ((31180085767080000 : Rat) / 28298395017400811) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1430859188133504 : Rat) / 1230365000756557) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-184840446274448725 : Rat) / 28298395017400811) [(9, 2), (11, 2), (16, 1)],
  term ((164030632278182688 : Rat) / 28298395017400811) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-63009756654307500 : Rat) / 28298395017400811) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((206932265528512692 : Rat) / 28298395017400811) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((1848193118005776 : Rat) / 1230365000756557) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((97117694093985517 : Rat) / 28298395017400811) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((589410376663348278 : Rat) / 28298395017400811) [(10, 2), (11, 2), (16, 1)],
  term ((-328061264556365376 : Rat) / 28298395017400811) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((22239498191917428 : Rat) / 28298395017400811) [(10, 2), (12, 1), (16, 1)],
  term ((105232789463895000 : Rat) / 28298395017400811) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1879759862338997463 : Rat) / 113193580069603244) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4650292361433888 : Rat) / 1230365000756557) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((521767858300788421 : Rat) / 56596790034801622) [(10, 2), (14, 1), (16, 1)],
  term ((893983428053964423 : Rat) / 56596790034801622) [(10, 2), (15, 2), (16, 1)],
  term ((-16990792537917459 : Rat) / 2760819026087884) [(10, 2), (16, 1)],
  term ((-328061264556365376 : Rat) / 28298395017400811) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((22239498191917428 : Rat) / 28298395017400811) [(11, 2), (12, 1), (16, 1)],
  term ((105232789463895000 : Rat) / 28298395017400811) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1879759862338997463 : Rat) / 113193580069603244) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4650292361433888 : Rat) / 1230365000756557) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((521767858300788421 : Rat) / 56596790034801622) [(11, 2), (14, 1), (16, 1)],
  term ((893983428053964423 : Rat) / 56596790034801622) [(11, 2), (15, 2), (16, 1)],
  term ((-16990792537917459 : Rat) / 2760819026087884) [(11, 2), (16, 1)],
  term ((164030632278182688 : Rat) / 28298395017400811) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-63009756654307500 : Rat) / 28298395017400811) [(11, 3), (13, 1), (14, 1), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((206932265528512692 : Rat) / 28298395017400811) [(11, 3), (13, 1), (16, 1)],
  term ((1848193118005776 : Rat) / 1230365000756557) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((97117694093985517 : Rat) / 28298395017400811) [(11, 3), (15, 1), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(11, 3), (15, 3), (16, 1)],
  term ((589410376663348278 : Rat) / 28298395017400811) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 100 through 136. -/
theorem ep_Q2_020_block_02_0100_0136_valid :
    checkProductSumEq ep_Q2_020_partials_02_0100_0136
      ep_Q2_020_block_02_0100_0136 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
