/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 29:500-599

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 29 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_29_0500_0599 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 500 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0500 : Poly :=
[
  term ((-72645563906219577282597986735692800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 500 for generator 29. -/
def ep_Q2_008_partial_29_0500 : Poly :=
[
  term ((-145291127812439154565195973471385600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((72645563906219577282597986735692800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-145291127812439154565195973471385600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((72645563906219577282597986735692800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 29. -/
theorem ep_Q2_008_partial_29_0500_valid :
    mulPoly ep_Q2_008_coefficient_29_0500
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0501 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 501 for generator 29. -/
def ep_Q2_008_partial_29_0501 : Poly :=
[
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 29. -/
theorem ep_Q2_008_partial_29_0501_valid :
    mulPoly ep_Q2_008_coefficient_29_0501
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0502 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 502 for generator 29. -/
def ep_Q2_008_partial_29_0502 : Poly :=
[
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 4), (15, 2), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 29. -/
theorem ep_Q2_008_partial_29_0502_valid :
    mulPoly ep_Q2_008_coefficient_29_0502
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0503 : Poly :=
[
  term ((21954589358913972424414439344075577815800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 503 for generator 29. -/
def ep_Q2_008_partial_29_0503 : Poly :=
[
  term ((43909178717827944848828878688151155631600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21954589358913972424414439344075577815800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((43909178717827944848828878688151155631600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-21954589358913972424414439344075577815800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 29. -/
theorem ep_Q2_008_partial_29_0503_valid :
    mulPoly ep_Q2_008_coefficient_29_0503
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0504 : Poly :=
[
  term ((-35162393466106350 : Rat) / 692956453614176359) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 504 for generator 29. -/
def ep_Q2_008_partial_29_0504 : Poly :=
[
  term ((-70324786932212700 : Rat) / 692956453614176359) [(6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((35162393466106350 : Rat) / 692956453614176359) [(6, 1), (8, 1), (12, 2), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((35162393466106350 : Rat) / 692956453614176359) [(6, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 29. -/
theorem ep_Q2_008_partial_29_0504_valid :
    mulPoly ep_Q2_008_coefficient_29_0504
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0505 : Poly :=
[
  term ((41685407496652500 : Rat) / 692956453614176359) [(6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 505 for generator 29. -/
def ep_Q2_008_partial_29_0505 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(6, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(6, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 29. -/
theorem ep_Q2_008_partial_29_0505_valid :
    mulPoly ep_Q2_008_coefficient_29_0505
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0506 : Poly :=
[
  term ((-21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 506 for generator 29. -/
def ep_Q2_008_partial_29_0506 : Poly :=
[
  term ((-43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 29. -/
theorem ep_Q2_008_partial_29_0506_valid :
    mulPoly ep_Q2_008_coefficient_29_0506
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0507 : Poly :=
[
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 507 for generator 29. -/
def ep_Q2_008_partial_29_0507 : Poly :=
[
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 29. -/
theorem ep_Q2_008_partial_29_0507_valid :
    mulPoly ep_Q2_008_coefficient_29_0507
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0508 : Poly :=
[
  term ((-2315584888450340175 : Rat) / 2771825814456705436) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 508 for generator 29. -/
def ep_Q2_008_partial_29_0508 : Poly :=
[
  term ((-2315584888450340175 : Rat) / 1385912907228352718) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2315584888450340175 : Rat) / 2771825814456705436) [(6, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2315584888450340175 : Rat) / 1385912907228352718) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((2315584888450340175 : Rat) / 2771825814456705436) [(6, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 29. -/
theorem ep_Q2_008_partial_29_0508_valid :
    mulPoly ep_Q2_008_coefficient_29_0508
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0509 : Poly :=
[
  term ((-123843123330768991898081868750515308800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 509 for generator 29. -/
def ep_Q2_008_partial_29_0509 : Poly :=
[
  term ((-247686246661537983796163737501030617600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((123843123330768991898081868750515308800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-247686246661537983796163737501030617600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 3), (15, 2), (16, 1)],
  term ((123843123330768991898081868750515308800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 29. -/
theorem ep_Q2_008_partial_29_0509_valid :
    mulPoly ep_Q2_008_coefficient_29_0509
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0510 : Poly :=
[
  term ((6752107757879086827065204549535168766050 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 510 for generator 29. -/
def ep_Q2_008_partial_29_0510 : Poly :=
[
  term ((13504215515758173654130409099070337532100 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6752107757879086827065204549535168766050 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((13504215515758173654130409099070337532100 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6752107757879086827065204549535168766050 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 29. -/
theorem ep_Q2_008_partial_29_0510_valid :
    mulPoly ep_Q2_008_coefficient_29_0510
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0511 : Poly :=
[
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 511 for generator 29. -/
def ep_Q2_008_partial_29_0511 : Poly :=
[
  term ((-27783919602340272000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-27783919602340272000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 29. -/
theorem ep_Q2_008_partial_29_0511_valid :
    mulPoly ep_Q2_008_coefficient_29_0511
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0512 : Poly :=
[
  term ((3472989950292534000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 512 for generator 29. -/
def ep_Q2_008_partial_29_0512 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 29. -/
theorem ep_Q2_008_partial_29_0512_valid :
    mulPoly ep_Q2_008_coefficient_29_0512
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0513 : Poly :=
[
  term ((-701628568422253445059594065953107154953200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 513 for generator 29. -/
def ep_Q2_008_partial_29_0513 : Poly :=
[
  term ((-1403257136844506890119188131906214309906400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((701628568422253445059594065953107154953200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1403257136844506890119188131906214309906400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((701628568422253445059594065953107154953200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 29. -/
theorem ep_Q2_008_partial_29_0513_valid :
    mulPoly ep_Q2_008_coefficient_29_0513
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0514 : Poly :=
[
  term ((4630653267056712000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 514 for generator 29. -/
def ep_Q2_008_partial_29_0514 : Poly :=
[
  term ((9261306534113424000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4630653267056712000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((9261306534113424000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4630653267056712000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 29. -/
theorem ep_Q2_008_partial_29_0514_valid :
    mulPoly ep_Q2_008_coefficient_29_0514
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0515 : Poly :=
[
  term ((-305790846607904625 : Rat) / 2771825814456705436) [(6, 1), (10, 1), (16, 1)]
]

/-- Partial product 515 for generator 29. -/
def ep_Q2_008_partial_29_0515 : Poly :=
[
  term ((-305790846607904625 : Rat) / 1385912907228352718) [(6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((305790846607904625 : Rat) / 2771825814456705436) [(6, 1), (10, 1), (12, 2), (16, 1)],
  term ((-305790846607904625 : Rat) / 1385912907228352718) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((305790846607904625 : Rat) / 2771825814456705436) [(6, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 29. -/
theorem ep_Q2_008_partial_29_0515_valid :
    mulPoly ep_Q2_008_coefficient_29_0515
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0516 : Poly :=
[
  term ((11911384284348060000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 516 for generator 29. -/
def ep_Q2_008_partial_29_0516 : Poly :=
[
  term ((23822768568696120000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11911384284348060000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-11911384284348060000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 29. -/
theorem ep_Q2_008_partial_29_0516_valid :
    mulPoly ep_Q2_008_coefficient_29_0516
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0517 : Poly :=
[
  term ((986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 517 for generator 29. -/
def ep_Q2_008_partial_29_0517 : Poly :=
[
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 29. -/
theorem ep_Q2_008_partial_29_0517_valid :
    mulPoly ep_Q2_008_coefficient_29_0517
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0518 : Poly :=
[
  term ((35374525062889436509925913290747532427950 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 518 for generator 29. -/
def ep_Q2_008_partial_29_0518 : Poly :=
[
  term ((70749050125778873019851826581495064855900 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-35374525062889436509925913290747532427950 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((70749050125778873019851826581495064855900 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-35374525062889436509925913290747532427950 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 29. -/
theorem ep_Q2_008_partial_29_0518_valid :
    mulPoly ep_Q2_008_coefficient_29_0518
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0519 : Poly :=
[
  term ((-2416107330406506599471922325523793216000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 519 for generator 29. -/
def ep_Q2_008_partial_29_0519 : Poly :=
[
  term ((-4832214660813013198943844651047586432000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2416107330406506599471922325523793216000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4832214660813013198943844651047586432000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((2416107330406506599471922325523793216000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 29. -/
theorem ep_Q2_008_partial_29_0519_valid :
    mulPoly ep_Q2_008_coefficient_29_0519
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0520 : Poly :=
[
  term ((27416032519157863821 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 520 for generator 29. -/
def ep_Q2_008_partial_29_0520 : Poly :=
[
  term ((54832065038315727642 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-27416032519157863821 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((54832065038315727642 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-27416032519157863821 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 29. -/
theorem ep_Q2_008_partial_29_0520_valid :
    mulPoly ep_Q2_008_coefficient_29_0520
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0521 : Poly :=
[
  term ((-1185035115987520455159456948447126200841600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 521 for generator 29. -/
def ep_Q2_008_partial_29_0521 : Poly :=
[
  term ((-2370070231975040910318913896894252401683200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1185035115987520455159456948447126200841600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-2370070231975040910318913896894252401683200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((1185035115987520455159456948447126200841600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 29. -/
theorem ep_Q2_008_partial_29_0521_valid :
    mulPoly ep_Q2_008_coefficient_29_0521
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0522 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 522 for generator 29. -/
def ep_Q2_008_partial_29_0522 : Poly :=
[
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 4), (15, 3), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 5), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 29. -/
theorem ep_Q2_008_partial_29_0522_valid :
    mulPoly ep_Q2_008_coefficient_29_0522
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0523 : Poly :=
[
  term ((9529107427478448000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 523 for generator 29. -/
def ep_Q2_008_partial_29_0523 : Poly :=
[
  term ((19058214854956896000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 2), (13, 3), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 29. -/
theorem ep_Q2_008_partial_29_0523_valid :
    mulPoly ep_Q2_008_coefficient_29_0523
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0524 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 524 for generator 29. -/
def ep_Q2_008_partial_29_0524 : Poly :=
[
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 5), (15, 2), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 6), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 29. -/
theorem ep_Q2_008_partial_29_0524_valid :
    mulPoly ep_Q2_008_coefficient_29_0524
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0525 : Poly :=
[
  term ((1035310132725387225719425211546544212562021 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 525 for generator 29. -/
def ep_Q2_008_partial_29_0525 : Poly :=
[
  term ((1035310132725387225719425211546544212562021 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1035310132725387225719425211546544212562021 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1035310132725387225719425211546544212562021 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1035310132725387225719425211546544212562021 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 29. -/
theorem ep_Q2_008_partial_29_0525_valid :
    mulPoly ep_Q2_008_coefficient_29_0525
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0526 : Poly :=
[
  term ((-7509294284098458669594721362001419897600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 526 for generator 29. -/
def ep_Q2_008_partial_29_0526 : Poly :=
[
  term ((-15018588568196917339189442724002839795200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7509294284098458669594721362001419897600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15018588568196917339189442724002839795200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((7509294284098458669594721362001419897600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 29. -/
theorem ep_Q2_008_partial_29_0526_valid :
    mulPoly ep_Q2_008_coefficient_29_0526
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0527 : Poly :=
[
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 2), (16, 1)]
]

/-- Partial product 527 for generator 29. -/
def ep_Q2_008_partial_29_0527 : Poly :=
[
  term ((-57174644564870688000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (12, 2), (13, 2), (16, 1)],
  term ((-57174644564870688000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 29. -/
theorem ep_Q2_008_partial_29_0527_valid :
    mulPoly ep_Q2_008_coefficient_29_0527
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0528 : Poly :=
[
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 528 for generator 29. -/
def ep_Q2_008_partial_29_0528 : Poly :=
[
  term ((-4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (13, 4), (15, 2), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 29. -/
theorem ep_Q2_008_partial_29_0528_valid :
    mulPoly ep_Q2_008_coefficient_29_0528
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0529 : Poly :=
[
  term ((-3769869818275863750 : Rat) / 692956453614176359) [(6, 1), (11, 2), (16, 1)]
]

/-- Partial product 529 for generator 29. -/
def ep_Q2_008_partial_29_0529 : Poly :=
[
  term ((-7539739636551727500 : Rat) / 692956453614176359) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((3769869818275863750 : Rat) / 692956453614176359) [(6, 1), (11, 2), (12, 2), (16, 1)],
  term ((-7539739636551727500 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3769869818275863750 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 29. -/
theorem ep_Q2_008_partial_29_0529_valid :
    mulPoly ep_Q2_008_coefficient_29_0529
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0530 : Poly :=
[
  term ((-2840935691552274599409348964990276285649367 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 530 for generator 29. -/
def ep_Q2_008_partial_29_0530 : Poly :=
[
  term ((-2840935691552274599409348964990276285649367 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((2840935691552274599409348964990276285649367 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2840935691552274599409348964990276285649367 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2840935691552274599409348964990276285649367 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 29. -/
theorem ep_Q2_008_partial_29_0530_valid :
    mulPoly ep_Q2_008_coefficient_29_0530
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0531 : Poly :=
[
  term ((3435233678578325465784110552734491249023163 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 531 for generator 29. -/
def ep_Q2_008_partial_29_0531 : Poly :=
[
  term ((3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3435233678578325465784110552734491249023163 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3435233678578325465784110552734491249023163 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 29. -/
theorem ep_Q2_008_partial_29_0531_valid :
    mulPoly ep_Q2_008_coefficient_29_0531
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0532 : Poly :=
[
  term ((-41889972037375162185 : Rat) / 5543651628913410872) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 532 for generator 29. -/
def ep_Q2_008_partial_29_0532 : Poly :=
[
  term ((-41889972037375162185 : Rat) / 2771825814456705436) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((41889972037375162185 : Rat) / 5543651628913410872) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-41889972037375162185 : Rat) / 2771825814456705436) [(6, 1), (12, 2), (14, 1), (16, 1)],
  term ((41889972037375162185 : Rat) / 5543651628913410872) [(6, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 29. -/
theorem ep_Q2_008_partial_29_0532_valid :
    mulPoly ep_Q2_008_coefficient_29_0532
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0533 : Poly :=
[
  term ((5561300461339522216138702503963960454580109 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 533 for generator 29. -/
def ep_Q2_008_partial_29_0533 : Poly :=
[
  term ((5561300461339522216138702503963960454580109 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5561300461339522216138702503963960454580109 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((5561300461339522216138702503963960454580109 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5561300461339522216138702503963960454580109 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 29. -/
theorem ep_Q2_008_partial_29_0533_valid :
    mulPoly ep_Q2_008_coefficient_29_0533
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0534 : Poly :=
[
  term ((-5941322244594211698062041382647210540800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 534 for generator 29. -/
def ep_Q2_008_partial_29_0534 : Poly :=
[
  term ((-11882644489188423396124082765294421081600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((5941322244594211698062041382647210540800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-11882644489188423396124082765294421081600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 3), (15, 3), (16, 1)],
  term ((5941322244594211698062041382647210540800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 29. -/
theorem ep_Q2_008_partial_29_0534_valid :
    mulPoly ep_Q2_008_coefficient_29_0534
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0535 : Poly :=
[
  term ((-133442547223461751167 : Rat) / 5543651628913410872) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 535 for generator 29. -/
def ep_Q2_008_partial_29_0535 : Poly :=
[
  term ((-133442547223461751167 : Rat) / 2771825814456705436) [(6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((133442547223461751167 : Rat) / 5543651628913410872) [(6, 1), (12, 2), (13, 2), (16, 1)],
  term ((-133442547223461751167 : Rat) / 2771825814456705436) [(6, 1), (13, 3), (15, 1), (16, 1)],
  term ((133442547223461751167 : Rat) / 5543651628913410872) [(6, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 29. -/
theorem ep_Q2_008_partial_29_0535_valid :
    mulPoly ep_Q2_008_coefficient_29_0535
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0536 : Poly :=
[
  term ((7490269472737244538022443870328777651200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 536 for generator 29. -/
def ep_Q2_008_partial_29_0536 : Poly :=
[
  term ((14980538945474489076044887740657555302400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-7490269472737244538022443870328777651200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((14980538945474489076044887740657555302400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 4), (15, 2), (16, 1)],
  term ((-7490269472737244538022443870328777651200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 29. -/
theorem ep_Q2_008_partial_29_0536_valid :
    mulPoly ep_Q2_008_coefficient_29_0536
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0537 : Poly :=
[
  term ((792327979446235099338261593833890365385321 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 537 for generator 29. -/
def ep_Q2_008_partial_29_0537 : Poly :=
[
  term ((792327979446235099338261593833890365385321 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-792327979446235099338261593833890365385321 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((792327979446235099338261593833890365385321 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-792327979446235099338261593833890365385321 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 29. -/
theorem ep_Q2_008_partial_29_0537_valid :
    mulPoly ep_Q2_008_coefficient_29_0537
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0538 : Poly :=
[
  term ((-12897950413543628939 : Rat) / 2771825814456705436) [(6, 1), (16, 1)]
]

/-- Partial product 538 for generator 29. -/
def ep_Q2_008_partial_29_0538 : Poly :=
[
  term ((-12897950413543628939 : Rat) / 1385912907228352718) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((12897950413543628939 : Rat) / 2771825814456705436) [(6, 1), (12, 2), (16, 1)],
  term ((-12897950413543628939 : Rat) / 1385912907228352718) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((12897950413543628939 : Rat) / 2771825814456705436) [(6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 29. -/
theorem ep_Q2_008_partial_29_0538_valid :
    mulPoly ep_Q2_008_coefficient_29_0538
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0539 : Poly :=
[
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 539 for generator 29. -/
def ep_Q2_008_partial_29_0539 : Poly :=
[
  term ((-87253620494606417405624156363252806538400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-87253620494606417405624156363252806538400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 29. -/
theorem ep_Q2_008_partial_29_0539_valid :
    mulPoly ep_Q2_008_coefficient_29_0539
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0540 : Poly :=
[
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 540 for generator 29. -/
def ep_Q2_008_partial_29_0540 : Poly :=
[
  term ((29084540164868805801874718787750935512800 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((29084540164868805801874718787750935512800 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 29. -/
theorem ep_Q2_008_partial_29_0540_valid :
    mulPoly ep_Q2_008_coefficient_29_0540
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0541 : Poly :=
[
  term ((-41685407496652500 : Rat) / 692956453614176359) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 541 for generator 29. -/
def ep_Q2_008_partial_29_0541 : Poly :=
[
  term ((-83370814993305000 : Rat) / 692956453614176359) [(7, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((41685407496652500 : Rat) / 692956453614176359) [(7, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((41685407496652500 : Rat) / 692956453614176359) [(7, 1), (8, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 29. -/
theorem ep_Q2_008_partial_29_0541_valid :
    mulPoly ep_Q2_008_coefficient_29_0541
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0542 : Poly :=
[
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 542 for generator 29. -/
def ep_Q2_008_partial_29_0542 : Poly :=
[
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 2), (15, 3), (16, 1)],
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 29. -/
theorem ep_Q2_008_partial_29_0542_valid :
    mulPoly ep_Q2_008_coefficient_29_0542
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0543 : Poly :=
[
  term ((2503117653602907375 : Rat) / 2771825814456705436) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 543 for generator 29. -/
def ep_Q2_008_partial_29_0543 : Poly :=
[
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 2771825814456705436) [(7, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 2771825814456705436) [(7, 1), (8, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 29. -/
theorem ep_Q2_008_partial_29_0543_valid :
    mulPoly ep_Q2_008_coefficient_29_0543
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0544 : Poly :=
[
  term ((100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 544 for generator 29. -/
def ep_Q2_008_partial_29_0544 : Poly :=
[
  term ((201359834261146566004157046449609299200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((201359834261146566004157046449609299200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((-100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 29. -/
theorem ep_Q2_008_partial_29_0544_valid :
    mulPoly ep_Q2_008_coefficient_29_0544
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0545 : Poly :=
[
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 1), (13, 3), (16, 1)]
]

/-- Partial product 545 for generator 29. -/
def ep_Q2_008_partial_29_0545 : Poly :=
[
  term ((2919511882115052984 : Rat) / 692956453614176359) [(7, 1), (8, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 1), (12, 2), (13, 3), (16, 1)],
  term ((2919511882115052984 : Rat) / 692956453614176359) [(7, 1), (8, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 29. -/
theorem ep_Q2_008_partial_29_0545_valid :
    mulPoly ep_Q2_008_coefficient_29_0545
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0546 : Poly :=
[
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 546 for generator 29. -/
def ep_Q2_008_partial_29_0546 : Poly :=
[
  term ((58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 1), (13, 5), (15, 2), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 1), (13, 6), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 29. -/
theorem ep_Q2_008_partial_29_0546_valid :
    mulPoly ep_Q2_008_coefficient_29_0546
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0547 : Poly :=
[
  term ((-7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 547 for generator 29. -/
def ep_Q2_008_partial_29_0547 : Poly :=
[
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 29. -/
theorem ep_Q2_008_partial_29_0547_valid :
    mulPoly ep_Q2_008_coefficient_29_0547
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0548 : Poly :=
[
  term ((23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 548 for generator 29. -/
def ep_Q2_008_partial_29_0548 : Poly :=
[
  term ((46326412400391417792006691051421318400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((46326412400391417792006691051421318400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 29. -/
theorem ep_Q2_008_partial_29_0548_valid :
    mulPoly ep_Q2_008_coefficient_29_0548
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0549 : Poly :=
[
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 549 for generator 29. -/
def ep_Q2_008_partial_29_0549 : Poly :=
[
  term ((-2919511882115052984 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (13, 4), (16, 1)],
  term ((-2919511882115052984 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 29. -/
theorem ep_Q2_008_partial_29_0549_valid :
    mulPoly ep_Q2_008_coefficient_29_0549
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0550 : Poly :=
[
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 550 for generator 29. -/
def ep_Q2_008_partial_29_0550 : Poly :=
[
  term ((-58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 1), (12, 1), (13, 5), (15, 1), (16, 1)],
  term ((-58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 1), (12, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 1), (12, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 29. -/
theorem ep_Q2_008_partial_29_0550_valid :
    mulPoly ep_Q2_008_coefficient_29_0550
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0551 : Poly :=
[
  term ((-46883191288141800 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 551 for generator 29. -/
def ep_Q2_008_partial_29_0551 : Poly :=
[
  term ((-93766382576283600 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-93766382576283600 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 29. -/
theorem ep_Q2_008_partial_29_0551_valid :
    mulPoly ep_Q2_008_coefficient_29_0551
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0552 : Poly :=
[
  term ((7509294284098458669594721362001419897600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 552 for generator 29. -/
def ep_Q2_008_partial_29_0552 : Poly :=
[
  term ((15018588568196917339189442724002839795200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7509294284098458669594721362001419897600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((15018588568196917339189442724002839795200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-7509294284098458669594721362001419897600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 29. -/
theorem ep_Q2_008_partial_29_0552_valid :
    mulPoly ep_Q2_008_coefficient_29_0552
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0553 : Poly :=
[
  term ((28587322282435344000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 553 for generator 29. -/
def ep_Q2_008_partial_29_0553 : Poly :=
[
  term ((57174644564870688000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((57174644564870688000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 29. -/
theorem ep_Q2_008_partial_29_0553_valid :
    mulPoly ep_Q2_008_coefficient_29_0553
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0554 : Poly :=
[
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 554 for generator 29. -/
def ep_Q2_008_partial_29_0554 : Poly :=
[
  term ((4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 29. -/
theorem ep_Q2_008_partial_29_0554_valid :
    mulPoly ep_Q2_008_coefficient_29_0554
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0555 : Poly :=
[
  term ((3769869818275863750 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 555 for generator 29. -/
def ep_Q2_008_partial_29_0555 : Poly :=
[
  term ((7539739636551727500 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3769869818275863750 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((7539739636551727500 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3769869818275863750 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 29. -/
theorem ep_Q2_008_partial_29_0555_valid :
    mulPoly ep_Q2_008_coefficient_29_0555
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0556 : Poly :=
[
  term ((-18157674082962466377 : Rat) / 2771825814456705436) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 556 for generator 29. -/
def ep_Q2_008_partial_29_0556 : Poly :=
[
  term ((-18157674082962466377 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((18157674082962466377 : Rat) / 2771825814456705436) [(7, 1), (10, 1), (12, 1), (13, 3), (16, 1)],
  term ((-18157674082962466377 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((18157674082962466377 : Rat) / 2771825814456705436) [(7, 1), (10, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 29. -/
theorem ep_Q2_008_partial_29_0556_valid :
    mulPoly ep_Q2_008_coefficient_29_0556
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0557 : Poly :=
[
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 557 for generator 29. -/
def ep_Q2_008_partial_29_0557 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 29. -/
theorem ep_Q2_008_partial_29_0557_valid :
    mulPoly ep_Q2_008_coefficient_29_0557
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0558 : Poly :=
[
  term ((5402428811566164000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 558 for generator 29. -/
def ep_Q2_008_partial_29_0558 : Poly :=
[
  term ((10804857623132328000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((10804857623132328000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 29. -/
theorem ep_Q2_008_partial_29_0558_valid :
    mulPoly ep_Q2_008_coefficient_29_0558
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0559 : Poly :=
[
  term ((1179934690875908354988974930190259526400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 559 for generator 29. -/
def ep_Q2_008_partial_29_0559 : Poly :=
[
  term ((2359869381751816709977949860380519052800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1179934690875908354988974930190259526400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((2359869381751816709977949860380519052800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1179934690875908354988974930190259526400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 29. -/
theorem ep_Q2_008_partial_29_0559_valid :
    mulPoly ep_Q2_008_coefficient_29_0559
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0560 : Poly :=
[
  term ((-123984321151496810355 : Rat) / 2771825814456705436) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 560 for generator 29. -/
def ep_Q2_008_partial_29_0560 : Poly :=
[
  term ((-123984321151496810355 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((123984321151496810355 : Rat) / 2771825814456705436) [(7, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-123984321151496810355 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((123984321151496810355 : Rat) / 2771825814456705436) [(7, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 29. -/
theorem ep_Q2_008_partial_29_0560_valid :
    mulPoly ep_Q2_008_coefficient_29_0560
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0561 : Poly :=
[
  term ((-1404260537789442284159539273065876066903 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 561 for generator 29. -/
def ep_Q2_008_partial_29_0561 : Poly :=
[
  term ((-1404260537789442284159539273065876066903 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1404260537789442284159539273065876066903 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1404260537789442284159539273065876066903 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((1404260537789442284159539273065876066903 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 29. -/
theorem ep_Q2_008_partial_29_0561_valid :
    mulPoly ep_Q2_008_coefficient_29_0561
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0562 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 562 for generator 29. -/
def ep_Q2_008_partial_29_0562 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 4), (15, 3), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 5), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 29. -/
theorem ep_Q2_008_partial_29_0562_valid :
    mulPoly ep_Q2_008_coefficient_29_0562
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0563 : Poly :=
[
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 3), (16, 1)]
]

/-- Partial product 563 for generator 29. -/
def ep_Q2_008_partial_29_0563 : Poly :=
[
  term ((-4379267823172579476 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 2), (13, 3), (16, 1)],
  term ((-4379267823172579476 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 29. -/
theorem ep_Q2_008_partial_29_0563_valid :
    mulPoly ep_Q2_008_coefficient_29_0563
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0564 : Poly :=
[
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 564 for generator 29. -/
def ep_Q2_008_partial_29_0564 : Poly :=
[
  term ((-88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((-88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 5), (15, 2), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 6), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 29. -/
theorem ep_Q2_008_partial_29_0564_valid :
    mulPoly ep_Q2_008_coefficient_29_0564
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0565 : Poly :=
[
  term ((-1018274722891861329689703999749626425885771 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 565 for generator 29. -/
def ep_Q2_008_partial_29_0565 : Poly :=
[
  term ((-1018274722891861329689703999749626425885771 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1018274722891861329689703999749626425885771 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1018274722891861329689703999749626425885771 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1018274722891861329689703999749626425885771 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 29. -/
theorem ep_Q2_008_partial_29_0565_valid :
    mulPoly ep_Q2_008_coefficient_29_0565
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0566 : Poly :=
[
  term ((13891959801170136000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 566 for generator 29. -/
def ep_Q2_008_partial_29_0566 : Poly :=
[
  term ((27783919602340272000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (12, 2), (13, 1), (16, 1)],
  term ((27783919602340272000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 29. -/
theorem ep_Q2_008_partial_29_0566_valid :
    mulPoly ep_Q2_008_coefficient_29_0566
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0567 : Poly :=
[
  term ((2371474492512830352603073436167318277750103 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 567 for generator 29. -/
def ep_Q2_008_partial_29_0567 : Poly :=
[
  term ((2371474492512830352603073436167318277750103 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2371474492512830352603073436167318277750103 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((2371474492512830352603073436167318277750103 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2371474492512830352603073436167318277750103 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 29. -/
theorem ep_Q2_008_partial_29_0567_valid :
    mulPoly ep_Q2_008_coefficient_29_0567
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0568 : Poly :=
[
  term ((792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 568 for generator 29. -/
def ep_Q2_008_partial_29_0568 : Poly :=
[
  term ((1585104196949939070394589442496577932800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((-792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((1585104196949939070394589442496577932800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 29. -/
theorem ep_Q2_008_partial_29_0568_valid :
    mulPoly ep_Q2_008_coefficient_29_0568
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0569 : Poly :=
[
  term ((-7339473515892158262 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 569 for generator 29. -/
def ep_Q2_008_partial_29_0569 : Poly :=
[
  term ((-14678947031784316524 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((7339473515892158262 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 4), (16, 1)],
  term ((-14678947031784316524 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((7339473515892158262 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 29. -/
theorem ep_Q2_008_partial_29_0569_valid :
    mulPoly ep_Q2_008_coefficient_29_0569
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0570 : Poly :=
[
  term ((-744624537722063104168312216835897318400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 570 for generator 29. -/
def ep_Q2_008_partial_29_0570 : Poly :=
[
  term ((-1489249075444126208336624433671794636800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((744624537722063104168312216835897318400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 5), (15, 1), (16, 1)],
  term ((-1489249075444126208336624433671794636800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((744624537722063104168312216835897318400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 29. -/
theorem ep_Q2_008_partial_29_0570_valid :
    mulPoly ep_Q2_008_coefficient_29_0570
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0571 : Poly :=
[
  term ((1236172639530598244482947395333533689600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 571 for generator 29. -/
def ep_Q2_008_partial_29_0571 : Poly :=
[
  term ((2472345279061196488965894790667067379200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1236172639530598244482947395333533689600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((2472345279061196488965894790667067379200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1236172639530598244482947395333533689600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 29. -/
theorem ep_Q2_008_partial_29_0571_valid :
    mulPoly ep_Q2_008_coefficient_29_0571
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0572 : Poly :=
[
  term ((41943324105432824571 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 572 for generator 29. -/
def ep_Q2_008_partial_29_0572 : Poly :=
[
  term ((41943324105432824571 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41943324105432824571 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((41943324105432824571 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-41943324105432824571 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 29. -/
theorem ep_Q2_008_partial_29_0572_valid :
    mulPoly ep_Q2_008_coefficient_29_0572
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0573 : Poly :=
[
  term ((-199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 573 for generator 29. -/
def ep_Q2_008_partial_29_0573 : Poly :=
[
  term ((-398119416958750399561300533870774931200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-398119416958750399561300533870774931200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 29. -/
theorem ep_Q2_008_partial_29_0573_valid :
    mulPoly ep_Q2_008_coefficient_29_0573
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0574 : Poly :=
[
  term ((-9894046412742829623 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 574 for generator 29. -/
def ep_Q2_008_partial_29_0574 : Poly :=
[
  term ((-9894046412742829623 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((9894046412742829623 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((-9894046412742829623 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (12, 3), (14, 1), (16, 1)],
  term ((9894046412742829623 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 29. -/
theorem ep_Q2_008_partial_29_0574_valid :
    mulPoly ep_Q2_008_coefficient_29_0574
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0575 : Poly :=
[
  term ((-706278656005374761485447780035046713600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 575 for generator 29. -/
def ep_Q2_008_partial_29_0575 : Poly :=
[
  term ((-1412557312010749522970895560070093427200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((706278656005374761485447780035046713600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1412557312010749522970895560070093427200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((706278656005374761485447780035046713600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 29. -/
theorem ep_Q2_008_partial_29_0575_valid :
    mulPoly ep_Q2_008_coefficient_29_0575
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0576 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 576 for generator 29. -/
def ep_Q2_008_partial_29_0576 : Poly :=
[
  term ((28587322282435344000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 29. -/
theorem ep_Q2_008_partial_29_0576_valid :
    mulPoly ep_Q2_008_coefficient_29_0576
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0577 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 577 for generator 29. -/
def ep_Q2_008_partial_29_0577 : Poly :=
[
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 29. -/
theorem ep_Q2_008_partial_29_0577_valid :
    mulPoly ep_Q2_008_coefficient_29_0577
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0578 : Poly :=
[
  term ((22627924105836375 : Rat) / 47790100249253542) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 578 for generator 29. -/
def ep_Q2_008_partial_29_0578 : Poly :=
[
  term ((22627924105836375 : Rat) / 23895050124626771) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-22627924105836375 : Rat) / 47790100249253542) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((22627924105836375 : Rat) / 23895050124626771) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22627924105836375 : Rat) / 47790100249253542) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 29. -/
theorem ep_Q2_008_partial_29_0578_valid :
    mulPoly ep_Q2_008_coefficient_29_0578
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0579 : Poly :=
[
  term ((5405514529171256707063786083828640634400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 579 for generator 29. -/
def ep_Q2_008_partial_29_0579 : Poly :=
[
  term ((10811029058342513414127572167657281268800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-5405514529171256707063786083828640634400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((10811029058342513414127572167657281268800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5405514529171256707063786083828640634400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 29. -/
theorem ep_Q2_008_partial_29_0579_valid :
    mulPoly ep_Q2_008_coefficient_29_0579
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0580 : Poly :=
[
  term ((59472724634520162159 : Rat) / 2771825814456705436) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 580 for generator 29. -/
def ep_Q2_008_partial_29_0580 : Poly :=
[
  term ((59472724634520162159 : Rat) / 1385912907228352718) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-59472724634520162159 : Rat) / 2771825814456705436) [(7, 1), (12, 1), (13, 3), (16, 1)],
  term ((59472724634520162159 : Rat) / 1385912907228352718) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-59472724634520162159 : Rat) / 2771825814456705436) [(7, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 29. -/
theorem ep_Q2_008_partial_29_0580_valid :
    mulPoly ep_Q2_008_coefficient_29_0580
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0581 : Poly :=
[
  term ((1971904761119404333951168158567408004085835 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 581 for generator 29. -/
def ep_Q2_008_partial_29_0581 : Poly :=
[
  term ((1971904761119404333951168158567408004085835 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1971904761119404333951168158567408004085835 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((1971904761119404333951168158567408004085835 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1971904761119404333951168158567408004085835 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 29. -/
theorem ep_Q2_008_partial_29_0581_valid :
    mulPoly ep_Q2_008_coefficient_29_0581
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0582 : Poly :=
[
  term ((82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 582 for generator 29. -/
def ep_Q2_008_partial_29_0582 : Poly :=
[
  term ((165903094913906876638785592196740320000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 4), (15, 3), (16, 1)],
  term ((-82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 5), (15, 2), (16, 1)],
  term ((165903094913906876638785592196740320000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 3), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 29. -/
theorem ep_Q2_008_partial_29_0582_valid :
    mulPoly ep_Q2_008_coefficient_29_0582
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0583 : Poly :=
[
  term ((-2327496078250223394167575670274866998933047 : Rat) / 1349660814810636123005926626071864437583984) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 583 for generator 29. -/
def ep_Q2_008_partial_29_0583 : Poly :=
[
  term ((-2327496078250223394167575670274866998933047 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2327496078250223394167575670274866998933047 : Rat) / 1349660814810636123005926626071864437583984) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2327496078250223394167575670274866998933047 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2327496078250223394167575670274866998933047 : Rat) / 1349660814810636123005926626071864437583984) [(7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 29. -/
theorem ep_Q2_008_partial_29_0583_valid :
    mulPoly ep_Q2_008_coefficient_29_0583
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0584 : Poly :=
[
  term ((-144439602253308615598716299145768000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 584 for generator 29. -/
def ep_Q2_008_partial_29_0584 : Poly :=
[
  term ((-288879204506617231197432598291536000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((144439602253308615598716299145768000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-288879204506617231197432598291536000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (14, 1), (15, 3), (16, 1)],
  term ((144439602253308615598716299145768000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 29. -/
theorem ep_Q2_008_partial_29_0584_valid :
    mulPoly ep_Q2_008_coefficient_29_0584
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0585 : Poly :=
[
  term ((-729877970528763246 : Rat) / 692956453614176359) [(7, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 585 for generator 29. -/
def ep_Q2_008_partial_29_0585 : Poly :=
[
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(7, 1), (12, 2), (13, 3), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(7, 1), (12, 4), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 29. -/
theorem ep_Q2_008_partial_29_0585_valid :
    mulPoly ep_Q2_008_coefficient_29_0585
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0586 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 586 for generator 29. -/
def ep_Q2_008_partial_29_0586 : Poly :=
[
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 4), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 29. -/
theorem ep_Q2_008_partial_29_0586_valid :
    mulPoly ep_Q2_008_coefficient_29_0586
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0587 : Poly :=
[
  term ((-7194964204658538452783945413965062289600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 587 for generator 29. -/
def ep_Q2_008_partial_29_0587 : Poly :=
[
  term ((-14389928409317076905567890827930124579200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((7194964204658538452783945413965062289600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-14389928409317076905567890827930124579200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((7194964204658538452783945413965062289600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 29. -/
theorem ep_Q2_008_partial_29_0587_valid :
    mulPoly ep_Q2_008_coefficient_29_0587
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0588 : Poly :=
[
  term ((45129753491426065231964258648228478017703 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 588 for generator 29. -/
def ep_Q2_008_partial_29_0588 : Poly :=
[
  term ((90259506982852130463928517296456956035406 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-45129753491426065231964258648228478017703 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((90259506982852130463928517296456956035406 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-45129753491426065231964258648228478017703 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 29. -/
theorem ep_Q2_008_partial_29_0588_valid :
    mulPoly ep_Q2_008_coefficient_29_0588
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0589 : Poly :=
[
  term ((-702416648434399301031 : Rat) / 22174606515653643488) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 589 for generator 29. -/
def ep_Q2_008_partial_29_0589 : Poly :=
[
  term ((-702416648434399301031 : Rat) / 11087303257826821744) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((702416648434399301031 : Rat) / 22174606515653643488) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-702416648434399301031 : Rat) / 11087303257826821744) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((702416648434399301031 : Rat) / 22174606515653643488) [(7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 29. -/
theorem ep_Q2_008_partial_29_0589_valid :
    mulPoly ep_Q2_008_coefficient_29_0589
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0590 : Poly :=
[
  term ((1832145871195443113184420082271304292020417 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 590 for generator 29. -/
def ep_Q2_008_partial_29_0590 : Poly :=
[
  term ((1832145871195443113184420082271304292020417 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1832145871195443113184420082271304292020417 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((1832145871195443113184420082271304292020417 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1832145871195443113184420082271304292020417 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 29. -/
theorem ep_Q2_008_partial_29_0590_valid :
    mulPoly ep_Q2_008_coefficient_29_0590
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0591 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 591 for generator 29. -/
def ep_Q2_008_partial_29_0591 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 2), (15, 3), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (15, 4), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 29. -/
theorem ep_Q2_008_partial_29_0591_valid :
    mulPoly ep_Q2_008_coefficient_29_0591
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0592 : Poly :=
[
  term ((35945670564679823271736878309293736000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 592 for generator 29. -/
def ep_Q2_008_partial_29_0592 : Poly :=
[
  term ((71891341129359646543473756618587472000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-35945670564679823271736878309293736000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((71891341129359646543473756618587472000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (15, 3), (16, 1)],
  term ((-35945670564679823271736878309293736000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 5), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 29. -/
theorem ep_Q2_008_partial_29_0592_valid :
    mulPoly ep_Q2_008_coefficient_29_0592
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0593 : Poly :=
[
  term ((16422254336897173035 : Rat) / 5543651628913410872) [(7, 1), (13, 3), (16, 1)]
]

/-- Partial product 593 for generator 29. -/
def ep_Q2_008_partial_29_0593 : Poly :=
[
  term ((16422254336897173035 : Rat) / 2771825814456705436) [(7, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-16422254336897173035 : Rat) / 5543651628913410872) [(7, 1), (12, 2), (13, 3), (16, 1)],
  term ((16422254336897173035 : Rat) / 2771825814456705436) [(7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-16422254336897173035 : Rat) / 5543651628913410872) [(7, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 29. -/
theorem ep_Q2_008_partial_29_0593_valid :
    mulPoly ep_Q2_008_coefficient_29_0593
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0594 : Poly :=
[
  term ((41475773728476719159696398049185080000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 594 for generator 29. -/
def ep_Q2_008_partial_29_0594 : Poly :=
[
  term ((82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-41475773728476719159696398049185080000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 5), (15, 2), (16, 1)],
  term ((-41475773728476719159696398049185080000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 6), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 29. -/
theorem ep_Q2_008_partial_29_0594_valid :
    mulPoly ep_Q2_008_coefficient_29_0594
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0595 : Poly :=
[
  term ((9935426435190615603494968120381651939808439 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 595 for generator 29. -/
def ep_Q2_008_partial_29_0595 : Poly :=
[
  term ((9935426435190615603494968120381651939808439 : Rat) / 1349660814810636123005926626071864437583984) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9935426435190615603494968120381651939808439 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((9935426435190615603494968120381651939808439 : Rat) / 1349660814810636123005926626071864437583984) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9935426435190615603494968120381651939808439 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 29. -/
theorem ep_Q2_008_partial_29_0595_valid :
    mulPoly ep_Q2_008_coefficient_29_0595
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0596 : Poly :=
[
  term ((-94800935107418369785945297120800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 596 for generator 29. -/
def ep_Q2_008_partial_29_0596 : Poly :=
[
  term ((-189601870214836739571890594241600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((94800935107418369785945297120800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (15, 3), (16, 1)],
  term ((-189601870214836739571890594241600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((94800935107418369785945297120800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 29. -/
theorem ep_Q2_008_partial_29_0596_valid :
    mulPoly ep_Q2_008_coefficient_29_0596
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0597 : Poly :=
[
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 597 for generator 29. -/
def ep_Q2_008_partial_29_0597 : Poly :=
[
  term ((1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 1), (13, 4), (15, 2), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 29. -/
theorem ep_Q2_008_partial_29_0597_valid :
    mulPoly ep_Q2_008_coefficient_29_0597
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0598 : Poly :=
[
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 598 for generator 29. -/
def ep_Q2_008_partial_29_0598 : Poly :=
[
  term ((-1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 29. -/
theorem ep_Q2_008_partial_29_0598_valid :
    mulPoly ep_Q2_008_coefficient_29_0598
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0599 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 599 for generator 29. -/
def ep_Q2_008_partial_29_0599 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 29. -/
theorem ep_Q2_008_partial_29_0599_valid :
    mulPoly ep_Q2_008_coefficient_29_0599
        ep_Q2_008_generator_29_0500_0599 =
      ep_Q2_008_partial_29_0599 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_29_0500_0599 : List Poly :=
[
  ep_Q2_008_partial_29_0500,
  ep_Q2_008_partial_29_0501,
  ep_Q2_008_partial_29_0502,
  ep_Q2_008_partial_29_0503,
  ep_Q2_008_partial_29_0504,
  ep_Q2_008_partial_29_0505,
  ep_Q2_008_partial_29_0506,
  ep_Q2_008_partial_29_0507,
  ep_Q2_008_partial_29_0508,
  ep_Q2_008_partial_29_0509,
  ep_Q2_008_partial_29_0510,
  ep_Q2_008_partial_29_0511,
  ep_Q2_008_partial_29_0512,
  ep_Q2_008_partial_29_0513,
  ep_Q2_008_partial_29_0514,
  ep_Q2_008_partial_29_0515,
  ep_Q2_008_partial_29_0516,
  ep_Q2_008_partial_29_0517,
  ep_Q2_008_partial_29_0518,
  ep_Q2_008_partial_29_0519,
  ep_Q2_008_partial_29_0520,
  ep_Q2_008_partial_29_0521,
  ep_Q2_008_partial_29_0522,
  ep_Q2_008_partial_29_0523,
  ep_Q2_008_partial_29_0524,
  ep_Q2_008_partial_29_0525,
  ep_Q2_008_partial_29_0526,
  ep_Q2_008_partial_29_0527,
  ep_Q2_008_partial_29_0528,
  ep_Q2_008_partial_29_0529,
  ep_Q2_008_partial_29_0530,
  ep_Q2_008_partial_29_0531,
  ep_Q2_008_partial_29_0532,
  ep_Q2_008_partial_29_0533,
  ep_Q2_008_partial_29_0534,
  ep_Q2_008_partial_29_0535,
  ep_Q2_008_partial_29_0536,
  ep_Q2_008_partial_29_0537,
  ep_Q2_008_partial_29_0538,
  ep_Q2_008_partial_29_0539,
  ep_Q2_008_partial_29_0540,
  ep_Q2_008_partial_29_0541,
  ep_Q2_008_partial_29_0542,
  ep_Q2_008_partial_29_0543,
  ep_Q2_008_partial_29_0544,
  ep_Q2_008_partial_29_0545,
  ep_Q2_008_partial_29_0546,
  ep_Q2_008_partial_29_0547,
  ep_Q2_008_partial_29_0548,
  ep_Q2_008_partial_29_0549,
  ep_Q2_008_partial_29_0550,
  ep_Q2_008_partial_29_0551,
  ep_Q2_008_partial_29_0552,
  ep_Q2_008_partial_29_0553,
  ep_Q2_008_partial_29_0554,
  ep_Q2_008_partial_29_0555,
  ep_Q2_008_partial_29_0556,
  ep_Q2_008_partial_29_0557,
  ep_Q2_008_partial_29_0558,
  ep_Q2_008_partial_29_0559,
  ep_Q2_008_partial_29_0560,
  ep_Q2_008_partial_29_0561,
  ep_Q2_008_partial_29_0562,
  ep_Q2_008_partial_29_0563,
  ep_Q2_008_partial_29_0564,
  ep_Q2_008_partial_29_0565,
  ep_Q2_008_partial_29_0566,
  ep_Q2_008_partial_29_0567,
  ep_Q2_008_partial_29_0568,
  ep_Q2_008_partial_29_0569,
  ep_Q2_008_partial_29_0570,
  ep_Q2_008_partial_29_0571,
  ep_Q2_008_partial_29_0572,
  ep_Q2_008_partial_29_0573,
  ep_Q2_008_partial_29_0574,
  ep_Q2_008_partial_29_0575,
  ep_Q2_008_partial_29_0576,
  ep_Q2_008_partial_29_0577,
  ep_Q2_008_partial_29_0578,
  ep_Q2_008_partial_29_0579,
  ep_Q2_008_partial_29_0580,
  ep_Q2_008_partial_29_0581,
  ep_Q2_008_partial_29_0582,
  ep_Q2_008_partial_29_0583,
  ep_Q2_008_partial_29_0584,
  ep_Q2_008_partial_29_0585,
  ep_Q2_008_partial_29_0586,
  ep_Q2_008_partial_29_0587,
  ep_Q2_008_partial_29_0588,
  ep_Q2_008_partial_29_0589,
  ep_Q2_008_partial_29_0590,
  ep_Q2_008_partial_29_0591,
  ep_Q2_008_partial_29_0592,
  ep_Q2_008_partial_29_0593,
  ep_Q2_008_partial_29_0594,
  ep_Q2_008_partial_29_0595,
  ep_Q2_008_partial_29_0596,
  ep_Q2_008_partial_29_0597,
  ep_Q2_008_partial_29_0598,
  ep_Q2_008_partial_29_0599
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_29_0500_0599 : Poly :=
[
  term ((-145291127812439154565195973471385600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((72645563906219577282597986735692800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-145291127812439154565195973471385600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((72645563906219577282597986735692800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 4), (15, 2), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 5), (15, 1), (16, 1)],
  term ((43909178717827944848828878688151155631600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-21954589358913972424414439344075577815800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((35162393466106350 : Rat) / 692956453614176359) [(6, 1), (8, 1), (12, 2), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((43909178717827944848828878688151155631600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((35162393466106350 : Rat) / 692956453614176359) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((-21954589358913972424414439344075577815800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(6, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2315584888450340175 : Rat) / 1385912907228352718) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-247686246661537983796163737501030617600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((13504215515758173654130409099070337532100 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((2315584888450340175 : Rat) / 2771825814456705436) [(6, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((123843123330768991898081868750515308800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6752107757879086827065204549535168766050 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((13504215515758173654130409099070337532100 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-295381071829116624232104786647984893540275 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-215113751727755243845291120547816025600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 3), (15, 2), (16, 1)],
  term ((2315584888450340175 : Rat) / 2771825814456705436) [(6, 1), (9, 1), (13, 3), (16, 1)],
  term ((123843123330768991898081868750515308800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 4), (15, 1), (16, 1)],
  term ((-27783919602340272000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-27783919602340272000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1403257136844506890119188131906214309906400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9261306534113424000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-305790846607904625 : Rat) / 1385912907228352718) [(6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((701628568422253445059594065953107154953200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4630653267056712000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((305790846607904625 : Rat) / 2771825814456705436) [(6, 1), (10, 1), (12, 2), (16, 1)],
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 3), (16, 1)],
  term ((-305790846607904625 : Rat) / 1385912907228352718) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1403257136844506890119188131906214309906400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((305790846607904625 : Rat) / 2771825814456705436) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term ((1829010243873294870822250601551683403417200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4630653267056712000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (13, 4), (16, 1)],
  term ((-4832214660813013198943844651047586432000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((54832065038315727642 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((70749050125778873019851826581495064855900 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2370070231975040910318913896894252401683200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2864578375095605152704145058032143678892050 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-11911384284348060000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((1035310132725387225719425211546544212562021 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((2416107330406506599471922325523793216000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-27416032519157863821 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1185035115987520455159456948447126200841600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 2), (13, 3), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((70749050125778873019851826581495064855900 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1035310132725387225719425211546544212562021 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-11911384284348060000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 3), (13, 1), (16, 1)],
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((-35374525062889436509925913290747532427950 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((1035310132725387225719425211546544212562021 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((12314137944311943477307158663442430013933903 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4832214660813013198943844651047586432000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-81643245677401186335153171536852710636800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-27416032519157863821 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 3), (16, 1)],
  term ((3504997436114316126530713725505439169897600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 4), (15, 3), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 5), (15, 2), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 5), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 6), (15, 1), (16, 1)],
  term ((-15018588568196917339189442724002839795200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-57174644564870688000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-7539739636551727500 : Rat) / 692956453614176359) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((7509294284098458669594721362001419897600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (12, 2), (13, 2), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((3769869818275863750 : Rat) / 692956453614176359) [(6, 1), (11, 2), (12, 2), (16, 1)],
  term ((-7539739636551727500 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15018588568196917339189442724002839795200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((3769869818275863750 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 2), (16, 1)],
  term ((-6952377666096288555444175609812937487270400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((-4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (13, 4), (15, 2), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 4), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (13, 5), (15, 1), (16, 1)],
  term ((5561300461339522216138702503963960454580109 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41889972037375162185 : Rat) / 2771825814456705436) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-11882644489188423396124082765294421081600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-133442547223461751167 : Rat) / 2771825814456705436) [(6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-14798976444787423863421506412695596391620631 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((41889972037375162185 : Rat) / 5543651628913410872) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((14980538945474489076044887740657555302400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((2840935691552274599409348964990276285649367 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((792327979446235099338261593833890365385321 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12897950413543628939 : Rat) / 1385912907228352718) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2840935691552274599409348964990276285649367 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5561300461339522216138702503963960454580109 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((5941322244594211698062041382647210540800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((133442547223461751167 : Rat) / 5543651628913410872) [(6, 1), (12, 2), (13, 2), (16, 1)],
  term ((-7490269472737244538022443870328777651200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-41889972037375162185 : Rat) / 2771825814456705436) [(6, 1), (12, 2), (14, 1), (16, 1)],
  term ((-792327979446235099338261593833890365385321 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((12897950413543628939 : Rat) / 2771825814456705436) [(6, 1), (12, 2), (16, 1)],
  term ((2840935691552274599409348964990276285649367 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-3435233678578325465784110552734491249023163 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 3), (15, 2), (16, 1)],
  term ((41889972037375162185 : Rat) / 5543651628913410872) [(6, 1), (12, 3), (16, 1)],
  term ((-12897950413543628939 : Rat) / 1385912907228352718) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((792327979446235099338261593833890365385321 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((10330272943232809332939143414094030543774897 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((12897950413543628939 : Rat) / 2771825814456705436) [(6, 1), (13, 2), (16, 1)],
  term ((-70537308721557449431516945863653873795202057 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-11882644489188423396124082765294421081600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 3), (15, 3), (16, 1)],
  term ((20921861190068700774106929123304765843200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 4), (15, 2), (16, 1)],
  term ((133442547223461751167 : Rat) / 5543651628913410872) [(6, 1), (13, 4), (16, 1)],
  term ((-7490269472737244538022443870328777651200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 5), (15, 1), (16, 1)],
  term ((-87253620494606417405624156363252806538400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-87253620494606417405624156363252806538400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((29084540164868805801874718787750935512800 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((29084540164868805801874718787750935512800 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 3), (15, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(7, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((41685407496652500 : Rat) / 692956453614176359) [(7, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((41685407496652500 : Rat) / 692956453614176359) [(7, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((201359834261146566004157046449609299200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2919511882115052984 : Rat) / 692956453614176359) [(7, 1), (8, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 2771825814456705436) [(7, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((-100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 1), (12, 2), (13, 3), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((318807011044220460169400651017669756187475 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 2), (15, 3), (16, 1)],
  term ((168787339327363826053284429496394707200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 2771825814456705436) [(7, 1), (8, 1), (13, 3), (16, 1)],
  term ((355292393947168935890967156817718199636024 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 4), (15, 1), (16, 1)],
  term ((58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 1), (13, 5), (15, 2), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 1), (13, 5), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 1), (13, 6), (15, 1), (16, 1)],
  term ((-93766382576283600 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((46326412400391417792006691051421318400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-355416237070499704882865238686468714944824 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (13, 4), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 1), (12, 1), (13, 5), (15, 1), (16, 1)],
  term ((46326412400391417792006691051421318400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2919511882115052984 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 1), (12, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-93766382576283600 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 3), (13, 2), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 1), (12, 3), (13, 3), (15, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 3), (16, 1)],
  term ((15018588568196917339189442724002839795200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((57174644564870688000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((7539739636551727500 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-7509294284098458669594721362001419897600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-3769869818275863750 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((7539739636551727500 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((15018588568196917339189442724002839795200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3769869818275863750 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((6952377666096288555444175609812937487270400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 4), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (13, 5), (15, 1), (16, 1)],
  term ((2359869381751816709977949860380519052800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-123984321151496810355 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((10804857623132328000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1404260537789442284159539273065876066903 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-28962531706094794377 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-4379267823172579476 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((18157674082962466377 : Rat) / 2771825814456705436) [(7, 1), (10, 1), (12, 1), (13, 3), (16, 1)],
  term ((-88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1018274722891861329689703999749626425885771 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18157674082962466377 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1179934690875908354988974930190259526400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((123984321151496810355 : Rat) / 2771825814456705436) [(7, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1404260537789442284159539273065876066903 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 2), (13, 3), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((10804857623132328000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1018274722891861329689703999749626425885771 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((18157674082962466377 : Rat) / 2771825814456705436) [(7, 1), (10, 1), (12, 3), (13, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((-1018274722891861329689703999749626425885771 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7037187295586666327034659475001605650662692 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((2359869381751816709977949860380519052800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-2584195228665350639148514203256135593303 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((123984321151496810355 : Rat) / 2771825814456705436) [(7, 1), (10, 1), (13, 3), (16, 1)],
  term ((-1064774961055109085237748166749763136789969 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 4), (15, 3), (16, 1)],
  term ((-84794915178219070282045969345000608000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 5), (15, 2), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 5), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 6), (15, 1), (16, 1)],
  term ((27783919602340272000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (12, 2), (13, 1), (16, 1)],
  term ((27783919602340272000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (13, 3), (16, 1)],
  term ((-1412557312010749522970895560070093427200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((41943324105432824571 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2472345279061196488965894790667067379200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((2370238319873299754358590488771984744060503 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-41943324105432824571 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-5945219911173523167823679284261115203005231 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1585104196949939070394589442496577932800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((-2281801173919095743533919154920083603200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((7339473515892158262 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 4), (16, 1)],
  term ((744624537722063104168312216835897318400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 5), (15, 1), (16, 1)],
  term ((22627924105836375 : Rat) / 23895050124626771) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((2371474492512830352603073436167318277750103 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1202992736984424524809403647386704266636503 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1585104196949939070394589442496577932800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-14678947031784316524 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-398119416958750399561300533870774931200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-47280598152127858377 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((-1489249075444126208336624433671794636800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-984238336069282207127332295197154640000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((2472345279061196488965894790667067379200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((41943324105432824571 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-22627924105836375 : Rat) / 47790100249253542) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-398119416958750399561300533870774931200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2371474492512830352603073436167318277750103 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 3), (13, 2), (15, 2), (16, 1)],
  term ((7339473515892158262 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 3), (13, 2), (16, 1)],
  term ((744624537722063104168312216835897318400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 3), (13, 3), (15, 1), (16, 1)],
  term ((-9894046412742829623 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (12, 3), (14, 1), (16, 1)],
  term ((-1236172639530598244482947395333533689600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 3), (15, 2), (16, 1)],
  term ((-41943324105432824571 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 3), (16, 1)],
  term ((199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 4), (13, 1), (15, 1), (16, 1)],
  term ((9894046412742829623 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 4), (16, 1)],
  term ((22627924105836375 : Rat) / 23895050124626771) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1412557312010749522970895560070093427200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-22627924105836375 : Rat) / 47790100249253542) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((3480649758846198881818370613367504500297600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 4), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 5), (15, 1), (16, 1)],
  term ((90259506982852130463928517296456956035406 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-702416648434399301031 : Rat) / 11087303257826821744) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2327496078250223394167575670274866998933047 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-288879204506617231197432598291536000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((1832145871195443113184420082271304292020417 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((60244559676251302252777282319028205249355439 : Rat) / 1349660814810636123005926626071864437583984) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((10815217806807859363979934940332508540800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((71891341129359646543473756618587472000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((16422254336897173035 : Rat) / 2771825814456705436) [(7, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((1961093732061061820537040586399750722817035 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-59472724634520162159 : Rat) / 2771825814456705436) [(7, 1), (12, 1), (13, 3), (16, 1)],
  term ((82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-1971904761119404333951168158567408004085835 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((165903094913906876638785592196740320000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 4), (15, 3), (16, 1)],
  term ((-82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 5), (15, 2), (16, 1)],
  term ((9935426435190615603494968120381651939808439 : Rat) / 1349660814810636123005926626071864437583984) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-189601870214836739571890594241600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((10811029058342513414127572167657281268800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((59472724634520162159 : Rat) / 1385912907228352718) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-59519681900743142137532149476158602596903 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((702416648434399301031 : Rat) / 22174606515653643488) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((1971904761119404333951168158567408004085835 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3196158453015372842258025460323355810846113 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 2), (15, 3), (16, 1)],
  term ((165903094913906876638785592196740320000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-65439554104929934674187650255380904000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 191160400997014168) [(7, 1), (12, 2), (13, 3), (16, 1)],
  term ((-26728831958351663458471012076141496000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((-2327496078250223394167575670274866998933047 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-288879204506617231197432598291536000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (14, 1), (15, 3), (16, 1)],
  term ((-9935426435190615603494968120381651939808439 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((94800935107418369785945297120800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (15, 3), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((-5405514529171256707063786083828640634400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((-59472724634520162159 : Rat) / 2771825814456705436) [(7, 1), (12, 3), (13, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1971904761119404333951168158567408004085835 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((-82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 3), (13, 3), (15, 2), (16, 1)],
  term ((-14389928409317076905567890827930124579200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((2327496078250223394167575670274866998933047 : Rat) / 1349660814810636123005926626071864437583984) [(7, 1), (12, 3), (15, 1), (16, 1)],
  term ((144439602253308615598716299145768000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 3), (15, 3), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(7, 1), (12, 4), (13, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 4), (13, 2), (15, 1), (16, 1)],
  term ((7194964204658538452783945413965062289600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 4), (15, 1), (16, 1)],
  term ((9935426435190615603494968120381651939808439 : Rat) / 1349660814810636123005926626071864437583984) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-189601870214836739571890594241600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-180946213101153237864116940551280111581214021 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((90259509732079248579061241088870572538606 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((1651626857229738852256563047678390379949605 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (13, 3), (15, 2), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (15, 4), (16, 1)],
  term ((702416648434399301031 : Rat) / 22174606515653643488) [(7, 1), (13, 3), (16, 1)],
  term ((2166026209777926365022733815314304506192853 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (13, 4), (15, 1), (16, 1)],
  term ((64517870244297118692861063632065680000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (15, 3), (16, 1)],
  term ((47005876892273615047655917789076424000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 5), (15, 2), (16, 1)],
  term ((-16422254336897173035 : Rat) / 5543651628913410872) [(7, 1), (13, 5), (16, 1)],
  term ((-41475773728476719159696398049185080000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 6), (15, 1), (16, 1)],
  term ((1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 1), (13, 4), (15, 2), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 1), (13, 5), (15, 1), (16, 1)],
  term ((-1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 500 through 599. -/
theorem ep_Q2_008_block_29_0500_0599_valid :
    checkProductSumEq ep_Q2_008_partials_29_0500_0599
      ep_Q2_008_block_29_0500_0599 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
