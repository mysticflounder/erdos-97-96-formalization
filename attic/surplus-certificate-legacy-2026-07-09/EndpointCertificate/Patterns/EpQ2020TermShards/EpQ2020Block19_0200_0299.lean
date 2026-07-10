/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 19:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 19 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_19_0200_0299 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(8, 1)],
  term (2 : Rat) [(8, 1), (10, 1)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0200 : Poly :=
[
  term ((208394265464969358 : Rat) / 28298395017400811) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 200 for generator 19. -/
def ep_Q2_020_partial_19_0200 : Poly :=
[
  term ((416788530929938716 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-208394265464969358 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-208394265464969358 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((208394265464969358 : Rat) / 28298395017400811) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((416788530929938716 : Rat) / 28298395017400811) [(5, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-416788530929938716 : Rat) / 28298395017400811) [(5, 1), (8, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 19. -/
theorem ep_Q2_020_partial_19_0200_valid :
    mulPoly ep_Q2_020_coefficient_19_0200
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0201 : Poly :=
[
  term ((11544042601737360 : Rat) / 28298395017400811) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 19. -/
def ep_Q2_020_partial_19_0201 : Poly :=
[
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((11544042601737360 : Rat) / 28298395017400811) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (8, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23088085203474720 : Rat) / 28298395017400811) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 19. -/
theorem ep_Q2_020_partial_19_0201_valid :
    mulPoly ep_Q2_020_coefficient_19_0201
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0202 : Poly :=
[
  term ((-34190586269031564 : Rat) / 28298395017400811) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 19. -/
def ep_Q2_020_partial_19_0202 : Poly :=
[
  term ((-68381172538063128 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((34190586269031564 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((34190586269031564 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-34190586269031564 : Rat) / 28298395017400811) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-68381172538063128 : Rat) / 28298395017400811) [(5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((68381172538063128 : Rat) / 28298395017400811) [(5, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 19. -/
theorem ep_Q2_020_partial_19_0202_valid :
    mulPoly ep_Q2_020_coefficient_19_0202
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0203 : Poly :=
[
  term ((-11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 19. -/
def ep_Q2_020_partial_19_0203 : Poly :=
[
  term ((-23088085203474720 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-23088085203474720 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 19. -/
theorem ep_Q2_020_partial_19_0203_valid :
    mulPoly ep_Q2_020_coefficient_19_0203
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0204 : Poly :=
[
  term ((6349223430955548 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 204 for generator 19. -/
def ep_Q2_020_partial_19_0204 : Poly :=
[
  term ((12698446861911096 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-12698446861911096 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-6349223430955548 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (11, 2), (16, 1)],
  term ((6349223430955548 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-6349223430955548 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 4), (16, 1)],
  term ((12698446861911096 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 19. -/
theorem ep_Q2_020_partial_19_0204_valid :
    mulPoly ep_Q2_020_coefficient_19_0204
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0205 : Poly :=
[
  term ((50263359485872308 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 205 for generator 19. -/
def ep_Q2_020_partial_19_0205 : Poly :=
[
  term ((100526718971744616 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-100526718971744616 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-50263359485872308 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((-50263359485872308 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((50263359485872308 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((100526718971744616 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 19. -/
theorem ep_Q2_020_partial_19_0205_valid :
    mulPoly ep_Q2_020_coefficient_19_0205
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0206 : Poly :=
[
  term ((2886010650434340 : Rat) / 28298395017400811) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 206 for generator 19. -/
def ep_Q2_020_partial_19_0206 : Poly :=
[
  term ((5772021300868680 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-5772021300868680 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-2886010650434340 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-2886010650434340 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((2886010650434340 : Rat) / 28298395017400811) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 19. -/
theorem ep_Q2_020_partial_19_0206_valid :
    mulPoly ep_Q2_020_coefficient_19_0206
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0207 : Poly :=
[
  term ((11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 207 for generator 19. -/
def ep_Q2_020_partial_19_0207 : Poly :=
[
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-23088085203474720 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 19. -/
theorem ep_Q2_020_partial_19_0207_valid :
    mulPoly ep_Q2_020_coefficient_19_0207
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0208 : Poly :=
[
  term ((-149632253949206067 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 208 for generator 19. -/
def ep_Q2_020_partial_19_0208 : Poly :=
[
  term ((-299264507898412134 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((299264507898412134 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (16, 1)],
  term ((149632253949206067 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((149632253949206067 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-149632253949206067 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)],
  term ((-299264507898412134 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 19. -/
theorem ep_Q2_020_partial_19_0208_valid :
    mulPoly ep_Q2_020_coefficient_19_0208
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0209 : Poly :=
[
  term ((42872617929735000 : Rat) / 28298395017400811) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 19. -/
def ep_Q2_020_partial_19_0209 : Poly :=
[
  term ((85745235859470000 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(5, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 19. -/
theorem ep_Q2_020_partial_19_0209_valid :
    mulPoly ep_Q2_020_coefficient_19_0209
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0210 : Poly :=
[
  term ((-36940936325559552 : Rat) / 28298395017400811) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 210 for generator 19. -/
def ep_Q2_020_partial_19_0210 : Poly :=
[
  term ((-73881872651119104 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((73881872651119104 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-73881872651119104 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((36940936325559552 : Rat) / 28298395017400811) [(5, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-36940936325559552 : Rat) / 28298395017400811) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((36940936325559552 : Rat) / 28298395017400811) [(5, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 19. -/
theorem ep_Q2_020_partial_19_0210_valid :
    mulPoly ep_Q2_020_coefficient_19_0210
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0211 : Poly :=
[
  term ((206551647188674893 : Rat) / 2460730001513114) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 211 for generator 19. -/
def ep_Q2_020_partial_19_0211 : Poly :=
[
  term ((206551647188674893 : Rat) / 1230365000756557) [(5, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-206551647188674893 : Rat) / 1230365000756557) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((206551647188674893 : Rat) / 1230365000756557) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-206551647188674893 : Rat) / 2460730001513114) [(5, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((206551647188674893 : Rat) / 2460730001513114) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-206551647188674893 : Rat) / 2460730001513114) [(5, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 19. -/
theorem ep_Q2_020_partial_19_0211_valid :
    mulPoly ep_Q2_020_coefficient_19_0211
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0212 : Poly :=
[
  term ((-39484173466821204 : Rat) / 28298395017400811) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 212 for generator 19. -/
def ep_Q2_020_partial_19_0212 : Poly :=
[
  term ((-78968346933642408 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((78968346933642408 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-78968346933642408 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((39484173466821204 : Rat) / 28298395017400811) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-39484173466821204 : Rat) / 28298395017400811) [(5, 1), (11, 1), (16, 1)],
  term ((39484173466821204 : Rat) / 28298395017400811) [(5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 19. -/
theorem ep_Q2_020_partial_19_0212_valid :
    mulPoly ep_Q2_020_coefficient_19_0212
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0213 : Poly :=
[
  term ((-141813916754117112 : Rat) / 28298395017400811) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 213 for generator 19. -/
def ep_Q2_020_partial_19_0213 : Poly :=
[
  term ((-283627833508234224 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((283627833508234224 : Rat) / 28298395017400811) [(5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-283627833508234224 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((141813916754117112 : Rat) / 28298395017400811) [(5, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((141813916754117112 : Rat) / 28298395017400811) [(5, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-141813916754117112 : Rat) / 28298395017400811) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 19. -/
theorem ep_Q2_020_partial_19_0213_valid :
    mulPoly ep_Q2_020_coefficient_19_0213
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0214 : Poly :=
[
  term ((210779016795272454 : Rat) / 28298395017400811) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 19. -/
def ep_Q2_020_partial_19_0214 : Poly :=
[
  term ((421558033590544908 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-421558033590544908 : Rat) / 28298395017400811) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((421558033590544908 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-210779016795272454 : Rat) / 28298395017400811) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-210779016795272454 : Rat) / 28298395017400811) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((210779016795272454 : Rat) / 28298395017400811) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 19. -/
theorem ep_Q2_020_partial_19_0214_valid :
    mulPoly ep_Q2_020_coefficient_19_0214
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0215 : Poly :=
[
  term ((-315668509972248912 : Rat) / 28298395017400811) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 215 for generator 19. -/
def ep_Q2_020_partial_19_0215 : Poly :=
[
  term ((-631337019944497824 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((631337019944497824 : Rat) / 28298395017400811) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-631337019944497824 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((315668509972248912 : Rat) / 28298395017400811) [(5, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((315668509972248912 : Rat) / 28298395017400811) [(5, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-315668509972248912 : Rat) / 28298395017400811) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 19. -/
theorem ep_Q2_020_partial_19_0215_valid :
    mulPoly ep_Q2_020_coefficient_19_0215
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0216 : Poly :=
[
  term ((65841745357674021 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 216 for generator 19. -/
def ep_Q2_020_partial_19_0216 : Poly :=
[
  term ((131683490715348042 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-131683490715348042 : Rat) / 28298395017400811) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((131683490715348042 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-65841745357674021 : Rat) / 28298395017400811) [(5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-65841745357674021 : Rat) / 28298395017400811) [(5, 1), (11, 2), (13, 1), (16, 1)],
  term ((65841745357674021 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 19. -/
theorem ep_Q2_020_partial_19_0216_valid :
    mulPoly ep_Q2_020_coefficient_19_0216
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0217 : Poly :=
[
  term ((1077423571319900271 : Rat) / 28298395017400811) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 217 for generator 19. -/
def ep_Q2_020_partial_19_0217 : Poly :=
[
  term ((2154847142639800542 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2154847142639800542 : Rat) / 28298395017400811) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((2154847142639800542 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1077423571319900271 : Rat) / 28298395017400811) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1077423571319900271 : Rat) / 28298395017400811) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((1077423571319900271 : Rat) / 28298395017400811) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 19. -/
theorem ep_Q2_020_partial_19_0217_valid :
    mulPoly ep_Q2_020_coefficient_19_0217
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0218 : Poly :=
[
  term ((-1036518492158452389 : Rat) / 56596790034801622) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 19. -/
def ep_Q2_020_partial_19_0218 : Poly :=
[
  term ((-1036518492158452389 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1036518492158452389 : Rat) / 28298395017400811) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1036518492158452389 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1036518492158452389 : Rat) / 56596790034801622) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((1036518492158452389 : Rat) / 56596790034801622) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1036518492158452389 : Rat) / 56596790034801622) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 19. -/
theorem ep_Q2_020_partial_19_0218_valid :
    mulPoly ep_Q2_020_coefficient_19_0218
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0219 : Poly :=
[
  term ((-27841750711266834 : Rat) / 28298395017400811) [(5, 2), (6, 1), (16, 1)]
]

/-- Partial product 219 for generator 19. -/
def ep_Q2_020_partial_19_0219 : Poly :=
[
  term ((-55683501422533668 : Rat) / 28298395017400811) [(5, 2), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((55683501422533668 : Rat) / 28298395017400811) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((-55683501422533668 : Rat) / 28298395017400811) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((27841750711266834 : Rat) / 28298395017400811) [(5, 2), (6, 1), (10, 2), (16, 1)],
  term ((27841750711266834 : Rat) / 28298395017400811) [(5, 2), (6, 1), (11, 2), (16, 1)],
  term ((-27841750711266834 : Rat) / 28298395017400811) [(5, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 19. -/
theorem ep_Q2_020_partial_19_0219_valid :
    mulPoly ep_Q2_020_coefficient_19_0219
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0220 : Poly :=
[
  term ((17383894199559216 : Rat) / 28298395017400811) [(5, 2), (8, 1), (16, 1)]
]

/-- Partial product 220 for generator 19. -/
def ep_Q2_020_partial_19_0220 : Poly :=
[
  term ((34767788399118432 : Rat) / 28298395017400811) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(5, 2), (8, 1), (10, 2), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(5, 2), (8, 1), (11, 2), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(5, 2), (8, 1), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(5, 2), (8, 2), (10, 1), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(5, 2), (8, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 19. -/
theorem ep_Q2_020_partial_19_0220_valid :
    mulPoly ep_Q2_020_coefficient_19_0220
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0221 : Poly :=
[
  term ((-38095340585733288 : Rat) / 28298395017400811) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 19. -/
def ep_Q2_020_partial_19_0221 : Poly :=
[
  term ((-76190681171466576 : Rat) / 28298395017400811) [(5, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 19. -/
theorem ep_Q2_020_partial_19_0221_valid :
    mulPoly ep_Q2_020_coefficient_19_0221
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0222 : Poly :=
[
  term ((-119270047693891278 : Rat) / 28298395017400811) [(5, 2), (12, 1), (16, 1)]
]

/-- Partial product 222 for generator 19. -/
def ep_Q2_020_partial_19_0222 : Poly :=
[
  term ((-238540095387782556 : Rat) / 28298395017400811) [(5, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((238540095387782556 : Rat) / 28298395017400811) [(5, 2), (8, 1), (12, 1), (16, 1)],
  term ((-238540095387782556 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((119270047693891278 : Rat) / 28298395017400811) [(5, 2), (10, 2), (12, 1), (16, 1)],
  term ((119270047693891278 : Rat) / 28298395017400811) [(5, 2), (11, 2), (12, 1), (16, 1)],
  term ((-119270047693891278 : Rat) / 28298395017400811) [(5, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 19. -/
theorem ep_Q2_020_partial_19_0222_valid :
    mulPoly ep_Q2_020_coefficient_19_0222
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0223 : Poly :=
[
  term ((6515313013204749 : Rat) / 975806724737959) [(5, 2), (14, 1), (16, 1)]
]

/-- Partial product 223 for generator 19. -/
def ep_Q2_020_partial_19_0223 : Poly :=
[
  term ((13030626026409498 : Rat) / 975806724737959) [(5, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-13030626026409498 : Rat) / 975806724737959) [(5, 2), (8, 1), (14, 1), (16, 1)],
  term ((13030626026409498 : Rat) / 975806724737959) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6515313013204749 : Rat) / 975806724737959) [(5, 2), (10, 2), (14, 1), (16, 1)],
  term ((-6515313013204749 : Rat) / 975806724737959) [(5, 2), (11, 2), (14, 1), (16, 1)],
  term ((6515313013204749 : Rat) / 975806724737959) [(5, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 19. -/
theorem ep_Q2_020_partial_19_0223_valid :
    mulPoly ep_Q2_020_coefficient_19_0223
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0224 : Poly :=
[
  term ((1067391402425928 : Rat) / 975806724737959) [(5, 2), (16, 1)]
]

/-- Partial product 224 for generator 19. -/
def ep_Q2_020_partial_19_0224 : Poly :=
[
  term ((2134782804851856 : Rat) / 975806724737959) [(5, 2), (8, 1), (10, 1), (16, 1)],
  term ((-2134782804851856 : Rat) / 975806724737959) [(5, 2), (8, 1), (16, 1)],
  term ((2134782804851856 : Rat) / 975806724737959) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1067391402425928 : Rat) / 975806724737959) [(5, 2), (10, 2), (16, 1)],
  term ((-1067391402425928 : Rat) / 975806724737959) [(5, 2), (11, 2), (16, 1)],
  term ((1067391402425928 : Rat) / 975806724737959) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 19. -/
theorem ep_Q2_020_partial_19_0224_valid :
    mulPoly ep_Q2_020_coefficient_19_0224
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0225 : Poly :=
[
  term ((143920051601621256 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 225 for generator 19. -/
def ep_Q2_020_partial_19_0225 : Poly :=
[
  term ((287840103203242512 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 19. -/
theorem ep_Q2_020_partial_19_0225_valid :
    mulPoly ep_Q2_020_coefficient_19_0225
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0226 : Poly :=
[
  term ((-71947863681484011 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 226 for generator 19. -/
def ep_Q2_020_partial_19_0226 : Poly :=
[
  term ((-143895727362968022 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((143895727362968022 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((71947863681484011 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((71947863681484011 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-71947863681484011 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-143895727362968022 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 19. -/
theorem ep_Q2_020_partial_19_0226_valid :
    mulPoly ep_Q2_020_coefficient_19_0226
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0227 : Poly :=
[
  term ((-92757344954711262 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 227 for generator 19. -/
def ep_Q2_020_partial_19_0227 : Poly :=
[
  term ((-185514689909422524 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((185514689909422524 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-185514689909422524 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((92757344954711262 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-92757344954711262 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((92757344954711262 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 19. -/
theorem ep_Q2_020_partial_19_0227_valid :
    mulPoly ep_Q2_020_coefficient_19_0227
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0228 : Poly :=
[
  term ((4133278580342544 : Rat) / 28298395017400811) [(6, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 228 for generator 19. -/
def ep_Q2_020_partial_19_0228 : Poly :=
[
  term ((8266557160685088 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-8266557160685088 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((8266557160685088 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4133278580342544 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-4133278580342544 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((4133278580342544 : Rat) / 28298395017400811) [(6, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 19. -/
theorem ep_Q2_020_partial_19_0228_valid :
    mulPoly ep_Q2_020_coefficient_19_0228
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0229 : Poly :=
[
  term ((-91151448698435904 : Rat) / 28298395017400811) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 229 for generator 19. -/
def ep_Q2_020_partial_19_0229 : Poly :=
[
  term ((-182302897396871808 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((182302897396871808 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-182302897396871808 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((91151448698435904 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((91151448698435904 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-91151448698435904 : Rat) / 28298395017400811) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 19. -/
theorem ep_Q2_020_partial_19_0229_valid :
    mulPoly ep_Q2_020_coefficient_19_0229
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0230 : Poly :=
[
  term ((47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 230 for generator 19. -/
def ep_Q2_020_partial_19_0230 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(6, 1), (7, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(6, 1), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 1), (11, 3), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 19. -/
theorem ep_Q2_020_partial_19_0230_valid :
    mulPoly ep_Q2_020_coefficient_19_0230
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0231 : Poly :=
[
  term ((47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 2), (16, 1)]
]

/-- Partial product 231 for generator 19. -/
def ep_Q2_020_partial_19_0231 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(6, 1), (7, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(6, 1), (7, 2), (8, 1), (9, 2), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 2), (10, 2), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 2), (11, 2), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 2), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 19. -/
theorem ep_Q2_020_partial_19_0231_valid :
    mulPoly ep_Q2_020_coefficient_19_0231
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0232 : Poly :=
[
  term ((-2632689895662963 : Rat) / 1230365000756557) [(6, 1), (7, 2), (16, 1)]
]

/-- Partial product 232 for generator 19. -/
def ep_Q2_020_partial_19_0232 : Poly :=
[
  term ((-5265379791325926 : Rat) / 1230365000756557) [(6, 1), (7, 2), (8, 1), (10, 1), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(6, 1), (7, 2), (8, 1), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(6, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(6, 1), (7, 2), (10, 2), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(6, 1), (7, 2), (11, 2), (16, 1)],
  term ((-2632689895662963 : Rat) / 1230365000756557) [(6, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 19. -/
theorem ep_Q2_020_partial_19_0232_valid :
    mulPoly ep_Q2_020_coefficient_19_0232
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0233 : Poly :=
[
  term ((-36692854888581252 : Rat) / 28298395017400811) [(6, 1), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 233 for generator 19. -/
def ep_Q2_020_partial_19_0233 : Poly :=
[
  term ((-73385709777162504 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 2), (12, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(6, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(6, 1), (8, 2), (10, 1), (12, 1), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(6, 1), (8, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 19. -/
theorem ep_Q2_020_partial_19_0233_valid :
    mulPoly ep_Q2_020_coefficient_19_0233
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0234 : Poly :=
[
  term ((-80501080603047384 : Rat) / 28298395017400811) [(6, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 234 for generator 19. -/
def ep_Q2_020_partial_19_0234 : Poly :=
[
  term ((-161002161206094768 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((80501080603047384 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 2), (14, 1), (16, 1)],
  term ((80501080603047384 : Rat) / 28298395017400811) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-80501080603047384 : Rat) / 28298395017400811) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-161002161206094768 : Rat) / 28298395017400811) [(6, 1), (8, 2), (10, 1), (14, 1), (16, 1)],
  term ((161002161206094768 : Rat) / 28298395017400811) [(6, 1), (8, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 19. -/
theorem ep_Q2_020_partial_19_0234_valid :
    mulPoly ep_Q2_020_coefficient_19_0234
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0235 : Poly :=
[
  term ((87189897328781490 : Rat) / 28298395017400811) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 235 for generator 19. -/
def ep_Q2_020_partial_19_0235 : Poly :=
[
  term ((174379794657562980 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-87189897328781490 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 2), (16, 1)],
  term ((-87189897328781490 : Rat) / 28298395017400811) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((87189897328781490 : Rat) / 28298395017400811) [(6, 1), (8, 1), (16, 1)],
  term ((174379794657562980 : Rat) / 28298395017400811) [(6, 1), (8, 2), (10, 1), (16, 1)],
  term ((-174379794657562980 : Rat) / 28298395017400811) [(6, 1), (8, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 19. -/
theorem ep_Q2_020_partial_19_0235_valid :
    mulPoly ep_Q2_020_coefficient_19_0235
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0236 : Poly :=
[
  term ((63040682717534934 : Rat) / 28298395017400811) [(6, 1), (8, 2), (16, 1)]
]

/-- Partial product 236 for generator 19. -/
def ep_Q2_020_partial_19_0236 : Poly :=
[
  term ((126081365435069868 : Rat) / 28298395017400811) [(6, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-63040682717534934 : Rat) / 28298395017400811) [(6, 1), (8, 2), (10, 2), (16, 1)],
  term ((-63040682717534934 : Rat) / 28298395017400811) [(6, 1), (8, 2), (11, 2), (16, 1)],
  term ((63040682717534934 : Rat) / 28298395017400811) [(6, 1), (8, 2), (16, 1)],
  term ((126081365435069868 : Rat) / 28298395017400811) [(6, 1), (8, 3), (10, 1), (16, 1)],
  term ((-126081365435069868 : Rat) / 28298395017400811) [(6, 1), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 19. -/
theorem ep_Q2_020_partial_19_0236_valid :
    mulPoly ep_Q2_020_coefficient_19_0236
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0237 : Poly :=
[
  term ((-325889370339413471 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 237 for generator 19. -/
def ep_Q2_020_partial_19_0237 : Poly :=
[
  term ((-651778740678826942 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((651778740678826942 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((325889370339413471 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-325889370339413471 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((325889370339413471 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 3), (16, 1)],
  term ((-651778740678826942 : Rat) / 28298395017400811) [(6, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 19. -/
theorem ep_Q2_020_partial_19_0237_valid :
    mulPoly ep_Q2_020_coefficient_19_0237
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0238 : Poly :=
[
  term ((3247925600737500 : Rat) / 28298395017400811) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 238 for generator 19. -/
def ep_Q2_020_partial_19_0238 : Poly :=
[
  term ((6495851201475000 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((6495851201475000 : Rat) / 28298395017400811) [(6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 19. -/
theorem ep_Q2_020_partial_19_0238_valid :
    mulPoly ep_Q2_020_coefficient_19_0238
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0239 : Poly :=
[
  term ((-75371576317876971 : Rat) / 28298395017400811) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 239 for generator 19. -/
def ep_Q2_020_partial_19_0239 : Poly :=
[
  term ((-150743152635753942 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((150743152635753942 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((75371576317876971 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((75371576317876971 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-75371576317876971 : Rat) / 28298395017400811) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-150743152635753942 : Rat) / 28298395017400811) [(6, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 19. -/
theorem ep_Q2_020_partial_19_0239_valid :
    mulPoly ep_Q2_020_coefficient_19_0239
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0240 : Poly :=
[
  term ((149047832097240 : Rat) / 1230365000756557) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 240 for generator 19. -/
def ep_Q2_020_partial_19_0240 : Poly :=
[
  term ((298095664194480 : Rat) / 1230365000756557) [(6, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(6, 1), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(6, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((298095664194480 : Rat) / 1230365000756557) [(6, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 19. -/
theorem ep_Q2_020_partial_19_0240_valid :
    mulPoly ep_Q2_020_coefficient_19_0240
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0241 : Poly :=
[
  term ((422681897724850617 : Rat) / 28298395017400811) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 19. -/
def ep_Q2_020_partial_19_0241 : Poly :=
[
  term ((845363795449701234 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-845363795449701234 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-422681897724850617 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-422681897724850617 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((422681897724850617 : Rat) / 28298395017400811) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((845363795449701234 : Rat) / 28298395017400811) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 19. -/
theorem ep_Q2_020_partial_19_0241_valid :
    mulPoly ep_Q2_020_coefficient_19_0241
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0242 : Poly :=
[
  term ((4797566462729128 : Rat) / 28298395017400811) [(6, 1), (9, 2), (16, 1)]
]

/-- Partial product 242 for generator 19. -/
def ep_Q2_020_partial_19_0242 : Poly :=
[
  term ((9595132925458256 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-9595132925458256 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 2), (16, 1)],
  term ((-4797566462729128 : Rat) / 28298395017400811) [(6, 1), (9, 2), (10, 2), (16, 1)],
  term ((-4797566462729128 : Rat) / 28298395017400811) [(6, 1), (9, 2), (11, 2), (16, 1)],
  term ((4797566462729128 : Rat) / 28298395017400811) [(6, 1), (9, 2), (16, 1)],
  term ((9595132925458256 : Rat) / 28298395017400811) [(6, 1), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 19. -/
theorem ep_Q2_020_partial_19_0242_valid :
    mulPoly ep_Q2_020_coefficient_19_0242
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0243 : Poly :=
[
  term ((-39624692328997500 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 243 for generator 19. -/
def ep_Q2_020_partial_19_0243 : Poly :=
[
  term ((-79249384657995000 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((79249384657995000 : Rat) / 28298395017400811) [(6, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-79249384657995000 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((39624692328997500 : Rat) / 28298395017400811) [(6, 1), (10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-39624692328997500 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((39624692328997500 : Rat) / 28298395017400811) [(6, 1), (11, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 19. -/
theorem ep_Q2_020_partial_19_0243_valid :
    mulPoly ep_Q2_020_coefficient_19_0243
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0244 : Poly :=
[
  term ((-23729559266150721 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 244 for generator 19. -/
def ep_Q2_020_partial_19_0244 : Poly :=
[
  term ((-47459118532301442 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((47459118532301442 : Rat) / 28298395017400811) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-47459118532301442 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((23729559266150721 : Rat) / 28298395017400811) [(6, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-23729559266150721 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((23729559266150721 : Rat) / 28298395017400811) [(6, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 19. -/
theorem ep_Q2_020_partial_19_0244_valid :
    mulPoly ep_Q2_020_coefficient_19_0244
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0245 : Poly :=
[
  term ((-1818383551586328 : Rat) / 1230365000756557) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 245 for generator 19. -/
def ep_Q2_020_partial_19_0245 : Poly :=
[
  term ((-3636767103172656 : Rat) / 1230365000756557) [(6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3636767103172656 : Rat) / 1230365000756557) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3636767103172656 : Rat) / 1230365000756557) [(6, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((1818383551586328 : Rat) / 1230365000756557) [(6, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1818383551586328 : Rat) / 1230365000756557) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1818383551586328 : Rat) / 1230365000756557) [(6, 1), (11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 19. -/
theorem ep_Q2_020_partial_19_0245_valid :
    mulPoly ep_Q2_020_coefficient_19_0245
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0246 : Poly :=
[
  term ((64262360235802440 : Rat) / 28298395017400811) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 246 for generator 19. -/
def ep_Q2_020_partial_19_0246 : Poly :=
[
  term ((128524720471604880 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-128524720471604880 : Rat) / 28298395017400811) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((128524720471604880 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-64262360235802440 : Rat) / 28298395017400811) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((64262360235802440 : Rat) / 28298395017400811) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-64262360235802440 : Rat) / 28298395017400811) [(6, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 19. -/
theorem ep_Q2_020_partial_19_0246_valid :
    mulPoly ep_Q2_020_coefficient_19_0246
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0247 : Poly :=
[
  term ((-294705188331674139 : Rat) / 28298395017400811) [(6, 1), (11, 2), (16, 1)]
]

/-- Partial product 247 for generator 19. -/
def ep_Q2_020_partial_19_0247 : Poly :=
[
  term ((-589410376663348278 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((589410376663348278 : Rat) / 28298395017400811) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-589410376663348278 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 3), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(6, 1), (10, 2), (11, 2), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(6, 1), (11, 2), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(6, 1), (11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 19. -/
theorem ep_Q2_020_partial_19_0247_valid :
    mulPoly ep_Q2_020_coefficient_19_0247
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0248 : Poly :=
[
  term ((106456339953788847 : Rat) / 56596790034801622) [(6, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 248 for generator 19. -/
def ep_Q2_020_partial_19_0248 : Poly :=
[
  term ((106456339953788847 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-106456339953788847 : Rat) / 28298395017400811) [(6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((106456339953788847 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-106456339953788847 : Rat) / 56596790034801622) [(6, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-106456339953788847 : Rat) / 56596790034801622) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((106456339953788847 : Rat) / 56596790034801622) [(6, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 19. -/
theorem ep_Q2_020_partial_19_0248_valid :
    mulPoly ep_Q2_020_coefficient_19_0248
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0249 : Poly :=
[
  term ((-1377759526780848 : Rat) / 28298395017400811) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 249 for generator 19. -/
def ep_Q2_020_partial_19_0249 : Poly :=
[
  term ((-2755519053561696 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((2755519053561696 : Rat) / 28298395017400811) [(6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-2755519053561696 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((1377759526780848 : Rat) / 28298395017400811) [(6, 1), (10, 2), (12, 1), (16, 1)],
  term ((1377759526780848 : Rat) / 28298395017400811) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-1377759526780848 : Rat) / 28298395017400811) [(6, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 19. -/
theorem ep_Q2_020_partial_19_0249_valid :
    mulPoly ep_Q2_020_coefficient_19_0249
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0250 : Poly :=
[
  term ((16858079663439921 : Rat) / 4921460003026228) [(6, 1), (12, 2), (16, 1)]
]

/-- Partial product 250 for generator 19. -/
def ep_Q2_020_partial_19_0250 : Poly :=
[
  term ((16858079663439921 : Rat) / 2460730001513114) [(6, 1), (8, 1), (10, 1), (12, 2), (16, 1)],
  term ((-16858079663439921 : Rat) / 2460730001513114) [(6, 1), (8, 1), (12, 2), (16, 1)],
  term ((16858079663439921 : Rat) / 2460730001513114) [(6, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-16858079663439921 : Rat) / 4921460003026228) [(6, 1), (10, 2), (12, 2), (16, 1)],
  term ((-16858079663439921 : Rat) / 4921460003026228) [(6, 1), (11, 2), (12, 2), (16, 1)],
  term ((16858079663439921 : Rat) / 4921460003026228) [(6, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 19. -/
theorem ep_Q2_020_partial_19_0250_valid :
    mulPoly ep_Q2_020_coefficient_19_0250
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0251 : Poly :=
[
  term ((38975107208850000 : Rat) / 28298395017400811) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 251 for generator 19. -/
def ep_Q2_020_partial_19_0251 : Poly :=
[
  term ((77950214417700000 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(6, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 19. -/
theorem ep_Q2_020_partial_19_0251_valid :
    mulPoly ep_Q2_020_coefficient_19_0251
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0252 : Poly :=
[
  term ((-521744843161865973 : Rat) / 56596790034801622) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 252 for generator 19. -/
def ep_Q2_020_partial_19_0252 : Poly :=
[
  term ((-521744843161865973 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((521744843161865973 : Rat) / 28298395017400811) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-521744843161865973 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((521744843161865973 : Rat) / 56596790034801622) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((521744843161865973 : Rat) / 56596790034801622) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-521744843161865973 : Rat) / 56596790034801622) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 19. -/
theorem ep_Q2_020_partial_19_0252_valid :
    mulPoly ep_Q2_020_coefficient_19_0252
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0253 : Poly :=
[
  term ((16858079663439921 : Rat) / 4921460003026228) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 253 for generator 19. -/
def ep_Q2_020_partial_19_0253 : Poly :=
[
  term ((16858079663439921 : Rat) / 2460730001513114) [(6, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-16858079663439921 : Rat) / 2460730001513114) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((16858079663439921 : Rat) / 2460730001513114) [(6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-16858079663439921 : Rat) / 4921460003026228) [(6, 1), (10, 2), (13, 2), (16, 1)],
  term ((-16858079663439921 : Rat) / 4921460003026228) [(6, 1), (11, 2), (13, 2), (16, 1)],
  term ((16858079663439921 : Rat) / 4921460003026228) [(6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 19. -/
theorem ep_Q2_020_partial_19_0253_valid :
    mulPoly ep_Q2_020_coefficient_19_0253
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0254 : Poly :=
[
  term ((1788573985166880 : Rat) / 1230365000756557) [(6, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 254 for generator 19. -/
def ep_Q2_020_partial_19_0254 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(6, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(6, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(6, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(6, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(6, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 19. -/
theorem ep_Q2_020_partial_19_0254_valid :
    mulPoly ep_Q2_020_coefficient_19_0254
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0255 : Poly :=
[
  term ((-725503386173525265 : Rat) / 56596790034801622) [(6, 1), (14, 1), (16, 1)]
]

/-- Partial product 255 for generator 19. -/
def ep_Q2_020_partial_19_0255 : Poly :=
[
  term ((-725503386173525265 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((725503386173525265 : Rat) / 28298395017400811) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-725503386173525265 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((725503386173525265 : Rat) / 56596790034801622) [(6, 1), (10, 2), (14, 1), (16, 1)],
  term ((725503386173525265 : Rat) / 56596790034801622) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-725503386173525265 : Rat) / 56596790034801622) [(6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 19. -/
theorem ep_Q2_020_partial_19_0255_valid :
    mulPoly ep_Q2_020_coefficient_19_0255
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0256 : Poly :=
[
  term ((89428699258344 : Rat) / 1230365000756557) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 256 for generator 19. -/
def ep_Q2_020_partial_19_0256 : Poly :=
[
  term ((178857398516688 : Rat) / 1230365000756557) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-178857398516688 : Rat) / 1230365000756557) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((178857398516688 : Rat) / 1230365000756557) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-89428699258344 : Rat) / 1230365000756557) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((-89428699258344 : Rat) / 1230365000756557) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((89428699258344 : Rat) / 1230365000756557) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 19. -/
theorem ep_Q2_020_partial_19_0256_valid :
    mulPoly ep_Q2_020_coefficient_19_0256
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0257 : Poly :=
[
  term ((178885159245548187 : Rat) / 56596790034801622) [(6, 1), (16, 1)]
]

/-- Partial product 257 for generator 19. -/
def ep_Q2_020_partial_19_0257 : Poly :=
[
  term ((178885159245548187 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-178885159245548187 : Rat) / 28298395017400811) [(6, 1), (8, 1), (16, 1)],
  term ((178885159245548187 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-178885159245548187 : Rat) / 56596790034801622) [(6, 1), (10, 2), (16, 1)],
  term ((-178885159245548187 : Rat) / 56596790034801622) [(6, 1), (11, 2), (16, 1)],
  term ((178885159245548187 : Rat) / 56596790034801622) [(6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 19. -/
theorem ep_Q2_020_partial_19_0257_valid :
    mulPoly ep_Q2_020_coefficient_19_0257
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0258 : Poly :=
[
  term ((58172316539820453 : Rat) / 28298395017400811) [(6, 2), (8, 1), (16, 1)]
]

/-- Partial product 258 for generator 19. -/
def ep_Q2_020_partial_19_0258 : Poly :=
[
  term ((116344633079640906 : Rat) / 28298395017400811) [(6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-58172316539820453 : Rat) / 28298395017400811) [(6, 2), (8, 1), (10, 2), (16, 1)],
  term ((-58172316539820453 : Rat) / 28298395017400811) [(6, 2), (8, 1), (11, 2), (16, 1)],
  term ((58172316539820453 : Rat) / 28298395017400811) [(6, 2), (8, 1), (16, 1)],
  term ((116344633079640906 : Rat) / 28298395017400811) [(6, 2), (8, 2), (10, 1), (16, 1)],
  term ((-116344633079640906 : Rat) / 28298395017400811) [(6, 2), (8, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 19. -/
theorem ep_Q2_020_partial_19_0258_valid :
    mulPoly ep_Q2_020_coefficient_19_0258
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0259 : Poly :=
[
  term ((-64093811187977388 : Rat) / 28298395017400811) [(6, 2), (14, 1), (16, 1)]
]

/-- Partial product 259 for generator 19. -/
def ep_Q2_020_partial_19_0259 : Poly :=
[
  term ((-128187622375954776 : Rat) / 28298395017400811) [(6, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((128187622375954776 : Rat) / 28298395017400811) [(6, 2), (8, 1), (14, 1), (16, 1)],
  term ((-128187622375954776 : Rat) / 28298395017400811) [(6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((64093811187977388 : Rat) / 28298395017400811) [(6, 2), (10, 2), (14, 1), (16, 1)],
  term ((64093811187977388 : Rat) / 28298395017400811) [(6, 2), (11, 2), (14, 1), (16, 1)],
  term ((-64093811187977388 : Rat) / 28298395017400811) [(6, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 19. -/
theorem ep_Q2_020_partial_19_0259_valid :
    mulPoly ep_Q2_020_coefficient_19_0259
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0260 : Poly :=
[
  term ((-53359463471039703 : Rat) / 28298395017400811) [(6, 2), (16, 1)]
]

/-- Partial product 260 for generator 19. -/
def ep_Q2_020_partial_19_0260 : Poly :=
[
  term ((-106718926942079406 : Rat) / 28298395017400811) [(6, 2), (8, 1), (10, 1), (16, 1)],
  term ((106718926942079406 : Rat) / 28298395017400811) [(6, 2), (8, 1), (16, 1)],
  term ((-106718926942079406 : Rat) / 28298395017400811) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((53359463471039703 : Rat) / 28298395017400811) [(6, 2), (10, 2), (16, 1)],
  term ((53359463471039703 : Rat) / 28298395017400811) [(6, 2), (11, 2), (16, 1)],
  term ((-53359463471039703 : Rat) / 28298395017400811) [(6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 19. -/
theorem ep_Q2_020_partial_19_0260_valid :
    mulPoly ep_Q2_020_coefficient_19_0260
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0261 : Poly :=
[
  term ((-2632689895662963 : Rat) / 1230365000756557) [(6, 3), (16, 1)]
]

/-- Partial product 261 for generator 19. -/
def ep_Q2_020_partial_19_0261 : Poly :=
[
  term ((-5265379791325926 : Rat) / 1230365000756557) [(6, 3), (8, 1), (10, 1), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(6, 3), (8, 1), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(6, 3), (9, 1), (11, 1), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(6, 3), (10, 2), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(6, 3), (11, 2), (16, 1)],
  term ((-2632689895662963 : Rat) / 1230365000756557) [(6, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 19. -/
theorem ep_Q2_020_partial_19_0261_valid :
    mulPoly ep_Q2_020_coefficient_19_0261
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0262 : Poly :=
[
  term ((82229791521742682 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 262 for generator 19. -/
def ep_Q2_020_partial_19_0262 : Poly :=
[
  term ((-82229791521742682 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-82229791521742682 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((82229791521742682 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term ((164459583043485364 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((164459583043485364 : Rat) / 28298395017400811) [(7, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((-164459583043485364 : Rat) / 28298395017400811) [(7, 1), (8, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 19. -/
theorem ep_Q2_020_partial_19_0262_valid :
    mulPoly ep_Q2_020_coefficient_19_0262
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0263 : Poly :=
[
  term ((346036758576058095 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 263 for generator 19. -/
def ep_Q2_020_partial_19_0263 : Poly :=
[
  term ((692073517152116190 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-346036758576058095 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((346036758576058095 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-346036758576058095 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 3), (16, 1)],
  term ((692073517152116190 : Rat) / 28298395017400811) [(7, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((-692073517152116190 : Rat) / 28298395017400811) [(7, 1), (8, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 19. -/
theorem ep_Q2_020_partial_19_0263_valid :
    mulPoly ep_Q2_020_coefficient_19_0263
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0264 : Poly :=
[
  term ((-3247925600737500 : Rat) / 28298395017400811) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 264 for generator 19. -/
def ep_Q2_020_partial_19_0264 : Poly :=
[
  term ((-6495851201475000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(7, 1), (8, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((6495851201475000 : Rat) / 28298395017400811) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 19. -/
theorem ep_Q2_020_partial_19_0264_valid :
    mulPoly ep_Q2_020_coefficient_19_0264
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0265 : Poly :=
[
  term ((83367134740189263 : Rat) / 28298395017400811) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 265 for generator 19. -/
def ep_Q2_020_partial_19_0265 : Poly :=
[
  term ((166734269480378526 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-83367134740189263 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-83367134740189263 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((83367134740189263 : Rat) / 28298395017400811) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((166734269480378526 : Rat) / 28298395017400811) [(7, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-166734269480378526 : Rat) / 28298395017400811) [(7, 1), (8, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 19. -/
theorem ep_Q2_020_partial_19_0265_valid :
    mulPoly ep_Q2_020_coefficient_19_0265
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0266 : Poly :=
[
  term ((-149047832097240 : Rat) / 1230365000756557) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 266 for generator 19. -/
def ep_Q2_020_partial_19_0266 : Poly :=
[
  term ((-298095664194480 : Rat) / 1230365000756557) [(7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(7, 1), (8, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((298095664194480 : Rat) / 1230365000756557) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 19. -/
theorem ep_Q2_020_partial_19_0266_valid :
    mulPoly ep_Q2_020_coefficient_19_0266
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0267 : Poly :=
[
  term ((-408289198336663233 : Rat) / 28298395017400811) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 267 for generator 19. -/
def ep_Q2_020_partial_19_0267 : Poly :=
[
  term ((-816578396673326466 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((408289198336663233 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((408289198336663233 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-408289198336663233 : Rat) / 28298395017400811) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-816578396673326466 : Rat) / 28298395017400811) [(7, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((816578396673326466 : Rat) / 28298395017400811) [(7, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 19. -/
theorem ep_Q2_020_partial_19_0267_valid :
    mulPoly ep_Q2_020_coefficient_19_0267
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0268 : Poly :=
[
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 268 for generator 19. -/
def ep_Q2_020_partial_19_0268 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 19. -/
theorem ep_Q2_020_partial_19_0268_valid :
    mulPoly ep_Q2_020_coefficient_19_0268
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0269 : Poly :=
[
  term ((-44688413310893544 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 269 for generator 19. -/
def ep_Q2_020_partial_19_0269 : Poly :=
[
  term ((-89376826621787088 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((89376826621787088 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((44688413310893544 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((44688413310893544 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-44688413310893544 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-89376826621787088 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 19. -/
theorem ep_Q2_020_partial_19_0269_valid :
    mulPoly ep_Q2_020_coefficient_19_0269
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0270 : Poly :=
[
  term ((-214827156325919148 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 270 for generator 19. -/
def ep_Q2_020_partial_19_0270 : Poly :=
[
  term ((-429654312651838296 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((429654312651838296 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((214827156325919148 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((214827156325919148 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-214827156325919148 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-429654312651838296 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 19. -/
theorem ep_Q2_020_partial_19_0270_valid :
    mulPoly ep_Q2_020_coefficient_19_0270
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0271 : Poly :=
[
  term ((77787316160589655 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 271 for generator 19. -/
def ep_Q2_020_partial_19_0271 : Poly :=
[
  term ((155574632321179310 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-155574632321179310 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-77787316160589655 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-77787316160589655 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((77787316160589655 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)],
  term ((155574632321179310 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 19. -/
theorem ep_Q2_020_partial_19_0271_valid :
    mulPoly ep_Q2_020_coefficient_19_0271
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0272 : Poly :=
[
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 272 for generator 19. -/
def ep_Q2_020_partial_19_0272 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 3), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 1), (9, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 19. -/
theorem ep_Q2_020_partial_19_0272_valid :
    mulPoly ep_Q2_020_coefficient_19_0272
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0273 : Poly :=
[
  term ((-7995558422312292 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 273 for generator 19. -/
def ep_Q2_020_partial_19_0273 : Poly :=
[
  term ((-15991116844624584 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((15991116844624584 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-15991116844624584 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((7995558422312292 : Rat) / 28298395017400811) [(7, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((-7995558422312292 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((7995558422312292 : Rat) / 28298395017400811) [(7, 1), (11, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 19. -/
theorem ep_Q2_020_partial_19_0273_valid :
    mulPoly ep_Q2_020_coefficient_19_0273
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0274 : Poly :=
[
  term ((-38975107208850000 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 274 for generator 19. -/
def ep_Q2_020_partial_19_0274 : Poly :=
[
  term ((-77950214417700000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 19. -/
theorem ep_Q2_020_partial_19_0274_valid :
    mulPoly ep_Q2_020_coefficient_19_0274
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0275 : Poly :=
[
  term ((-71960025800810628 : Rat) / 28298395017400811) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 275 for generator 19. -/
def ep_Q2_020_partial_19_0275 : Poly :=
[
  term ((-143920051601621256 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(7, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(7, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 19. -/
theorem ep_Q2_020_partial_19_0275_valid :
    mulPoly ep_Q2_020_coefficient_19_0275
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0276 : Poly :=
[
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 276 for generator 19. -/
def ep_Q2_020_partial_19_0276 : Poly :=
[
  term ((-3577147970333760 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 19. -/
theorem ep_Q2_020_partial_19_0276_valid :
    mulPoly ep_Q2_020_coefficient_19_0276
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0277 : Poly :=
[
  term ((281209288717462467 : Rat) / 28298395017400811) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 277 for generator 19. -/
def ep_Q2_020_partial_19_0277 : Poly :=
[
  term ((562418577434924934 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-562418577434924934 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((562418577434924934 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-281209288717462467 : Rat) / 28298395017400811) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((281209288717462467 : Rat) / 28298395017400811) [(7, 1), (11, 1), (16, 1)],
  term ((-281209288717462467 : Rat) / 28298395017400811) [(7, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 19. -/
theorem ep_Q2_020_partial_19_0277_valid :
    mulPoly ep_Q2_020_coefficient_19_0277
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0278 : Poly :=
[
  term ((21436308964867500 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 278 for generator 19. -/
def ep_Q2_020_partial_19_0278 : Poly :=
[
  term ((42872617929735000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(7, 1), (10, 2), (11, 2), (13, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(7, 1), (11, 4), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 19. -/
theorem ep_Q2_020_partial_19_0278_valid :
    mulPoly ep_Q2_020_coefficient_19_0278
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0279 : Poly :=
[
  term ((983715691841784 : Rat) / 1230365000756557) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 279 for generator 19. -/
def ep_Q2_020_partial_19_0279 : Poly :=
[
  term ((1967431383683568 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-983715691841784 : Rat) / 1230365000756557) [(7, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term ((983715691841784 : Rat) / 1230365000756557) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-983715691841784 : Rat) / 1230365000756557) [(7, 1), (11, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 19. -/
theorem ep_Q2_020_partial_19_0279_valid :
    mulPoly ep_Q2_020_coefficient_19_0279
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0280 : Poly :=
[
  term ((5240039368750596 : Rat) / 28298395017400811) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 280 for generator 19. -/
def ep_Q2_020_partial_19_0280 : Poly :=
[
  term ((10480078737501192 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10480078737501192 : Rat) / 28298395017400811) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((10480078737501192 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5240039368750596 : Rat) / 28298395017400811) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-5240039368750596 : Rat) / 28298395017400811) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((5240039368750596 : Rat) / 28298395017400811) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 19. -/
theorem ep_Q2_020_partial_19_0280_valid :
    mulPoly ep_Q2_020_coefficient_19_0280
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0281 : Poly :=
[
  term ((309185344749150564 : Rat) / 28298395017400811) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 281 for generator 19. -/
def ep_Q2_020_partial_19_0281 : Poly :=
[
  term ((618370689498301128 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-618370689498301128 : Rat) / 28298395017400811) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((618370689498301128 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-309185344749150564 : Rat) / 28298395017400811) [(7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-309185344749150564 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((309185344749150564 : Rat) / 28298395017400811) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 19. -/
theorem ep_Q2_020_partial_19_0281_valid :
    mulPoly ep_Q2_020_coefficient_19_0281
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0282 : Poly :=
[
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 282 for generator 19. -/
def ep_Q2_020_partial_19_0282 : Poly :=
[
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 19. -/
theorem ep_Q2_020_partial_19_0282_valid :
    mulPoly ep_Q2_020_coefficient_19_0282
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0283 : Poly :=
[
  term ((-937659117523593225 : Rat) / 56596790034801622) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 283 for generator 19. -/
def ep_Q2_020_partial_19_0283 : Poly :=
[
  term ((-937659117523593225 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((937659117523593225 : Rat) / 28298395017400811) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-937659117523593225 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((937659117523593225 : Rat) / 56596790034801622) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((937659117523593225 : Rat) / 56596790034801622) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-937659117523593225 : Rat) / 56596790034801622) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 19. -/
theorem ep_Q2_020_partial_19_0283_valid :
    mulPoly ep_Q2_020_coefficient_19_0283
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0284 : Poly :=
[
  term ((4903655225258724 : Rat) / 975806724737959) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 284 for generator 19. -/
def ep_Q2_020_partial_19_0284 : Poly :=
[
  term ((9807310450517448 : Rat) / 975806724737959) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9807310450517448 : Rat) / 975806724737959) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((9807310450517448 : Rat) / 975806724737959) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4903655225258724 : Rat) / 975806724737959) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4903655225258724 : Rat) / 975806724737959) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((4903655225258724 : Rat) / 975806724737959) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 19. -/
theorem ep_Q2_020_partial_19_0284_valid :
    mulPoly ep_Q2_020_coefficient_19_0284
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0285 : Poly :=
[
  term ((-168766020608216082 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 285 for generator 19. -/
def ep_Q2_020_partial_19_0285 : Poly :=
[
  term ((-337532041216432164 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((337532041216432164 : Rat) / 28298395017400811) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-337532041216432164 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((168766020608216082 : Rat) / 28298395017400811) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((168766020608216082 : Rat) / 28298395017400811) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-168766020608216082 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 19. -/
theorem ep_Q2_020_partial_19_0285_valid :
    mulPoly ep_Q2_020_coefficient_19_0285
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0286 : Poly :=
[
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 286 for generator 19. -/
def ep_Q2_020_partial_19_0286 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (10, 2), (15, 3), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (11, 2), (15, 3), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 19. -/
theorem ep_Q2_020_partial_19_0286_valid :
    mulPoly ep_Q2_020_coefficient_19_0286
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0287 : Poly :=
[
  term ((58160154420493836 : Rat) / 28298395017400811) [(7, 2), (8, 1), (16, 1)]
]

/-- Partial product 287 for generator 19. -/
def ep_Q2_020_partial_19_0287 : Poly :=
[
  term ((116320308840987672 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-58160154420493836 : Rat) / 28298395017400811) [(7, 2), (8, 1), (10, 2), (16, 1)],
  term ((-58160154420493836 : Rat) / 28298395017400811) [(7, 2), (8, 1), (11, 2), (16, 1)],
  term ((58160154420493836 : Rat) / 28298395017400811) [(7, 2), (8, 1), (16, 1)],
  term ((116320308840987672 : Rat) / 28298395017400811) [(7, 2), (8, 2), (10, 1), (16, 1)],
  term ((-116320308840987672 : Rat) / 28298395017400811) [(7, 2), (8, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 19. -/
theorem ep_Q2_020_partial_19_0287_valid :
    mulPoly ep_Q2_020_coefficient_19_0287
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0288 : Poly :=
[
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 288 for generator 19. -/
def ep_Q2_020_partial_19_0288 : Poly :=
[
  term ((-383786804270990016 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 3), (16, 1)],
  term ((-383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 19. -/
theorem ep_Q2_020_partial_19_0288_valid :
    mulPoly ep_Q2_020_coefficient_19_0288
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0289 : Poly :=
[
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 289 for generator 19. -/
def ep_Q2_020_partial_19_0289 : Poly :=
[
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-383786804270990016 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 19. -/
theorem ep_Q2_020_partial_19_0289_valid :
    mulPoly ep_Q2_020_coefficient_19_0289
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0290 : Poly :=
[
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 2), (16, 1)]
]

/-- Partial product 290 for generator 19. -/
def ep_Q2_020_partial_19_0290 : Poly :=
[
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 2), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 2), (10, 2), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 2), (11, 2), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 2), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 2), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 19. -/
theorem ep_Q2_020_partial_19_0290_valid :
    mulPoly ep_Q2_020_coefficient_19_0290
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0291 : Poly :=
[
  term ((-4133278580342544 : Rat) / 28298395017400811) [(7, 2), (12, 1), (16, 1)]
]

/-- Partial product 291 for generator 19. -/
def ep_Q2_020_partial_19_0291 : Poly :=
[
  term ((-8266557160685088 : Rat) / 28298395017400811) [(7, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((8266557160685088 : Rat) / 28298395017400811) [(7, 2), (8, 1), (12, 1), (16, 1)],
  term ((-8266557160685088 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((4133278580342544 : Rat) / 28298395017400811) [(7, 2), (10, 2), (12, 1), (16, 1)],
  term ((4133278580342544 : Rat) / 28298395017400811) [(7, 2), (11, 2), (12, 1), (16, 1)],
  term ((-4133278580342544 : Rat) / 28298395017400811) [(7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 19. -/
theorem ep_Q2_020_partial_19_0291_valid :
    mulPoly ep_Q2_020_coefficient_19_0291
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0292 : Poly :=
[
  term ((-20915713023415236 : Rat) / 28298395017400811) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 292 for generator 19. -/
def ep_Q2_020_partial_19_0292 : Poly :=
[
  term ((-41831426046830472 : Rat) / 28298395017400811) [(7, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(7, 2), (8, 1), (14, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(7, 2), (10, 2), (14, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(7, 2), (11, 2), (14, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 19. -/
theorem ep_Q2_020_partial_19_0292_valid :
    mulPoly ep_Q2_020_coefficient_19_0292
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0293 : Poly :=
[
  term ((154927646870654028 : Rat) / 28298395017400811) [(7, 2), (16, 1)]
]

/-- Partial product 293 for generator 19. -/
def ep_Q2_020_partial_19_0293 : Poly :=
[
  term ((309855293741308056 : Rat) / 28298395017400811) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((-309855293741308056 : Rat) / 28298395017400811) [(7, 2), (8, 1), (16, 1)],
  term ((309855293741308056 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-154927646870654028 : Rat) / 28298395017400811) [(7, 2), (10, 2), (16, 1)],
  term ((-154927646870654028 : Rat) / 28298395017400811) [(7, 2), (11, 2), (16, 1)],
  term ((154927646870654028 : Rat) / 28298395017400811) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 19. -/
theorem ep_Q2_020_partial_19_0293_valid :
    mulPoly ep_Q2_020_coefficient_19_0293
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0294 : Poly :=
[
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 294 for generator 19. -/
def ep_Q2_020_partial_19_0294 : Poly :=
[
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 3), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 3), (8, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 19. -/
theorem ep_Q2_020_partial_19_0294_valid :
    mulPoly ep_Q2_020_coefficient_19_0294
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0295 : Poly :=
[
  term ((-23986675266936876 : Rat) / 28298395017400811) [(7, 3), (9, 1), (16, 1)]
]

/-- Partial product 295 for generator 19. -/
def ep_Q2_020_partial_19_0295 : Poly :=
[
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 1), (16, 1)],
  term ((23986675266936876 : Rat) / 28298395017400811) [(7, 3), (9, 1), (10, 2), (16, 1)],
  term ((23986675266936876 : Rat) / 28298395017400811) [(7, 3), (9, 1), (11, 2), (16, 1)],
  term ((-23986675266936876 : Rat) / 28298395017400811) [(7, 3), (9, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 3), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 19. -/
theorem ep_Q2_020_partial_19_0295_valid :
    mulPoly ep_Q2_020_coefficient_19_0295
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0296 : Poly :=
[
  term ((14290872643245000 : Rat) / 28298395017400811) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 296 for generator 19. -/
def ep_Q2_020_partial_19_0296 : Poly :=
[
  term ((28581745286490000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-14290872643245000 : Rat) / 28298395017400811) [(8, 1), (10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((14290872643245000 : Rat) / 28298395017400811) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14290872643245000 : Rat) / 28298395017400811) [(8, 1), (11, 3), (13, 1), (14, 1), (16, 1)],
  term ((28581745286490000 : Rat) / 28298395017400811) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-28581745286490000 : Rat) / 28298395017400811) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 19. -/
theorem ep_Q2_020_partial_19_0296_valid :
    mulPoly ep_Q2_020_coefficient_19_0296
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0297 : Poly :=
[
  term ((-1948755360442500 : Rat) / 975806724737959) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 297 for generator 19. -/
def ep_Q2_020_partial_19_0297 : Poly :=
[
  term ((-3897510720885000 : Rat) / 975806724737959) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((1948755360442500 : Rat) / 975806724737959) [(8, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1948755360442500 : Rat) / 975806724737959) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1948755360442500 : Rat) / 975806724737959) [(8, 1), (11, 3), (13, 1), (16, 1)],
  term ((-3897510720885000 : Rat) / 975806724737959) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3897510720885000 : Rat) / 975806724737959) [(8, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 19. -/
theorem ep_Q2_020_partial_19_0297_valid :
    mulPoly ep_Q2_020_coefficient_19_0297
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0298 : Poly :=
[
  term ((655810461227856 : Rat) / 1230365000756557) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 298 for generator 19. -/
def ep_Q2_020_partial_19_0298 : Poly :=
[
  term ((1311620922455712 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-655810461227856 : Rat) / 1230365000756557) [(8, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((655810461227856 : Rat) / 1230365000756557) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-655810461227856 : Rat) / 1230365000756557) [(8, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((1311620922455712 : Rat) / 1230365000756557) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1311620922455712 : Rat) / 1230365000756557) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 19. -/
theorem ep_Q2_020_partial_19_0298_valid :
    mulPoly ep_Q2_020_coefficient_19_0298
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0299 : Poly :=
[
  term ((-4400051354968116081 : Rat) / 56596790034801622) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 299 for generator 19. -/
def ep_Q2_020_partial_19_0299 : Poly :=
[
  term ((-4400051354968116081 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((4400051354968116081 : Rat) / 56596790034801622) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4400051354968116081 : Rat) / 56596790034801622) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4400051354968116081 : Rat) / 56596790034801622) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((-4400051354968116081 : Rat) / 28298395017400811) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4400051354968116081 : Rat) / 28298395017400811) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 19. -/
theorem ep_Q2_020_partial_19_0299_valid :
    mulPoly ep_Q2_020_coefficient_19_0299
        ep_Q2_020_generator_19_0200_0299 =
      ep_Q2_020_partial_19_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_19_0200_0299 : List Poly :=
[
  ep_Q2_020_partial_19_0200,
  ep_Q2_020_partial_19_0201,
  ep_Q2_020_partial_19_0202,
  ep_Q2_020_partial_19_0203,
  ep_Q2_020_partial_19_0204,
  ep_Q2_020_partial_19_0205,
  ep_Q2_020_partial_19_0206,
  ep_Q2_020_partial_19_0207,
  ep_Q2_020_partial_19_0208,
  ep_Q2_020_partial_19_0209,
  ep_Q2_020_partial_19_0210,
  ep_Q2_020_partial_19_0211,
  ep_Q2_020_partial_19_0212,
  ep_Q2_020_partial_19_0213,
  ep_Q2_020_partial_19_0214,
  ep_Q2_020_partial_19_0215,
  ep_Q2_020_partial_19_0216,
  ep_Q2_020_partial_19_0217,
  ep_Q2_020_partial_19_0218,
  ep_Q2_020_partial_19_0219,
  ep_Q2_020_partial_19_0220,
  ep_Q2_020_partial_19_0221,
  ep_Q2_020_partial_19_0222,
  ep_Q2_020_partial_19_0223,
  ep_Q2_020_partial_19_0224,
  ep_Q2_020_partial_19_0225,
  ep_Q2_020_partial_19_0226,
  ep_Q2_020_partial_19_0227,
  ep_Q2_020_partial_19_0228,
  ep_Q2_020_partial_19_0229,
  ep_Q2_020_partial_19_0230,
  ep_Q2_020_partial_19_0231,
  ep_Q2_020_partial_19_0232,
  ep_Q2_020_partial_19_0233,
  ep_Q2_020_partial_19_0234,
  ep_Q2_020_partial_19_0235,
  ep_Q2_020_partial_19_0236,
  ep_Q2_020_partial_19_0237,
  ep_Q2_020_partial_19_0238,
  ep_Q2_020_partial_19_0239,
  ep_Q2_020_partial_19_0240,
  ep_Q2_020_partial_19_0241,
  ep_Q2_020_partial_19_0242,
  ep_Q2_020_partial_19_0243,
  ep_Q2_020_partial_19_0244,
  ep_Q2_020_partial_19_0245,
  ep_Q2_020_partial_19_0246,
  ep_Q2_020_partial_19_0247,
  ep_Q2_020_partial_19_0248,
  ep_Q2_020_partial_19_0249,
  ep_Q2_020_partial_19_0250,
  ep_Q2_020_partial_19_0251,
  ep_Q2_020_partial_19_0252,
  ep_Q2_020_partial_19_0253,
  ep_Q2_020_partial_19_0254,
  ep_Q2_020_partial_19_0255,
  ep_Q2_020_partial_19_0256,
  ep_Q2_020_partial_19_0257,
  ep_Q2_020_partial_19_0258,
  ep_Q2_020_partial_19_0259,
  ep_Q2_020_partial_19_0260,
  ep_Q2_020_partial_19_0261,
  ep_Q2_020_partial_19_0262,
  ep_Q2_020_partial_19_0263,
  ep_Q2_020_partial_19_0264,
  ep_Q2_020_partial_19_0265,
  ep_Q2_020_partial_19_0266,
  ep_Q2_020_partial_19_0267,
  ep_Q2_020_partial_19_0268,
  ep_Q2_020_partial_19_0269,
  ep_Q2_020_partial_19_0270,
  ep_Q2_020_partial_19_0271,
  ep_Q2_020_partial_19_0272,
  ep_Q2_020_partial_19_0273,
  ep_Q2_020_partial_19_0274,
  ep_Q2_020_partial_19_0275,
  ep_Q2_020_partial_19_0276,
  ep_Q2_020_partial_19_0277,
  ep_Q2_020_partial_19_0278,
  ep_Q2_020_partial_19_0279,
  ep_Q2_020_partial_19_0280,
  ep_Q2_020_partial_19_0281,
  ep_Q2_020_partial_19_0282,
  ep_Q2_020_partial_19_0283,
  ep_Q2_020_partial_19_0284,
  ep_Q2_020_partial_19_0285,
  ep_Q2_020_partial_19_0286,
  ep_Q2_020_partial_19_0287,
  ep_Q2_020_partial_19_0288,
  ep_Q2_020_partial_19_0289,
  ep_Q2_020_partial_19_0290,
  ep_Q2_020_partial_19_0291,
  ep_Q2_020_partial_19_0292,
  ep_Q2_020_partial_19_0293,
  ep_Q2_020_partial_19_0294,
  ep_Q2_020_partial_19_0295,
  ep_Q2_020_partial_19_0296,
  ep_Q2_020_partial_19_0297,
  ep_Q2_020_partial_19_0298,
  ep_Q2_020_partial_19_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_19_0200_0299 : Poly :=
[
  term ((-23088085203474720 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((12698446861911096 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((100526718971744616 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-299264507898412134 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((416788530929938716 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45293087334588408 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12698446861911096 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-100526718971744616 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-5772021300868680 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-23088085203474720 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((299264507898412134 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-73881872651119104 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((206551647188674893 : Rat) / 1230365000756557) [(5, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-78968346933642408 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-283627833508234224 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((421558033590544908 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-631337019944497824 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((131683490715348042 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((2154847142639800542 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1036518492158452389 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-208394265464969358 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((34190586269031564 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((73881872651119104 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-206551647188674893 : Rat) / 1230365000756557) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((78968346933642408 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-208394265464969358 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((34190586269031564 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((283627833508234224 : Rat) / 28298395017400811) [(5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-421558033590544908 : Rat) / 28298395017400811) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((631337019944497824 : Rat) / 28298395017400811) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((3335251076070492 : Rat) / 1230365000756557) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-2143303100038063182 : Rat) / 28298395017400811) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((1002327905889420825 : Rat) / 28298395017400811) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((416788530929938716 : Rat) / 28298395017400811) [(5, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (8, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-68381172538063128 : Rat) / 28298395017400811) [(5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-416788530929938716 : Rat) / 28298395017400811) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-23088085203474720 : Rat) / 28298395017400811) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((68381172538063128 : Rat) / 28298395017400811) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6349223430955548 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (11, 2), (16, 1)],
  term ((-50263359485872308 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((-2886010650434340 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((149632253949206067 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-283627833508234224 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((421558033590544908 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-631337019944497824 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((131683490715348042 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((2154847142639800542 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1048062534760189749 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-50263359485872308 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-76767883301553444 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((4739143842737785179 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((77013130446519207 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-6349223430955548 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 4), (16, 1)],
  term ((50263359485872308 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((2886010650434340 : Rat) / 28298395017400811) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-149632253949206067 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)],
  term ((100526718971744616 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-299264507898412134 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-23088085203474720 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((12698446861911096 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 3), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((36940936325559552 : Rat) / 28298395017400811) [(5, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-206551647188674893 : Rat) / 2460730001513114) [(5, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((39484173466821204 : Rat) / 28298395017400811) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((141813916754117112 : Rat) / 28298395017400811) [(5, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-210779016795272454 : Rat) / 28298395017400811) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((315668509972248912 : Rat) / 28298395017400811) [(5, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-65841745357674021 : Rat) / 28298395017400811) [(5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-1077423571319900271 : Rat) / 28298395017400811) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((1036518492158452389 : Rat) / 56596790034801622) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36940936325559552 : Rat) / 28298395017400811) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((206551647188674893 : Rat) / 2460730001513114) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-39484173466821204 : Rat) / 28298395017400811) [(5, 1), (11, 1), (16, 1)],
  term ((141813916754117112 : Rat) / 28298395017400811) [(5, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-210779016795272454 : Rat) / 28298395017400811) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((315668509972248912 : Rat) / 28298395017400811) [(5, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-65841745357674021 : Rat) / 28298395017400811) [(5, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1077423571319900271 : Rat) / 28298395017400811) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((1036518492158452389 : Rat) / 56596790034801622) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(5, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((36940936325559552 : Rat) / 28298395017400811) [(5, 1), (11, 3), (14, 1), (16, 1)],
  term ((-206551647188674893 : Rat) / 2460730001513114) [(5, 1), (11, 3), (15, 2), (16, 1)],
  term ((39484173466821204 : Rat) / 28298395017400811) [(5, 1), (11, 3), (16, 1)],
  term ((-141813916754117112 : Rat) / 28298395017400811) [(5, 1), (12, 1), (13, 1), (16, 1)],
  term ((210779016795272454 : Rat) / 28298395017400811) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-315668509972248912 : Rat) / 28298395017400811) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((65841745357674021 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)],
  term ((1077423571319900271 : Rat) / 28298395017400811) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1036518492158452389 : Rat) / 56596790034801622) [(5, 1), (15, 1), (16, 1)],
  term ((-55683501422533668 : Rat) / 28298395017400811) [(5, 2), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((55683501422533668 : Rat) / 28298395017400811) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((-55683501422533668 : Rat) / 28298395017400811) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((27841750711266834 : Rat) / 28298395017400811) [(5, 2), (6, 1), (10, 2), (16, 1)],
  term ((27841750711266834 : Rat) / 28298395017400811) [(5, 2), (6, 1), (11, 2), (16, 1)],
  term ((-27841750711266834 : Rat) / 28298395017400811) [(5, 2), (6, 1), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(5, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-238540095387782556 : Rat) / 28298395017400811) [(5, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((13030626026409498 : Rat) / 975806724737959) [(5, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((2134782804851856 : Rat) / 975806724737959) [(5, 2), (8, 1), (10, 1), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(5, 2), (8, 1), (10, 2), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(5, 2), (8, 1), (11, 2), (16, 1)],
  term ((238540095387782556 : Rat) / 28298395017400811) [(5, 2), (8, 1), (12, 1), (16, 1)],
  term ((-13030626026409498 : Rat) / 975806724737959) [(5, 2), (8, 1), (14, 1), (16, 1)],
  term ((-44524807141144608 : Rat) / 28298395017400811) [(5, 2), (8, 1), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(5, 2), (8, 2), (10, 1), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(5, 2), (8, 2), (16, 1)],
  term ((-238540095387782556 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((13030626026409498 : Rat) / 975806724737959) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((2134782804851856 : Rat) / 975806724737959) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((119270047693891278 : Rat) / 28298395017400811) [(5, 2), (10, 2), (12, 1), (16, 1)],
  term ((-6515313013204749 : Rat) / 975806724737959) [(5, 2), (10, 2), (14, 1), (16, 1)],
  term ((-1067391402425928 : Rat) / 975806724737959) [(5, 2), (10, 2), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((119270047693891278 : Rat) / 28298395017400811) [(5, 2), (11, 2), (12, 1), (16, 1)],
  term ((-6515313013204749 : Rat) / 975806724737959) [(5, 2), (11, 2), (14, 1), (16, 1)],
  term ((-1067391402425928 : Rat) / 975806724737959) [(5, 2), (11, 2), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 2), (11, 3), (15, 1), (16, 1)],
  term ((-119270047693891278 : Rat) / 28298395017400811) [(5, 2), (12, 1), (16, 1)],
  term ((6515313013204749 : Rat) / 975806724737959) [(5, 2), (14, 1), (16, 1)],
  term ((1067391402425928 : Rat) / 975806724737959) [(5, 2), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-143895727362968022 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((143895727362968022 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-185514689909422524 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((8266557160685088 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-182302897396871808 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((185514689909422524 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-8266557160685088 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((182302897396871808 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((71947863681484011 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((8266557160685088 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-182302897396871808 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-113566826227938513 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-71947863681484011 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-143895727362968022 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((92757344954711262 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-4133278580342544 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((91151448698435904 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-92757344954711262 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-4133278580342544 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((91151448698435904 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((92757344954711262 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 3), (16, 1)],
  term ((4133278580342544 : Rat) / 28298395017400811) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-91151448698435904 : Rat) / 28298395017400811) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(6, 1), (7, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(6, 1), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(6, 1), (7, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(6, 1), (7, 2), (8, 1), (9, 2), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(6, 1), (7, 2), (8, 1), (10, 1), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(6, 1), (7, 2), (8, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-73130384666622546 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 1), (11, 3), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 2), (10, 2), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 2), (11, 2), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 2), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 3), (11, 1), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(6, 1), (7, 2), (10, 2), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(6, 1), (7, 2), (11, 2), (16, 1)],
  term ((-2632689895662963 : Rat) / 1230365000756557) [(6, 1), (7, 2), (16, 1)],
  term ((-651778740678826942 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((6495851201475000 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-150743152635753942 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((298095664194480 : Rat) / 1230365000756557) [(6, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((845363795449701234 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-161002161206094768 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((826158535336389922 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((150743152635753942 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-845363795449701234 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((9595132925458256 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-9595132925458256 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 2), (16, 1)],
  term ((-79249384657995000 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-47459118532301442 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3636767103172656 : Rat) / 1230365000756557) [(6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((128524720471604880 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-589410376663348278 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((106456339953788847 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2755519053561696 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((16858079663439921 : Rat) / 2460730001513114) [(6, 1), (8, 1), (10, 1), (12, 2), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-521744843161865973 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((16858079663439921 : Rat) / 2460730001513114) [(6, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(6, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-725503386173525265 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((178857398516688 : Rat) / 1230365000756557) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((178885159245548187 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 2), (12, 1), (16, 1)],
  term ((80501080603047384 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 2), (14, 1), (16, 1)],
  term ((-87189897328781490 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 2), (16, 1)],
  term ((79249384657995000 : Rat) / 28298395017400811) [(6, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((47459118532301442 : Rat) / 28298395017400811) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((3636767103172656 : Rat) / 1230365000756557) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-128524720471604880 : Rat) / 28298395017400811) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(6, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((80501080603047384 : Rat) / 28298395017400811) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((502220479334566788 : Rat) / 28298395017400811) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-106456339953788847 : Rat) / 28298395017400811) [(6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-33937335835019556 : Rat) / 28298395017400811) [(6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-16858079663439921 : Rat) / 2460730001513114) [(6, 1), (8, 1), (12, 2), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((521744843161865973 : Rat) / 28298395017400811) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16858079663439921 : Rat) / 2460730001513114) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((645002305570477881 : Rat) / 28298395017400811) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-178857398516688 : Rat) / 1230365000756557) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-91695261916766697 : Rat) / 28298395017400811) [(6, 1), (8, 1), (16, 1)],
  term ((126081365435069868 : Rat) / 28298395017400811) [(6, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(6, 1), (8, 2), (10, 1), (12, 1), (16, 1)],
  term ((-161002161206094768 : Rat) / 28298395017400811) [(6, 1), (8, 2), (10, 1), (14, 1), (16, 1)],
  term ((174379794657562980 : Rat) / 28298395017400811) [(6, 1), (8, 2), (10, 1), (16, 1)],
  term ((-63040682717534934 : Rat) / 28298395017400811) [(6, 1), (8, 2), (10, 2), (16, 1)],
  term ((-63040682717534934 : Rat) / 28298395017400811) [(6, 1), (8, 2), (11, 2), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(6, 1), (8, 2), (12, 1), (16, 1)],
  term ((161002161206094768 : Rat) / 28298395017400811) [(6, 1), (8, 2), (14, 1), (16, 1)],
  term ((-111339111940028046 : Rat) / 28298395017400811) [(6, 1), (8, 2), (16, 1)],
  term ((126081365435069868 : Rat) / 28298395017400811) [(6, 1), (8, 3), (10, 1), (16, 1)],
  term ((-126081365435069868 : Rat) / 28298395017400811) [(6, 1), (8, 3), (16, 1)],
  term ((325889370339413471 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((75371576317876971 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(6, 1), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-422681897724850617 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((106456339953788847 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2755519053561696 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((16858079663439921 : Rat) / 2460730001513114) [(6, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-521744843161865973 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((16858079663439921 : Rat) / 2460730001513114) [(6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(6, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-725503386173525265 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((178857398516688 : Rat) / 1230365000756557) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-6391487438863708 : Rat) / 1230365000756557) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-82497310258732500 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((27912457785575529 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-3785814935269896 : Rat) / 1230365000756557) [(6, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-294157177253245737 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-263521006323934807 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 3), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-75371576317876971 : Rat) / 28298395017400811) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((422681897724850617 : Rat) / 28298395017400811) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4797566462729128 : Rat) / 28298395017400811) [(6, 1), (9, 2), (10, 2), (16, 1)],
  term ((6495851201475000 : Rat) / 28298395017400811) [(6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-150743152635753942 : Rat) / 28298395017400811) [(6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((298095664194480 : Rat) / 1230365000756557) [(6, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((845363795449701234 : Rat) / 28298395017400811) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-16014056271745270 : Rat) / 690204756521971) [(6, 1), (9, 2), (11, 2), (16, 1)],
  term ((4797566462729128 : Rat) / 28298395017400811) [(6, 1), (9, 2), (16, 1)],
  term ((9595132925458256 : Rat) / 28298395017400811) [(6, 1), (9, 3), (11, 1), (16, 1)],
  term ((39624692328997500 : Rat) / 28298395017400811) [(6, 1), (10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((23729559266150721 : Rat) / 28298395017400811) [(6, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((1818383551586328 : Rat) / 1230365000756557) [(6, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64262360235802440 : Rat) / 28298395017400811) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(6, 1), (10, 2), (11, 2), (16, 1)],
  term ((-106456339953788847 : Rat) / 56596790034801622) [(6, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((1377759526780848 : Rat) / 28298395017400811) [(6, 1), (10, 2), (12, 1), (16, 1)],
  term ((-16858079663439921 : Rat) / 4921460003026228) [(6, 1), (10, 2), (12, 2), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(6, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((521744843161865973 : Rat) / 56596790034801622) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16858079663439921 : Rat) / 4921460003026228) [(6, 1), (10, 2), (13, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(6, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((725503386173525265 : Rat) / 56596790034801622) [(6, 1), (10, 2), (14, 1), (16, 1)],
  term ((-89428699258344 : Rat) / 1230365000756557) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((-178885159245548187 : Rat) / 56596790034801622) [(6, 1), (10, 2), (16, 1)],
  term ((-39624692328997500 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-23729559266150721 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1818383551586328 : Rat) / 1230365000756557) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((64262360235802440 : Rat) / 28298395017400811) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-106456339953788847 : Rat) / 56596790034801622) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((1377759526780848 : Rat) / 28298395017400811) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-16858079663439921 : Rat) / 4921460003026228) [(6, 1), (11, 2), (12, 2), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((521744843161865973 : Rat) / 56596790034801622) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16858079663439921 : Rat) / 4921460003026228) [(6, 1), (11, 2), (13, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(6, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((725503386173525265 : Rat) / 56596790034801622) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-89428699258344 : Rat) / 1230365000756557) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-768295535908896465 : Rat) / 56596790034801622) [(6, 1), (11, 2), (16, 1)],
  term ((39624692328997500 : Rat) / 28298395017400811) [(6, 1), (11, 3), (13, 1), (14, 1), (16, 1)],
  term ((23729559266150721 : Rat) / 28298395017400811) [(6, 1), (11, 3), (13, 1), (16, 1)],
  term ((1818383551586328 : Rat) / 1230365000756557) [(6, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-64262360235802440 : Rat) / 28298395017400811) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(6, 1), (11, 4), (16, 1)],
  term ((106456339953788847 : Rat) / 56596790034801622) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1377759526780848 : Rat) / 28298395017400811) [(6, 1), (12, 1), (16, 1)],
  term ((16858079663439921 : Rat) / 4921460003026228) [(6, 1), (12, 2), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-521744843161865973 : Rat) / 56596790034801622) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((16858079663439921 : Rat) / 4921460003026228) [(6, 1), (13, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-725503386173525265 : Rat) / 56596790034801622) [(6, 1), (14, 1), (16, 1)],
  term ((89428699258344 : Rat) / 1230365000756557) [(6, 1), (15, 2), (16, 1)],
  term ((178885159245548187 : Rat) / 56596790034801622) [(6, 1), (16, 1)],
  term ((116344633079640906 : Rat) / 28298395017400811) [(6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-128187622375954776 : Rat) / 28298395017400811) [(6, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-106718926942079406 : Rat) / 28298395017400811) [(6, 2), (8, 1), (10, 1), (16, 1)],
  term ((-58172316539820453 : Rat) / 28298395017400811) [(6, 2), (8, 1), (10, 2), (16, 1)],
  term ((-58172316539820453 : Rat) / 28298395017400811) [(6, 2), (8, 1), (11, 2), (16, 1)],
  term ((128187622375954776 : Rat) / 28298395017400811) [(6, 2), (8, 1), (14, 1), (16, 1)],
  term ((164891243481899859 : Rat) / 28298395017400811) [(6, 2), (8, 1), (16, 1)],
  term ((116344633079640906 : Rat) / 28298395017400811) [(6, 2), (8, 2), (10, 1), (16, 1)],
  term ((-116344633079640906 : Rat) / 28298395017400811) [(6, 2), (8, 2), (16, 1)],
  term ((-128187622375954776 : Rat) / 28298395017400811) [(6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-106718926942079406 : Rat) / 28298395017400811) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((64093811187977388 : Rat) / 28298395017400811) [(6, 2), (10, 2), (14, 1), (16, 1)],
  term ((53359463471039703 : Rat) / 28298395017400811) [(6, 2), (10, 2), (16, 1)],
  term ((64093811187977388 : Rat) / 28298395017400811) [(6, 2), (11, 2), (14, 1), (16, 1)],
  term ((53359463471039703 : Rat) / 28298395017400811) [(6, 2), (11, 2), (16, 1)],
  term ((-64093811187977388 : Rat) / 28298395017400811) [(6, 2), (14, 1), (16, 1)],
  term ((-53359463471039703 : Rat) / 28298395017400811) [(6, 2), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(6, 3), (8, 1), (10, 1), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(6, 3), (8, 1), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(6, 3), (9, 1), (11, 1), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(6, 3), (10, 2), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(6, 3), (11, 2), (16, 1)],
  term ((-2632689895662963 : Rat) / 1230365000756557) [(6, 3), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-89376826621787088 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-429654312651838296 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((155574632321179310 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-82229791521742682 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((166734269480378526 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-912525097741073970 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((609843725630373508 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((89376826621787088 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((429654312651838296 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-3188906121714636 : Rat) / 1230365000756557) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((68512881975737860 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-15991116844624584 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((562418577434924934 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((10480078737501192 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((618370689498301128 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-937659117523593225 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((9807310450517448 : Rat) / 975806724737959) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-337532041216432164 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-346036758576058095 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-83367134740189263 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((408289198336663233 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((15991116844624584 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-216381818858866839 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-126239752669924263 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((363038276511941169 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-346036758576058095 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 3), (16, 1)],
  term ((-10480078737501192 : Rat) / 28298395017400811) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-621618615099038628 : Rat) / 28298395017400811) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((1021026252263782488 : Rat) / 28298395017400811) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70757157120231069 : Rat) / 28298395017400811) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((164459583043485364 : Rat) / 28298395017400811) [(7, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((-164459583043485364 : Rat) / 28298395017400811) [(7, 1), (8, 2), (9, 1), (16, 1)],
  term ((692073517152116190 : Rat) / 28298395017400811) [(7, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(7, 1), (8, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((166734269480378526 : Rat) / 28298395017400811) [(7, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(7, 1), (8, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-816578396673326466 : Rat) / 28298395017400811) [(7, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-692073517152116190 : Rat) / 28298395017400811) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((6495851201475000 : Rat) / 28298395017400811) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-166734269480378526 : Rat) / 28298395017400811) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((298095664194480 : Rat) / 1230365000756557) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((816578396673326466 : Rat) / 28298395017400811) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((44688413310893544 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((214827156325919148 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-77787316160589655 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((10480078737501192 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((618370689498301128 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-937659117523593225 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((9807310450517448 : Rat) / 975806724737959) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-289558690682558412 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((28697296466268960 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((75193112114844 : Rat) / 30008902457477) [(7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((484631261274335279 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((-2722428709151688 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-44688413310893544 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-214827156325919148 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((77787316160589655 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((-89376826621787088 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-429654312651838296 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((203547982855053062 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 3), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 1), (9, 3), (11, 2), (16, 1)],
  term ((7995558422312292 : Rat) / 28298395017400811) [(7, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(7, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-281209288717462467 : Rat) / 28298395017400811) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(7, 1), (10, 2), (11, 2), (13, 1), (16, 1)],
  term ((-983715691841784 : Rat) / 1230365000756557) [(7, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term ((-5240039368750596 : Rat) / 28298395017400811) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-309185344749150564 : Rat) / 28298395017400811) [(7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((937659117523593225 : Rat) / 56596790034801622) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-4903655225258724 : Rat) / 975806724737959) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((168766020608216082 : Rat) / 28298395017400811) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (10, 2), (15, 3), (16, 1)],
  term ((-7995558422312292 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((281209288717462467 : Rat) / 28298395017400811) [(7, 1), (11, 1), (16, 1)],
  term ((-5240039368750596 : Rat) / 28298395017400811) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-309185344749150564 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((980531735453328225 : Rat) / 56596790034801622) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-4903655225258724 : Rat) / 975806724737959) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((191391481520577114 : Rat) / 28298395017400811) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (11, 2), (15, 3), (16, 1)],
  term ((7995558422312292 : Rat) / 28298395017400811) [(7, 1), (11, 3), (12, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(7, 1), (11, 3), (14, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (11, 3), (15, 2), (16, 1)],
  term ((-281209288717462467 : Rat) / 28298395017400811) [(7, 1), (11, 3), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(7, 1), (11, 4), (13, 1), (16, 1)],
  term ((-983715691841784 : Rat) / 1230365000756557) [(7, 1), (11, 4), (15, 1), (16, 1)],
  term ((5240039368750596 : Rat) / 28298395017400811) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((309185344749150564 : Rat) / 28298395017400811) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-937659117523593225 : Rat) / 56596790034801622) [(7, 1), (13, 1), (16, 1)],
  term ((4903655225258724 : Rat) / 975806724737959) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-168766020608216082 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (15, 3), (16, 1)],
  term ((-383786804270990016 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((500107113111977688 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-383786804270990016 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 2), (16, 1)],
  term ((-8266557160685088 : Rat) / 28298395017400811) [(7, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(7, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((309855293741308056 : Rat) / 28298395017400811) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((-58160154420493836 : Rat) / 28298395017400811) [(7, 2), (8, 1), (10, 2), (16, 1)],
  term ((-58160154420493836 : Rat) / 28298395017400811) [(7, 2), (8, 1), (11, 2), (16, 1)],
  term ((8266557160685088 : Rat) / 28298395017400811) [(7, 2), (8, 1), (12, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(7, 2), (8, 1), (14, 1), (16, 1)],
  term ((-251695139320814220 : Rat) / 28298395017400811) [(7, 2), (8, 1), (16, 1)],
  term ((116320308840987672 : Rat) / 28298395017400811) [(7, 2), (8, 2), (10, 1), (16, 1)],
  term ((-116320308840987672 : Rat) / 28298395017400811) [(7, 2), (8, 2), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-8266557160685088 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((117961891605813048 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 3), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 2), (10, 2), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-335813453737116264 : Rat) / 28298395017400811) [(7, 2), (9, 2), (11, 2), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 2), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 2), (9, 3), (11, 1), (16, 1)],
  term ((4133278580342544 : Rat) / 28298395017400811) [(7, 2), (10, 2), (12, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(7, 2), (10, 2), (14, 1), (16, 1)],
  term ((-154927646870654028 : Rat) / 28298395017400811) [(7, 2), (10, 2), (16, 1)],
  term ((4133278580342544 : Rat) / 28298395017400811) [(7, 2), (11, 2), (12, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(7, 2), (11, 2), (14, 1), (16, 1)],
  term ((-154927646870654028 : Rat) / 28298395017400811) [(7, 2), (11, 2), (16, 1)],
  term ((-4133278580342544 : Rat) / 28298395017400811) [(7, 2), (12, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(7, 2), (14, 1), (16, 1)],
  term ((154927646870654028 : Rat) / 28298395017400811) [(7, 2), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 3), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 3), (8, 2), (9, 1), (16, 1)],
  term ((23986675266936876 : Rat) / 28298395017400811) [(7, 3), (9, 1), (10, 2), (16, 1)],
  term ((23986675266936876 : Rat) / 28298395017400811) [(7, 3), (9, 1), (11, 2), (16, 1)],
  term ((-23986675266936876 : Rat) / 28298395017400811) [(7, 3), (9, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 3), (9, 2), (11, 1), (16, 1)],
  term ((28581745286490000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3897510720885000 : Rat) / 975806724737959) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((1311620922455712 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4400051354968116081 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-14290872643245000 : Rat) / 28298395017400811) [(8, 1), (10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1948755360442500 : Rat) / 975806724737959) [(8, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-655810461227856 : Rat) / 1230365000756557) [(8, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4400051354968116081 : Rat) / 56596790034801622) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((14290872643245000 : Rat) / 28298395017400811) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1948755360442500 : Rat) / 975806724737959) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((655810461227856 : Rat) / 1230365000756557) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4400051354968116081 : Rat) / 56596790034801622) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14290872643245000 : Rat) / 28298395017400811) [(8, 1), (11, 3), (13, 1), (14, 1), (16, 1)],
  term ((1948755360442500 : Rat) / 975806724737959) [(8, 1), (11, 3), (13, 1), (16, 1)],
  term ((-655810461227856 : Rat) / 1230365000756557) [(8, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((4400051354968116081 : Rat) / 56596790034801622) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((28581745286490000 : Rat) / 28298395017400811) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3897510720885000 : Rat) / 975806724737959) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1311620922455712 : Rat) / 1230365000756557) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4400051354968116081 : Rat) / 28298395017400811) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-28581745286490000 : Rat) / 28298395017400811) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3897510720885000 : Rat) / 975806724737959) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1311620922455712 : Rat) / 1230365000756557) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4400051354968116081 : Rat) / 28298395017400811) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 200 through 299. -/
theorem ep_Q2_020_block_19_0200_0299_valid :
    checkProductSumEq ep_Q2_020_partials_19_0200_0299
      ep_Q2_020_block_19_0200_0299 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
