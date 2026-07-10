/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 29:600-699

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 29 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_29_0600_0699 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 600 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0600 : Poly :=
[
  term ((-318383050559337802660518863660563200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 600 for generator 29. -/
def ep_Q2_008_partial_29_0600 : Poly :=
[
  term ((-636766101118675605321037727321126400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((318383050559337802660518863660563200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-636766101118675605321037727321126400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((318383050559337802660518863660563200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 29. -/
theorem ep_Q2_008_partial_29_0600_valid :
    mulPoly ep_Q2_008_coefficient_29_0600
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0601 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 601 for generator 29. -/
def ep_Q2_008_partial_29_0601 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 3), (15, 3), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 29. -/
theorem ep_Q2_008_partial_29_0601_valid :
    mulPoly ep_Q2_008_coefficient_29_0601
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0602 : Poly :=
[
  term ((2189633911586289738 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 602 for generator 29. -/
def ep_Q2_008_partial_29_0602 : Poly :=
[
  term ((4379267823172579476 : Rat) / 692956453614176359) [(7, 2), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(7, 2), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((4379267823172579476 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 29. -/
theorem ep_Q2_008_partial_29_0602_valid :
    mulPoly ep_Q2_008_coefficient_29_0602
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0603 : Poly :=
[
  term ((43022383109528522066169810959989324800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 603 for generator 29. -/
def ep_Q2_008_partial_29_0603 : Poly :=
[
  term ((86044766219057044132339621919978649600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-43022383109528522066169810959989324800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((86044766219057044132339621919978649600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 4), (15, 2), (16, 1)],
  term ((-43022383109528522066169810959989324800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 29. -/
theorem ep_Q2_008_partial_29_0603_valid :
    mulPoly ep_Q2_008_coefficient_29_0603
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0604 : Poly :=
[
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 604 for generator 29. -/
def ep_Q2_008_partial_29_0604 : Poly :=
[
  term ((618025807390458842612109558763660800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((618025807390458842612109558763660800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 29. -/
theorem ep_Q2_008_partial_29_0604_valid :
    mulPoly ep_Q2_008_coefficient_29_0604
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0605 : Poly :=
[
  term ((9249340331398466862 : Rat) / 692956453614176359) [(7, 2), (10, 1), (16, 1)]
]

/-- Partial product 605 for generator 29. -/
def ep_Q2_008_partial_29_0605 : Poly :=
[
  term ((18498680662796933724 : Rat) / 692956453614176359) [(7, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(7, 2), (10, 1), (12, 2), (16, 1)],
  term ((18498680662796933724 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 29. -/
theorem ep_Q2_008_partial_29_0605_valid :
    mulPoly ep_Q2_008_coefficient_29_0605
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0606 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 606 for generator 29. -/
def ep_Q2_008_partial_29_0606 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 29. -/
theorem ep_Q2_008_partial_29_0606_valid :
    mulPoly ep_Q2_008_coefficient_29_0606
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0607 : Poly :=
[
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 607 for generator 29. -/
def ep_Q2_008_partial_29_0607 : Poly :=
[
  term ((2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 29. -/
theorem ep_Q2_008_partial_29_0607_valid :
    mulPoly ep_Q2_008_coefficient_29_0607
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0608 : Poly :=
[
  term ((137442283528279404091557236209171200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 608 for generator 29. -/
def ep_Q2_008_partial_29_0608 : Poly :=
[
  term ((274884567056558808183114472418342400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-137442283528279404091557236209171200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((274884567056558808183114472418342400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-137442283528279404091557236209171200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 29. -/
theorem ep_Q2_008_partial_29_0608_valid :
    mulPoly ep_Q2_008_coefficient_29_0608
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0609 : Poly :=
[
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 609 for generator 29. -/
def ep_Q2_008_partial_29_0609 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 29. -/
theorem ep_Q2_008_partial_29_0609_valid :
    mulPoly ep_Q2_008_coefficient_29_0609
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0610 : Poly :=
[
  term ((88975836768865136833379101033301178988206 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 610 for generator 29. -/
def ep_Q2_008_partial_29_0610 : Poly :=
[
  term ((177951673537730273666758202066602357976412 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-88975836768865136833379101033301178988206 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((177951673537730273666758202066602357976412 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-88975836768865136833379101033301178988206 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 29. -/
theorem ep_Q2_008_partial_29_0610_valid :
    mulPoly ep_Q2_008_coefficient_29_0610
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0611 : Poly :=
[
  term ((17031520896712515146549786521433760000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 611 for generator 29. -/
def ep_Q2_008_partial_29_0611 : Poly :=
[
  term ((34063041793425030293099573042867520000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((-17031520896712515146549786521433760000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((34063041793425030293099573042867520000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-17031520896712515146549786521433760000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 29. -/
theorem ep_Q2_008_partial_29_0611_valid :
    mulPoly ep_Q2_008_coefficient_29_0611
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0612 : Poly :=
[
  term ((-729877970528763246 : Rat) / 692956453614176359) [(7, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 612 for generator 29. -/
def ep_Q2_008_partial_29_0612 : Poly :=
[
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(7, 2), (12, 1), (13, 4), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 2), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(7, 2), (12, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 29. -/
theorem ep_Q2_008_partial_29_0612_valid :
    mulPoly ep_Q2_008_coefficient_29_0612
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0613 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 613 for generator 29. -/
def ep_Q2_008_partial_29_0613 : Poly :=
[
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 5), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 29. -/
theorem ep_Q2_008_partial_29_0613_valid :
    mulPoly ep_Q2_008_coefficient_29_0613
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0614 : Poly :=
[
  term ((70567796665758762834745079158560000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 614 for generator 29. -/
def ep_Q2_008_partial_29_0614 : Poly :=
[
  term ((141135593331517525669490158317120000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-70567796665758762834745079158560000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((141135593331517525669490158317120000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-70567796665758762834745079158560000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 29. -/
theorem ep_Q2_008_partial_29_0614_valid :
    mulPoly ep_Q2_008_coefficient_29_0614
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0615 : Poly :=
[
  term ((-5801287902334596285 : Rat) / 1385912907228352718) [(7, 2), (12, 1), (16, 1)]
]

/-- Partial product 615 for generator 29. -/
def ep_Q2_008_partial_29_0615 : Poly :=
[
  term ((-5801287902334596285 : Rat) / 692956453614176359) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5801287902334596285 : Rat) / 1385912907228352718) [(7, 2), (12, 1), (13, 2), (16, 1)],
  term ((-5801287902334596285 : Rat) / 692956453614176359) [(7, 2), (12, 2), (14, 1), (16, 1)],
  term ((5801287902334596285 : Rat) / 1385912907228352718) [(7, 2), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 29. -/
theorem ep_Q2_008_partial_29_0615_valid :
    mulPoly ep_Q2_008_coefficient_29_0615
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0616 : Poly :=
[
  term ((-4092882842813478937808462146308038400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 616 for generator 29. -/
def ep_Q2_008_partial_29_0616 : Poly :=
[
  term ((-8185765685626957875616924292616076800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((4092882842813478937808462146308038400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-8185765685626957875616924292616076800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4092882842813478937808462146308038400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 29. -/
theorem ep_Q2_008_partial_29_0616_valid :
    mulPoly ep_Q2_008_coefficient_29_0616
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0617 : Poly :=
[
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(7, 2), (12, 2), (16, 1)]
]

/-- Partial product 617 for generator 29. -/
def ep_Q2_008_partial_29_0617 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(7, 2), (12, 2), (13, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(7, 2), (12, 3), (14, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(7, 2), (12, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 29. -/
theorem ep_Q2_008_partial_29_0617_valid :
    mulPoly ep_Q2_008_coefficient_29_0617
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0618 : Poly :=
[
  term ((-1784392528783950943594110424341760507200 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 618 for generator 29. -/
def ep_Q2_008_partial_29_0618 : Poly :=
[
  term ((-3568785057567901887188220848683521014400 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1784392528783950943594110424341760507200 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3568785057567901887188220848683521014400 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((1784392528783950943594110424341760507200 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 29. -/
theorem ep_Q2_008_partial_29_0618_valid :
    mulPoly ep_Q2_008_coefficient_29_0618
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0619 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 619 for generator 29. -/
def ep_Q2_008_partial_29_0619 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (15, 4), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 29. -/
theorem ep_Q2_008_partial_29_0619_valid :
    mulPoly ep_Q2_008_coefficient_29_0619
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0620 : Poly :=
[
  term ((989984288187899092973906904302409600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 620 for generator 29. -/
def ep_Q2_008_partial_29_0620 : Poly :=
[
  term ((1979968576375798185947813808604819200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-989984288187899092973906904302409600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((1979968576375798185947813808604819200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 3), (16, 1)],
  term ((-989984288187899092973906904302409600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 29. -/
theorem ep_Q2_008_partial_29_0620_valid :
    mulPoly ep_Q2_008_coefficient_29_0620
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0621 : Poly :=
[
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (13, 2), (16, 1)]
]

/-- Partial product 621 for generator 29. -/
def ep_Q2_008_partial_29_0621 : Poly :=
[
  term ((2189633911586289738 : Rat) / 692956453614176359) [(7, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (12, 2), (13, 2), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 29. -/
theorem ep_Q2_008_partial_29_0621_valid :
    mulPoly ep_Q2_008_coefficient_29_0621
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0622 : Poly :=
[
  term ((23262702218481313274500279233760464000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 622 for generator 29. -/
def ep_Q2_008_partial_29_0622 : Poly :=
[
  term ((46525404436962626549000558467520928000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-23262702218481313274500279233760464000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((46525404436962626549000558467520928000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 4), (15, 2), (16, 1)],
  term ((-23262702218481313274500279233760464000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 29. -/
theorem ep_Q2_008_partial_29_0622_valid :
    mulPoly ep_Q2_008_coefficient_29_0622
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0623 : Poly :=
[
  term ((9646135385249504655852753427747200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 623 for generator 29. -/
def ep_Q2_008_partial_29_0623 : Poly :=
[
  term ((19292270770499009311705506855494400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9646135385249504655852753427747200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (15, 2), (16, 1)],
  term ((19292270770499009311705506855494400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-9646135385249504655852753427747200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 29. -/
theorem ep_Q2_008_partial_29_0623_valid :
    mulPoly ep_Q2_008_coefficient_29_0623
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0624 : Poly :=
[
  term ((8191824500921831739 : Rat) / 1385912907228352718) [(7, 2), (16, 1)]
]

/-- Partial product 624 for generator 29. -/
def ep_Q2_008_partial_29_0624 : Poly :=
[
  term ((8191824500921831739 : Rat) / 692956453614176359) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-8191824500921831739 : Rat) / 1385912907228352718) [(7, 2), (12, 2), (16, 1)],
  term ((8191824500921831739 : Rat) / 692956453614176359) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8191824500921831739 : Rat) / 1385912907228352718) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 29. -/
theorem ep_Q2_008_partial_29_0624_valid :
    mulPoly ep_Q2_008_coefficient_29_0624
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0625 : Poly :=
[
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 625 for generator 29. -/
def ep_Q2_008_partial_29_0625 : Poly :=
[
  term ((2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 29. -/
theorem ep_Q2_008_partial_29_0625_valid :
    mulPoly ep_Q2_008_coefficient_29_0625
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0626 : Poly :=
[
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 626 for generator 29. -/
def ep_Q2_008_partial_29_0626 : Poly :=
[
  term ((173347716986005055057585559156556800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((173347716986005055057585559156556800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 29. -/
theorem ep_Q2_008_partial_29_0626_valid :
    mulPoly ep_Q2_008_coefficient_29_0626
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0627 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 627 for generator 29. -/
def ep_Q2_008_partial_29_0627 : Poly :=
[
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 29. -/
theorem ep_Q2_008_partial_29_0627_valid :
    mulPoly ep_Q2_008_coefficient_29_0627
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0628 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 628 for generator 29. -/
def ep_Q2_008_partial_29_0628 : Poly :=
[
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 29. -/
theorem ep_Q2_008_partial_29_0628_valid :
    mulPoly ep_Q2_008_coefficient_29_0628
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0629 : Poly :=
[
  term ((72645563906219577282597986735692800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 629 for generator 29. -/
def ep_Q2_008_partial_29_0629 : Poly :=
[
  term ((145291127812439154565195973471385600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-72645563906219577282597986735692800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((145291127812439154565195973471385600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-72645563906219577282597986735692800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 29. -/
theorem ep_Q2_008_partial_29_0629_valid :
    mulPoly ep_Q2_008_coefficient_29_0629
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0630 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 630 for generator 29. -/
def ep_Q2_008_partial_29_0630 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 29. -/
theorem ep_Q2_008_partial_29_0630_valid :
    mulPoly ep_Q2_008_coefficient_29_0630
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0631 : Poly :=
[
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 631 for generator 29. -/
def ep_Q2_008_partial_29_0631 : Poly :=
[
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 3), (15, 2), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 29. -/
theorem ep_Q2_008_partial_29_0631_valid :
    mulPoly ep_Q2_008_coefficient_29_0631
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0632 : Poly :=
[
  term ((-58199920824052489361132523472646400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (15, 1), (16, 1)]
]

/-- Partial product 632 for generator 29. -/
def ep_Q2_008_partial_29_0632 : Poly :=
[
  term ((-116399841648104978722265046945292800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((58199920824052489361132523472646400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 2), (15, 1), (16, 1)],
  term ((-116399841648104978722265046945292800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 1), (15, 2), (16, 1)],
  term ((58199920824052489361132523472646400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 29. -/
theorem ep_Q2_008_partial_29_0632_valid :
    mulPoly ep_Q2_008_coefficient_29_0632
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0633 : Poly :=
[
  term ((-70324786932212700 : Rat) / 692956453614176359) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 633 for generator 29. -/
def ep_Q2_008_partial_29_0633 : Poly :=
[
  term ((-140649573864425400 : Rat) / 692956453614176359) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(8, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-140649573864425400 : Rat) / 692956453614176359) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(8, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 29. -/
theorem ep_Q2_008_partial_29_0633_valid :
    mulPoly ep_Q2_008_coefficient_29_0633
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0634 : Poly :=
[
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 634 for generator 29. -/
def ep_Q2_008_partial_29_0634 : Poly :=
[
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 1), (13, 3), (15, 2), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 29. -/
theorem ep_Q2_008_partial_29_0634_valid :
    mulPoly ep_Q2_008_coefficient_29_0634
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0635 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(8, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 635 for generator 29. -/
def ep_Q2_008_partial_29_0635 : Poly :=
[
  term ((13891959801170136000 : Rat) / 692956453614176359) [(8, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(8, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(8, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(8, 1), (10, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 29. -/
theorem ep_Q2_008_partial_29_0635_valid :
    mulPoly ep_Q2_008_coefficient_29_0635
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0636 : Poly :=
[
  term ((-1969850932679345625 : Rat) / 2771825814456705436) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 636 for generator 29. -/
def ep_Q2_008_partial_29_0636 : Poly :=
[
  term ((-1969850932679345625 : Rat) / 1385912907228352718) [(8, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1969850932679345625 : Rat) / 2771825814456705436) [(8, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-1969850932679345625 : Rat) / 1385912907228352718) [(8, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1969850932679345625 : Rat) / 2771825814456705436) [(8, 1), (11, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 29. -/
theorem ep_Q2_008_partial_29_0636_valid :
    mulPoly ep_Q2_008_coefficient_29_0636
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0637 : Poly :=
[
  term ((-1387039924178296875 : Rat) / 5543651628913410872) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 637 for generator 29. -/
def ep_Q2_008_partial_29_0637 : Poly :=
[
  term ((-1387039924178296875 : Rat) / 2771825814456705436) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1387039924178296875 : Rat) / 5543651628913410872) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1387039924178296875 : Rat) / 2771825814456705436) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1387039924178296875 : Rat) / 5543651628913410872) [(8, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 29. -/
theorem ep_Q2_008_partial_29_0637_valid :
    mulPoly ep_Q2_008_coefficient_29_0637
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0638 : Poly :=
[
  term ((1498262336125082331259894946679368419200 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 638 for generator 29. -/
def ep_Q2_008_partial_29_0638 : Poly :=
[
  term ((2996524672250164662519789893358736838400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1498262336125082331259894946679368419200 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((2996524672250164662519789893358736838400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1498262336125082331259894946679368419200 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 29. -/
theorem ep_Q2_008_partial_29_0638_valid :
    mulPoly ep_Q2_008_coefficient_29_0638
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0639 : Poly :=
[
  term ((19058214854956896000 : Rat) / 692956453614176359) [(8, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 639 for generator 29. -/
def ep_Q2_008_partial_29_0639 : Poly :=
[
  term ((38116429709913792000 : Rat) / 692956453614176359) [(8, 1), (11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(8, 1), (11, 1), (12, 2), (13, 3), (16, 1)],
  term ((38116429709913792000 : Rat) / 692956453614176359) [(8, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(8, 1), (11, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 29. -/
theorem ep_Q2_008_partial_29_0639_valid :
    mulPoly ep_Q2_008_coefficient_29_0639
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0640 : Poly :=
[
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(8, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 640 for generator 29. -/
def ep_Q2_008_partial_29_0640 : Poly :=
[
  term ((3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(8, 1), (11, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(8, 1), (11, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(8, 1), (11, 1), (13, 5), (15, 2), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(8, 1), (11, 1), (13, 6), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 29. -/
theorem ep_Q2_008_partial_29_0640_valid :
    mulPoly ep_Q2_008_coefficient_29_0640
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0641 : Poly :=
[
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 641 for generator 29. -/
def ep_Q2_008_partial_29_0641 : Poly :=
[
  term ((11020747726338080733 : Rat) / 2771825814456705436) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(8, 1), (11, 2), (12, 2), (16, 1)],
  term ((11020747726338080733 : Rat) / 2771825814456705436) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(8, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 29. -/
theorem ep_Q2_008_partial_29_0641_valid :
    mulPoly ep_Q2_008_coefficient_29_0641
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0642 : Poly :=
[
  term ((-14950744787709303129050138340319920107025 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 642 for generator 29. -/
def ep_Q2_008_partial_29_0642 : Poly :=
[
  term ((-29901489575418606258100276680639840214050 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((14950744787709303129050138340319920107025 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-29901489575418606258100276680639840214050 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14950744787709303129050138340319920107025 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 29. -/
theorem ep_Q2_008_partial_29_0642_valid :
    mulPoly ep_Q2_008_coefficient_29_0642
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0643 : Poly :=
[
  term ((35162393466106350 : Rat) / 692956453614176359) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 643 for generator 29. -/
def ep_Q2_008_partial_29_0643 : Poly :=
[
  term ((70324786932212700 : Rat) / 692956453614176359) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35162393466106350 : Rat) / 692956453614176359) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((-35162393466106350 : Rat) / 692956453614176359) [(8, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 29. -/
theorem ep_Q2_008_partial_29_0643_valid :
    mulPoly ep_Q2_008_coefficient_29_0643
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0644 : Poly :=
[
  term ((-3988922053075555626108933898896416534175 : Rat) / 168707601851329515375740828258983054697998) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 644 for generator 29. -/
def ep_Q2_008_partial_29_0644 : Poly :=
[
  term ((-3988922053075555626108933898896416534175 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3988922053075555626108933898896416534175 : Rat) / 168707601851329515375740828258983054697998) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3988922053075555626108933898896416534175 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((3988922053075555626108933898896416534175 : Rat) / 168707601851329515375740828258983054697998) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 29. -/
theorem ep_Q2_008_partial_29_0644_valid :
    mulPoly ep_Q2_008_coefficient_29_0644
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0645 : Poly :=
[
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 645 for generator 29. -/
def ep_Q2_008_partial_29_0645 : Poly :=
[
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (13, 3), (15, 3), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 29. -/
theorem ep_Q2_008_partial_29_0645_valid :
    mulPoly ep_Q2_008_coefficient_29_0645
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0646 : Poly :=
[
  term ((-52553723233734477915 : Rat) / 5543651628913410872) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 646 for generator 29. -/
def ep_Q2_008_partial_29_0646 : Poly :=
[
  term ((-52553723233734477915 : Rat) / 2771825814456705436) [(8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((52553723233734477915 : Rat) / 5543651628913410872) [(8, 1), (12, 2), (13, 2), (16, 1)],
  term ((-52553723233734477915 : Rat) / 2771825814456705436) [(8, 1), (13, 3), (15, 1), (16, 1)],
  term ((52553723233734477915 : Rat) / 5543651628913410872) [(8, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 29. -/
theorem ep_Q2_008_partial_29_0646_valid :
    mulPoly ep_Q2_008_coefficient_29_0646
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0647 : Poly :=
[
  term ((25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 647 for generator 29. -/
def ep_Q2_008_partial_29_0647 : Poly :=
[
  term ((51697186090388729760460611996644561971200 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((51697186090388729760460611996644561971200 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (13, 4), (15, 2), (16, 1)],
  term ((-25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 29. -/
theorem ep_Q2_008_partial_29_0647_valid :
    mulPoly ep_Q2_008_coefficient_29_0647
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0648 : Poly :=
[
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 648 for generator 29. -/
def ep_Q2_008_partial_29_0648 : Poly :=
[
  term ((-11020747726338080733 : Rat) / 2771825814456705436) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-11020747726338080733 : Rat) / 2771825814456705436) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 29. -/
theorem ep_Q2_008_partial_29_0648_valid :
    mulPoly ep_Q2_008_coefficient_29_0648
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0649 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 649 for generator 29. -/
def ep_Q2_008_partial_29_0649 : Poly :=
[
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(9, 1), (10, 1), (12, 1), (13, 3), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(9, 1), (10, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 29. -/
theorem ep_Q2_008_partial_29_0649_valid :
    mulPoly ep_Q2_008_coefficient_29_0649
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0650 : Poly :=
[
  term ((15881322831892412733 : Rat) / 5543651628913410872) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 650 for generator 29. -/
def ep_Q2_008_partial_29_0650 : Poly :=
[
  term ((15881322831892412733 : Rat) / 2771825814456705436) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-15881322831892412733 : Rat) / 5543651628913410872) [(9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((15881322831892412733 : Rat) / 2771825814456705436) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-15881322831892412733 : Rat) / 5543651628913410872) [(9, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 29. -/
theorem ep_Q2_008_partial_29_0650_valid :
    mulPoly ep_Q2_008_coefficient_29_0650
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0651 : Poly :=
[
  term ((670900164047368156987703685423339033600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 651 for generator 29. -/
def ep_Q2_008_partial_29_0651 : Poly :=
[
  term ((1341800328094736313975407370846678067200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-670900164047368156987703685423339033600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((1341800328094736313975407370846678067200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-670900164047368156987703685423339033600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (10, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 29. -/
theorem ep_Q2_008_partial_29_0651_valid :
    mulPoly ep_Q2_008_coefficient_29_0651
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0652 : Poly :=
[
  term ((-2169162500172450488247598632102707452800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 652 for generator 29. -/
def ep_Q2_008_partial_29_0652 : Poly :=
[
  term ((-4338325000344900976495197264205414905600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((2169162500172450488247598632102707452800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4338325000344900976495197264205414905600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2169162500172450488247598632102707452800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 29. -/
theorem ep_Q2_008_partial_29_0652_valid :
    mulPoly ep_Q2_008_coefficient_29_0652
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0653 : Poly :=
[
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 653 for generator 29. -/
def ep_Q2_008_partial_29_0653 : Poly :=
[
  term ((-38116429709913792000 : Rat) / 692956453614176359) [(9, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(9, 1), (11, 1), (12, 1), (13, 4), (16, 1)],
  term ((-38116429709913792000 : Rat) / 692956453614176359) [(9, 1), (11, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(9, 1), (11, 1), (12, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 29. -/
theorem ep_Q2_008_partial_29_0653_valid :
    mulPoly ep_Q2_008_coefficient_29_0653
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0654 : Poly :=
[
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(9, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 654 for generator 29. -/
def ep_Q2_008_partial_29_0654 : Poly :=
[
  term ((-3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(9, 1), (11, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(9, 1), (11, 1), (12, 1), (13, 5), (15, 1), (16, 1)],
  term ((-3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(9, 1), (11, 1), (12, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(9, 1), (11, 1), (12, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 29. -/
theorem ep_Q2_008_partial_29_0654_valid :
    mulPoly ep_Q2_008_coefficient_29_0654
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0655 : Poly :=
[
  term ((-7487990474948827929 : Rat) / 2771825814456705436) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 655 for generator 29. -/
def ep_Q2_008_partial_29_0655 : Poly :=
[
  term ((-7487990474948827929 : Rat) / 1385912907228352718) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7487990474948827929 : Rat) / 2771825814456705436) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-7487990474948827929 : Rat) / 1385912907228352718) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((7487990474948827929 : Rat) / 2771825814456705436) [(9, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 29. -/
theorem ep_Q2_008_partial_29_0655_valid :
    mulPoly ep_Q2_008_coefficient_29_0655
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0656 : Poly :=
[
  term ((1969850932679345625 : Rat) / 2771825814456705436) [(9, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 656 for generator 29. -/
def ep_Q2_008_partial_29_0656 : Poly :=
[
  term ((1969850932679345625 : Rat) / 1385912907228352718) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1969850932679345625 : Rat) / 2771825814456705436) [(9, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((1969850932679345625 : Rat) / 1385912907228352718) [(9, 1), (11, 1), (12, 3), (14, 1), (16, 1)],
  term ((-1969850932679345625 : Rat) / 2771825814456705436) [(9, 1), (11, 1), (12, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 29. -/
theorem ep_Q2_008_partial_29_0656_valid :
    mulPoly ep_Q2_008_coefficient_29_0656
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0657 : Poly :=
[
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 657 for generator 29. -/
def ep_Q2_008_partial_29_0657 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 29. -/
theorem ep_Q2_008_partial_29_0657_valid :
    mulPoly ep_Q2_008_coefficient_29_0657
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0658 : Poly :=
[
  term ((15328078262978619483 : Rat) / 5543651628913410872) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 658 for generator 29. -/
def ep_Q2_008_partial_29_0658 : Poly :=
[
  term ((15328078262978619483 : Rat) / 2771825814456705436) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-15328078262978619483 : Rat) / 5543651628913410872) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((15328078262978619483 : Rat) / 2771825814456705436) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15328078262978619483 : Rat) / 5543651628913410872) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 29. -/
theorem ep_Q2_008_partial_29_0658_valid :
    mulPoly ep_Q2_008_coefficient_29_0658
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0659 : Poly :=
[
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 659 for generator 29. -/
def ep_Q2_008_partial_29_0659 : Poly :=
[
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 29. -/
theorem ep_Q2_008_partial_29_0659_valid :
    mulPoly ep_Q2_008_coefficient_29_0659
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0660 : Poly :=
[
  term ((52553723233734477915 : Rat) / 5543651628913410872) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 660 for generator 29. -/
def ep_Q2_008_partial_29_0660 : Poly :=
[
  term ((52553723233734477915 : Rat) / 2771825814456705436) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-52553723233734477915 : Rat) / 5543651628913410872) [(9, 1), (12, 1), (13, 3), (16, 1)],
  term ((52553723233734477915 : Rat) / 2771825814456705436) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-52553723233734477915 : Rat) / 5543651628913410872) [(9, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 29. -/
theorem ep_Q2_008_partial_29_0660_valid :
    mulPoly ep_Q2_008_coefficient_29_0660
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0661 : Poly :=
[
  term ((-25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 661 for generator 29. -/
def ep_Q2_008_partial_29_0661 : Poly :=
[
  term ((-51697186090388729760460611996644561971200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-51697186090388729760460611996644561971200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 29. -/
theorem ep_Q2_008_partial_29_0661_valid :
    mulPoly ep_Q2_008_coefficient_29_0661
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0662 : Poly :=
[
  term ((4518899647857926932409945198887795199775 : Rat) / 168707601851329515375740828258983054697998) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 662 for generator 29. -/
def ep_Q2_008_partial_29_0662 : Poly :=
[
  term ((4518899647857926932409945198887795199775 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4518899647857926932409945198887795199775 : Rat) / 168707601851329515375740828258983054697998) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((4518899647857926932409945198887795199775 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4518899647857926932409945198887795199775 : Rat) / 168707601851329515375740828258983054697998) [(9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 29. -/
theorem ep_Q2_008_partial_29_0662_valid :
    mulPoly ep_Q2_008_coefficient_29_0662
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0663 : Poly :=
[
  term ((14931201290749033485079614770147991351825 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 663 for generator 29. -/
def ep_Q2_008_partial_29_0663 : Poly :=
[
  term ((29862402581498066970159229540295982703650 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-14931201290749033485079614770147991351825 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((29862402581498066970159229540295982703650 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-14931201290749033485079614770147991351825 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 29. -/
theorem ep_Q2_008_partial_29_0663_valid :
    mulPoly ep_Q2_008_coefficient_29_0663
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0664 : Poly :=
[
  term ((45601492907295835931221663734500428800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 664 for generator 29. -/
def ep_Q2_008_partial_29_0664 : Poly :=
[
  term ((91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-45601492907295835931221663734500428800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-45601492907295835931221663734500428800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 29. -/
theorem ep_Q2_008_partial_29_0664_valid :
    mulPoly ep_Q2_008_coefficient_29_0664
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0665 : Poly :=
[
  term ((-27438948507301718505 : Rat) / 5543651628913410872) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 665 for generator 29. -/
def ep_Q2_008_partial_29_0665 : Poly :=
[
  term ((-27438948507301718505 : Rat) / 2771825814456705436) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((27438948507301718505 : Rat) / 5543651628913410872) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-27438948507301718505 : Rat) / 2771825814456705436) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((27438948507301718505 : Rat) / 5543651628913410872) [(9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 29. -/
theorem ep_Q2_008_partial_29_0665_valid :
    mulPoly ep_Q2_008_coefficient_29_0665
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0666 : Poly :=
[
  term ((-639171020097586079831235697983117561600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 666 for generator 29. -/
def ep_Q2_008_partial_29_0666 : Poly :=
[
  term ((-1278342040195172159662471395966235123200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((639171020097586079831235697983117561600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1278342040195172159662471395966235123200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 3), (15, 2), (16, 1)],
  term ((639171020097586079831235697983117561600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 29. -/
theorem ep_Q2_008_partial_29_0666_valid :
    mulPoly ep_Q2_008_coefficient_29_0666
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0667 : Poly :=
[
  term ((9257866479762337468382235231652979733225 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 667 for generator 29. -/
def ep_Q2_008_partial_29_0667 : Poly :=
[
  term ((18515732959524674936764470463305959466450 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9257866479762337468382235231652979733225 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((18515732959524674936764470463305959466450 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9257866479762337468382235231652979733225 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 29. -/
theorem ep_Q2_008_partial_29_0667_valid :
    mulPoly ep_Q2_008_coefficient_29_0667
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0668 : Poly :=
[
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 668 for generator 29. -/
def ep_Q2_008_partial_29_0668 : Poly :=
[
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 29. -/
theorem ep_Q2_008_partial_29_0668_valid :
    mulPoly ep_Q2_008_coefficient_29_0668
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0669 : Poly :=
[
  term ((70324786932212700 : Rat) / 692956453614176359) [(9, 2), (12, 1), (16, 1)]
]

/-- Partial product 669 for generator 29. -/
def ep_Q2_008_partial_29_0669 : Poly :=
[
  term ((140649573864425400 : Rat) / 692956453614176359) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(9, 2), (12, 1), (13, 2), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(9, 2), (12, 2), (14, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(9, 2), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 29. -/
theorem ep_Q2_008_partial_29_0669_valid :
    mulPoly ep_Q2_008_coefficient_29_0669
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0670 : Poly :=
[
  term ((14407660754757465750 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 670 for generator 29. -/
def ep_Q2_008_partial_29_0670 : Poly :=
[
  term ((28815321509514931500 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14407660754757465750 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((28815321509514931500 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-14407660754757465750 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 29. -/
theorem ep_Q2_008_partial_29_0670_valid :
    mulPoly ep_Q2_008_coefficient_29_0670
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0671 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 671 for generator 29. -/
def ep_Q2_008_partial_29_0671 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 29. -/
theorem ep_Q2_008_partial_29_0671_valid :
    mulPoly ep_Q2_008_coefficient_29_0671
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0672 : Poly :=
[
  term ((-4405415424679459125 : Rat) / 692956453614176359) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 672 for generator 29. -/
def ep_Q2_008_partial_29_0672 : Poly :=
[
  term ((-8810830849358918250 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4405415424679459125 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-8810830849358918250 : Rat) / 692956453614176359) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((4405415424679459125 : Rat) / 692956453614176359) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 29. -/
theorem ep_Q2_008_partial_29_0672_valid :
    mulPoly ep_Q2_008_coefficient_29_0672
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0673 : Poly :=
[
  term ((-135082901948150803438204354258944007200300 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 673 for generator 29. -/
def ep_Q2_008_partial_29_0673 : Poly :=
[
  term ((-270165803896301606876408708517888014400600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((135082901948150803438204354258944007200300 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-270165803896301606876408708517888014400600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((135082901948150803438204354258944007200300 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 29. -/
theorem ep_Q2_008_partial_29_0673_valid :
    mulPoly ep_Q2_008_coefficient_29_0673
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0674 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 674 for generator 29. -/
def ep_Q2_008_partial_29_0674 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (13, 4), (15, 3), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (13, 5), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 29. -/
theorem ep_Q2_008_partial_29_0674_valid :
    mulPoly ep_Q2_008_coefficient_29_0674
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0675 : Poly :=
[
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 675 for generator 29. -/
def ep_Q2_008_partial_29_0675 : Poly :=
[
  term ((-57174644564870688000 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 2), (13, 3), (16, 1)],
  term ((-57174644564870688000 : Rat) / 692956453614176359) [(10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(10, 1), (11, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 29. -/
theorem ep_Q2_008_partial_29_0675_valid :
    mulPoly ep_Q2_008_coefficient_29_0675
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0676 : Poly :=
[
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 676 for generator 29. -/
def ep_Q2_008_partial_29_0676 : Poly :=
[
  term ((-4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((-4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (13, 5), (15, 2), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (13, 6), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 29. -/
theorem ep_Q2_008_partial_29_0676_valid :
    mulPoly ep_Q2_008_coefficient_29_0676
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0677 : Poly :=
[
  term ((2359089816788204244746876105150370929618400 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 677 for generator 29. -/
def ep_Q2_008_partial_29_0677 : Poly :=
[
  term ((4718179633576408489493752210300741859236800 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2359089816788204244746876105150370929618400 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((4718179633576408489493752210300741859236800 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2359089816788204244746876105150370929618400 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 29. -/
theorem ep_Q2_008_partial_29_0677_valid :
    mulPoly ep_Q2_008_coefficient_29_0677
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0678 : Poly :=
[
  term ((43639609385923547517 : Rat) / 5543651628913410872) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 678 for generator 29. -/
def ep_Q2_008_partial_29_0678 : Poly :=
[
  term ((43639609385923547517 : Rat) / 2771825814456705436) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43639609385923547517 : Rat) / 5543651628913410872) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((43639609385923547517 : Rat) / 2771825814456705436) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-43639609385923547517 : Rat) / 5543651628913410872) [(10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 29. -/
theorem ep_Q2_008_partial_29_0678_valid :
    mulPoly ep_Q2_008_coefficient_29_0678
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0679 : Poly :=
[
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(10, 1), (12, 2), (16, 1)]
]

/-- Partial product 679 for generator 29. -/
def ep_Q2_008_partial_29_0679 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3472989950292534000 : Rat) / 692956453614176359) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(10, 1), (12, 3), (14, 1), (16, 1)],
  term ((3472989950292534000 : Rat) / 692956453614176359) [(10, 1), (12, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 29. -/
theorem ep_Q2_008_partial_29_0679_valid :
    mulPoly ep_Q2_008_coefficient_29_0679
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0680 : Poly :=
[
  term ((3300136864467900161385498570310483655503521 : Rat) / 168707601851329515375740828258983054697998) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 680 for generator 29. -/
def ep_Q2_008_partial_29_0680 : Poly :=
[
  term ((3300136864467900161385498570310483655503521 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3300136864467900161385498570310483655503521 : Rat) / 168707601851329515375740828258983054697998) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3300136864467900161385498570310483655503521 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3300136864467900161385498570310483655503521 : Rat) / 168707601851329515375740828258983054697998) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 29. -/
theorem ep_Q2_008_partial_29_0680_valid :
    mulPoly ep_Q2_008_coefficient_29_0680
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0681 : Poly :=
[
  term ((-68739760949453755788287373618514797702000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 681 for generator 29. -/
def ep_Q2_008_partial_29_0681 : Poly :=
[
  term ((-137479521898907511576574747237029595404000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((68739760949453755788287373618514797702000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-137479521898907511576574747237029595404000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (15, 3), (16, 1)],
  term ((68739760949453755788287373618514797702000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 29. -/
theorem ep_Q2_008_partial_29_0681_valid :
    mulPoly ep_Q2_008_coefficient_29_0681
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0682 : Poly :=
[
  term ((34908231472253687196 : Rat) / 692956453614176359) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 682 for generator 29. -/
def ep_Q2_008_partial_29_0682 : Poly :=
[
  term ((69816462944507374392 : Rat) / 692956453614176359) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-34908231472253687196 : Rat) / 692956453614176359) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((69816462944507374392 : Rat) / 692956453614176359) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-34908231472253687196 : Rat) / 692956453614176359) [(10, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 29. -/
theorem ep_Q2_008_partial_29_0682_valid :
    mulPoly ep_Q2_008_coefficient_29_0682
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0683 : Poly :=
[
  term ((-24296130796041599212898495414494614144000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 683 for generator 29. -/
def ep_Q2_008_partial_29_0683 : Poly :=
[
  term ((-48592261592083198425796990828989228288000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((24296130796041599212898495414494614144000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-48592261592083198425796990828989228288000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 4), (15, 2), (16, 1)],
  term ((24296130796041599212898495414494614144000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 29. -/
theorem ep_Q2_008_partial_29_0683_valid :
    mulPoly ep_Q2_008_coefficient_29_0683
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0684 : Poly :=
[
  term ((328820160020985918990474499576661073591600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 684 for generator 29. -/
def ep_Q2_008_partial_29_0684 : Poly :=
[
  term ((657640320041971837980948999153322147183200 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-328820160020985918990474499576661073591600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((657640320041971837980948999153322147183200 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-328820160020985918990474499576661073591600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 29. -/
theorem ep_Q2_008_partial_29_0684_valid :
    mulPoly ep_Q2_008_coefficient_29_0684
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0685 : Poly :=
[
  term ((5623262052905386233 : Rat) / 5543651628913410872) [(10, 1), (16, 1)]
]

/-- Partial product 685 for generator 29. -/
def ep_Q2_008_partial_29_0685 : Poly :=
[
  term ((5623262052905386233 : Rat) / 2771825814456705436) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5623262052905386233 : Rat) / 5543651628913410872) [(10, 1), (12, 2), (16, 1)],
  term ((5623262052905386233 : Rat) / 2771825814456705436) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5623262052905386233 : Rat) / 5543651628913410872) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 29. -/
theorem ep_Q2_008_partial_29_0685_valid :
    mulPoly ep_Q2_008_coefficient_29_0685
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0686 : Poly :=
[
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(10, 2), (13, 2), (16, 1)]
]

/-- Partial product 686 for generator 29. -/
def ep_Q2_008_partial_29_0686 : Poly :=
[
  term ((-27783919602340272000 : Rat) / 692956453614176359) [(10, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(10, 2), (12, 2), (13, 2), (16, 1)],
  term ((-27783919602340272000 : Rat) / 692956453614176359) [(10, 2), (13, 3), (15, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(10, 2), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 29. -/
theorem ep_Q2_008_partial_29_0686_valid :
    mulPoly ep_Q2_008_coefficient_29_0686
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0687 : Poly :=
[
  term ((11020747726338080733 : Rat) / 11087303257826821744) [(10, 2), (16, 1)]
]

/-- Partial product 687 for generator 29. -/
def ep_Q2_008_partial_29_0687 : Poly :=
[
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 11087303257826821744) [(10, 2), (12, 2), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 11087303257826821744) [(10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 29. -/
theorem ep_Q2_008_partial_29_0687_valid :
    mulPoly ep_Q2_008_coefficient_29_0687
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0688 : Poly :=
[
  term ((2491051367392388226986277875993772303600 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 688 for generator 29. -/
def ep_Q2_008_partial_29_0688 : Poly :=
[
  term ((4982102734784776453972555751987544607200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-2491051367392388226986277875993772303600 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((4982102734784776453972555751987544607200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2491051367392388226986277875993772303600 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 29. -/
theorem ep_Q2_008_partial_29_0688_valid :
    mulPoly ep_Q2_008_coefficient_29_0688
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0689 : Poly :=
[
  term ((-49391761798543181409 : Rat) / 2771825814456705436) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 689 for generator 29. -/
def ep_Q2_008_partial_29_0689 : Poly :=
[
  term ((-49391761798543181409 : Rat) / 1385912907228352718) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((49391761798543181409 : Rat) / 2771825814456705436) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-49391761798543181409 : Rat) / 1385912907228352718) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((49391761798543181409 : Rat) / 2771825814456705436) [(11, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 29. -/
theorem ep_Q2_008_partial_29_0689_valid :
    mulPoly ep_Q2_008_coefficient_29_0689
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0690 : Poly :=
[
  term ((6586365436385558078478250633051330537431600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 690 for generator 29. -/
def ep_Q2_008_partial_29_0690 : Poly :=
[
  term ((13172730872771116156956501266102661074863200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-6586365436385558078478250633051330537431600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((13172730872771116156956501266102661074863200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6586365436385558078478250633051330537431600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 29. -/
theorem ep_Q2_008_partial_29_0690_valid :
    mulPoly ep_Q2_008_coefficient_29_0690
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0691 : Poly :=
[
  term ((4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 691 for generator 29. -/
def ep_Q2_008_partial_29_0691 : Poly :=
[
  term ((8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 4), (15, 3), (16, 1)],
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 5), (15, 2), (16, 1)],
  term ((8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 3), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 29. -/
theorem ep_Q2_008_partial_29_0691_valid :
    mulPoly ep_Q2_008_coefficient_29_0691
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0692 : Poly :=
[
  term ((-4556925335766843166221006196823813410283859 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 692 for generator 29. -/
def ep_Q2_008_partial_29_0692 : Poly :=
[
  term ((-4556925335766843166221006196823813410283859 : Rat) / 337415203702659030751481656517966109395996) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4556925335766843166221006196823813410283859 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4556925335766843166221006196823813410283859 : Rat) / 337415203702659030751481656517966109395996) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((4556925335766843166221006196823813410283859 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 29. -/
theorem ep_Q2_008_partial_29_0692_valid :
    mulPoly ep_Q2_008_coefficient_29_0692
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0693 : Poly :=
[
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(11, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 693 for generator 29. -/
def ep_Q2_008_partial_29_0693 : Poly :=
[
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(11, 1), (12, 2), (13, 3), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(11, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(11, 1), (12, 4), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 29. -/
theorem ep_Q2_008_partial_29_0693_valid :
    mulPoly ep_Q2_008_coefficient_29_0693
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0694 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 694 for generator 29. -/
def ep_Q2_008_partial_29_0694 : Poly :=
[
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 4), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 29. -/
theorem ep_Q2_008_partial_29_0694_valid :
    mulPoly ep_Q2_008_coefficient_29_0694
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0695 : Poly :=
[
  term ((-1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 695 for generator 29. -/
def ep_Q2_008_partial_29_0695 : Poly :=
[
  term ((-2433458103623531960966527699108306234800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-2433458103623531960966527699108306234800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 29. -/
theorem ep_Q2_008_partial_29_0695_valid :
    mulPoly ep_Q2_008_coefficient_29_0695
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0696 : Poly :=
[
  term ((586722390752031212541692105881017920517600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 696 for generator 29. -/
def ep_Q2_008_partial_29_0696 : Poly :=
[
  term ((1173444781504062425083384211762035841035200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-586722390752031212541692105881017920517600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((1173444781504062425083384211762035841035200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-586722390752031212541692105881017920517600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 29. -/
theorem ep_Q2_008_partial_29_0696_valid :
    mulPoly ep_Q2_008_coefficient_29_0696
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0697 : Poly :=
[
  term ((14570828880554329875 : Rat) / 5543651628913410872) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 697 for generator 29. -/
def ep_Q2_008_partial_29_0697 : Poly :=
[
  term ((14570828880554329875 : Rat) / 2771825814456705436) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14570828880554329875 : Rat) / 5543651628913410872) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((14570828880554329875 : Rat) / 2771825814456705436) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14570828880554329875 : Rat) / 5543651628913410872) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 29. -/
theorem ep_Q2_008_partial_29_0697_valid :
    mulPoly ep_Q2_008_coefficient_29_0697
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0698 : Poly :=
[
  term ((2670258576145951722200874926746736740821300 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 698 for generator 29. -/
def ep_Q2_008_partial_29_0698 : Poly :=
[
  term ((5340517152291903444401749853493473481642600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2670258576145951722200874926746736740821300 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((5340517152291903444401749853493473481642600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-2670258576145951722200874926746736740821300 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 29. -/
theorem ep_Q2_008_partial_29_0698_valid :
    mulPoly ep_Q2_008_coefficient_29_0698
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0699 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 699 for generator 29. -/
def ep_Q2_008_partial_29_0699 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 2), (15, 3), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (15, 4), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 29. -/
theorem ep_Q2_008_partial_29_0699_valid :
    mulPoly ep_Q2_008_coefficient_29_0699
        ep_Q2_008_generator_29_0600_0699 =
      ep_Q2_008_partial_29_0699 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_29_0600_0699 : List Poly :=
[
  ep_Q2_008_partial_29_0600,
  ep_Q2_008_partial_29_0601,
  ep_Q2_008_partial_29_0602,
  ep_Q2_008_partial_29_0603,
  ep_Q2_008_partial_29_0604,
  ep_Q2_008_partial_29_0605,
  ep_Q2_008_partial_29_0606,
  ep_Q2_008_partial_29_0607,
  ep_Q2_008_partial_29_0608,
  ep_Q2_008_partial_29_0609,
  ep_Q2_008_partial_29_0610,
  ep_Q2_008_partial_29_0611,
  ep_Q2_008_partial_29_0612,
  ep_Q2_008_partial_29_0613,
  ep_Q2_008_partial_29_0614,
  ep_Q2_008_partial_29_0615,
  ep_Q2_008_partial_29_0616,
  ep_Q2_008_partial_29_0617,
  ep_Q2_008_partial_29_0618,
  ep_Q2_008_partial_29_0619,
  ep_Q2_008_partial_29_0620,
  ep_Q2_008_partial_29_0621,
  ep_Q2_008_partial_29_0622,
  ep_Q2_008_partial_29_0623,
  ep_Q2_008_partial_29_0624,
  ep_Q2_008_partial_29_0625,
  ep_Q2_008_partial_29_0626,
  ep_Q2_008_partial_29_0627,
  ep_Q2_008_partial_29_0628,
  ep_Q2_008_partial_29_0629,
  ep_Q2_008_partial_29_0630,
  ep_Q2_008_partial_29_0631,
  ep_Q2_008_partial_29_0632,
  ep_Q2_008_partial_29_0633,
  ep_Q2_008_partial_29_0634,
  ep_Q2_008_partial_29_0635,
  ep_Q2_008_partial_29_0636,
  ep_Q2_008_partial_29_0637,
  ep_Q2_008_partial_29_0638,
  ep_Q2_008_partial_29_0639,
  ep_Q2_008_partial_29_0640,
  ep_Q2_008_partial_29_0641,
  ep_Q2_008_partial_29_0642,
  ep_Q2_008_partial_29_0643,
  ep_Q2_008_partial_29_0644,
  ep_Q2_008_partial_29_0645,
  ep_Q2_008_partial_29_0646,
  ep_Q2_008_partial_29_0647,
  ep_Q2_008_partial_29_0648,
  ep_Q2_008_partial_29_0649,
  ep_Q2_008_partial_29_0650,
  ep_Q2_008_partial_29_0651,
  ep_Q2_008_partial_29_0652,
  ep_Q2_008_partial_29_0653,
  ep_Q2_008_partial_29_0654,
  ep_Q2_008_partial_29_0655,
  ep_Q2_008_partial_29_0656,
  ep_Q2_008_partial_29_0657,
  ep_Q2_008_partial_29_0658,
  ep_Q2_008_partial_29_0659,
  ep_Q2_008_partial_29_0660,
  ep_Q2_008_partial_29_0661,
  ep_Q2_008_partial_29_0662,
  ep_Q2_008_partial_29_0663,
  ep_Q2_008_partial_29_0664,
  ep_Q2_008_partial_29_0665,
  ep_Q2_008_partial_29_0666,
  ep_Q2_008_partial_29_0667,
  ep_Q2_008_partial_29_0668,
  ep_Q2_008_partial_29_0669,
  ep_Q2_008_partial_29_0670,
  ep_Q2_008_partial_29_0671,
  ep_Q2_008_partial_29_0672,
  ep_Q2_008_partial_29_0673,
  ep_Q2_008_partial_29_0674,
  ep_Q2_008_partial_29_0675,
  ep_Q2_008_partial_29_0676,
  ep_Q2_008_partial_29_0677,
  ep_Q2_008_partial_29_0678,
  ep_Q2_008_partial_29_0679,
  ep_Q2_008_partial_29_0680,
  ep_Q2_008_partial_29_0681,
  ep_Q2_008_partial_29_0682,
  ep_Q2_008_partial_29_0683,
  ep_Q2_008_partial_29_0684,
  ep_Q2_008_partial_29_0685,
  ep_Q2_008_partial_29_0686,
  ep_Q2_008_partial_29_0687,
  ep_Q2_008_partial_29_0688,
  ep_Q2_008_partial_29_0689,
  ep_Q2_008_partial_29_0690,
  ep_Q2_008_partial_29_0691,
  ep_Q2_008_partial_29_0692,
  ep_Q2_008_partial_29_0693,
  ep_Q2_008_partial_29_0694,
  ep_Q2_008_partial_29_0695,
  ep_Q2_008_partial_29_0696,
  ep_Q2_008_partial_29_0697,
  ep_Q2_008_partial_29_0698,
  ep_Q2_008_partial_29_0699
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_29_0600_0699 : Poly :=
[
  term ((-636766101118675605321037727321126400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((4379267823172579476 : Rat) / 692956453614176359) [(7, 2), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((86044766219057044132339621919978649600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((618025807390458842612109558763660800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((18498680662796933724 : Rat) / 692956453614176359) [(7, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((318383050559337802660518863660563200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(7, 2), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-43022383109528522066169810959989324800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(7, 2), (10, 1), (12, 2), (16, 1)],
  term ((18498680662796933724 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((618025807390458842612109558763660800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-945779004813905026627092506702956800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 2), (16, 1)],
  term ((533098843904915484557231008058460662761236 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 3), (15, 3), (16, 1)],
  term ((86146303069127597885465150833240435200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 4), (15, 2), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 4), (16, 1)],
  term ((-43022383109528522066169810959989324800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 5), (15, 1), (16, 1)],
  term ((274884567056558808183114472418342400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-137442283528279404091557236209171200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((2335347551622736321887165005021068800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((274884567056558808183114472418342400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-137442283528279404091557236209171200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 4), (15, 1), (16, 1)],
  term ((-3568785057567901887188220848683521014400 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5801287902334596285 : Rat) / 692956453614176359) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((141135593331517525669490158317120000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((1979968576375798185947813808604819200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(7, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((177949627071626966662635994459306759736412 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((5801287902334596285 : Rat) / 1385912907228352718) [(7, 2), (12, 1), (13, 2), (16, 1)],
  term ((46525404436962626549000558467520928000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-266672373701014891420363718703772681131018 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((34063041793425030293099573042867520000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((-46525404436962626549000558467520928000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(7, 2), (12, 1), (13, 4), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 5), (15, 1), (16, 1)],
  term ((19292270770499009311705506855494400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((8191824500921831739 : Rat) / 692956453614176359) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((177951673537730273666758202066602357976412 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42639741704253487703152043993276115028503 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((34063041793425030293099573042867520000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 2), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-9175749973814856968590831196918486400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1824694926321908115 : Rat) / 1385912907228352718) [(7, 2), (12, 2), (13, 2), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-19169819375667834336691817087452425600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((141135593331517525669490158317120000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-5801287902334596285 : Rat) / 692956453614176359) [(7, 2), (12, 2), (14, 1), (16, 1)],
  term ((-9646135385249504655852753427747200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (15, 2), (16, 1)],
  term ((-8191824500921831739 : Rat) / 1385912907228352718) [(7, 2), (12, 2), (16, 1)],
  term ((-8185765685626957875616924292616076800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-88975836768865136833379101033301178988206 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-17031520896712515146549786521433760000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 3), (13, 2), (15, 2), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(7, 2), (12, 3), (13, 2), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 3), (13, 3), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(7, 2), (12, 3), (14, 1), (16, 1)],
  term ((-70567796665758762834745079158560000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 3), (15, 2), (16, 1)],
  term ((5801287902334596285 : Rat) / 1385912907228352718) [(7, 2), (12, 3), (16, 1)],
  term ((4092882842813478937808462146308038400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 4), (13, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(7, 2), (12, 4), (16, 1)],
  term ((8191824500921831739 : Rat) / 692956453614176359) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((19292270770499009311705506855494400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-3569064795494074122823240578532925683200 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (15, 4), (16, 1)],
  term ((-8191824500921831739 : Rat) / 1385912907228352718) [(7, 2), (13, 2), (16, 1)],
  term ((268329197927008582824071036930049013721418 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 3), (15, 1), (16, 1)],
  term ((1776894876234690679696755982081248000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 3), (16, 1)],
  term ((45535420148774727456026651563218518400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 4), (15, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (13, 4), (16, 1)],
  term ((-23262702218481313274500279233760464000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 5), (15, 1), (16, 1)],
  term ((2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((173347716986005055057585559156556800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((173347716986005055057585559156556800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((145291127812439154565195973471385600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-72645563906219577282597986735692800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-116399841648104978722265046945292800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((145291127812439154565195973471385600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((58199920824052489361132523472646400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 2), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-72645563906219577282597986735692800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 3), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 4), (15, 1), (16, 1)],
  term ((-116399841648104978722265046945292800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 1), (15, 2), (16, 1)],
  term ((58199920824052489361132523472646400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 2), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 3), (15, 2), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 4), (15, 1), (16, 1)],
  term ((-140649573864425400 : Rat) / 692956453614176359) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(8, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-140649573864425400 : Rat) / 692956453614176359) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 1), (13, 3), (15, 2), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(8, 1), (9, 1), (13, 3), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 1), (13, 4), (15, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(8, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(8, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(8, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(8, 1), (10, 1), (13, 4), (16, 1)],
  term ((-1387039924178296875 : Rat) / 2771825814456705436) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2996524672250164662519789893358736838400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1969850932679345625 : Rat) / 1385912907228352718) [(8, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((38116429709913792000 : Rat) / 692956453614176359) [(8, 1), (11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((1969850932679345625 : Rat) / 2771825814456705436) [(8, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(8, 1), (11, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-1969850932679345625 : Rat) / 1385912907228352718) [(8, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1387039924178296875 : Rat) / 5543651628913410872) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1498262336125082331259894946679368419200 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(8, 1), (11, 1), (12, 2), (13, 3), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(8, 1), (11, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((1969850932679345625 : Rat) / 2771825814456705436) [(8, 1), (11, 1), (12, 3), (13, 1), (16, 1)],
  term ((-1387039924178296875 : Rat) / 2771825814456705436) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2996524672250164662519789893358736838400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((1387039924178296875 : Rat) / 5543651628913410872) [(8, 1), (11, 1), (13, 3), (16, 1)],
  term ((4638426377917466260411253659169946569692800 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(8, 1), (11, 1), (13, 5), (15, 2), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(8, 1), (11, 1), (13, 5), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(8, 1), (11, 1), (13, 6), (15, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 2771825814456705436) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(8, 1), (11, 2), (12, 2), (16, 1)],
  term ((11020747726338080733 : Rat) / 2771825814456705436) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(8, 1), (11, 2), (13, 2), (16, 1)],
  term ((-3988922053075555626108933898896416534175 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-52553723233734477915 : Rat) / 2771825814456705436) [(8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-29901489575418606258100276680639840214050 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-35162393466106350 : Rat) / 692956453614176359) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((51697186090388729760460611996644561971200 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((14950744787709303129050138340319920107025 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-29901489575418606258100276680639840214050 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3988922053075555626108933898896416534175 : Rat) / 168707601851329515375740828258983054697998) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((52553723233734477915 : Rat) / 5543651628913410872) [(8, 1), (12, 2), (13, 2), (16, 1)],
  term ((-25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((14950744787709303129050138340319920107025 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-35162393466106350 : Rat) / 692956453614176359) [(8, 1), (12, 3), (16, 1)],
  term ((-3988922053075555626108933898896416534175 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-6389402950083236201639710436783850693787965 : Rat) / 337415203702659030751481656517966109395996) [(8, 1), (13, 3), (15, 1), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (13, 3), (15, 3), (16, 1)],
  term ((51658099096468190472519564856300704460800 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (13, 4), (15, 2), (16, 1)],
  term ((52553723233734477915 : Rat) / 5543651628913410872) [(8, 1), (13, 4), (16, 1)],
  term ((-25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (13, 5), (15, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 2771825814456705436) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-11020747726338080733 : Rat) / 2771825814456705436) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((15881322831892412733 : Rat) / 2771825814456705436) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1341800328094736313975407370846678067200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(9, 1), (10, 1), (12, 1), (13, 3), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-15881322831892412733 : Rat) / 5543651628913410872) [(9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-670900164047368156987703685423339033600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(9, 1), (10, 1), (12, 3), (13, 1), (16, 1)],
  term ((15881322831892412733 : Rat) / 2771825814456705436) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1341800328094736313975407370846678067200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-15881322831892412733 : Rat) / 5543651628913410872) [(9, 1), (10, 1), (13, 3), (16, 1)],
  term ((-670900164047368156987703685423339033600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7487990474948827929 : Rat) / 1385912907228352718) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4338325000344900976495197264205414905600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((7487990474948827929 : Rat) / 2771825814456705436) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-4637755477753418892254265955484523230659200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(9, 1), (11, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(9, 1), (11, 1), (12, 1), (13, 4), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(9, 1), (11, 1), (12, 1), (13, 5), (15, 1), (16, 1)],
  term ((15328078262978619483 : Rat) / 2771825814456705436) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4338325000344900976495197264205414905600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((239120611333215579656220070697515238093625 : Rat) / 168707601851329515375740828258983054697998) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-38116429709913792000 : Rat) / 692956453614176359) [(9, 1), (11, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1969850932679345625 : Rat) / 2771825814456705436) [(9, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((-3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(9, 1), (11, 1), (12, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-7487990474948827929 : Rat) / 1385912907228352718) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-15328078262978619483 : Rat) / 5543651628913410872) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((2169162500172450488247598632102707452800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(9, 1), (11, 1), (12, 3), (13, 2), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(9, 1), (11, 1), (12, 3), (13, 3), (15, 1), (16, 1)],
  term ((1969850932679345625 : Rat) / 1385912907228352718) [(9, 1), (11, 1), (12, 3), (14, 1), (16, 1)],
  term ((7487990474948827929 : Rat) / 2771825814456705436) [(9, 1), (11, 1), (12, 3), (16, 1)],
  term ((-1969850932679345625 : Rat) / 2771825814456705436) [(9, 1), (11, 1), (12, 4), (16, 1)],
  term ((15328078262978619483 : Rat) / 2771825814456705436) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-15328078262978619483 : Rat) / 5543651628913410872) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-27438948507301718505 : Rat) / 2771825814456705436) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4518899647857926932409945198887795199775 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1278342040195172159662471395966235123200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((6388342994893671459027108414183867936456765 : Rat) / 337415203702659030751481656517966109395996) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-51658099096468190472519564856300704460800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-52553723233734477915 : Rat) / 5543651628913410872) [(9, 1), (12, 1), (13, 3), (16, 1)],
  term ((25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((18515732959524674936764470463305959466450 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((52553723233734477915 : Rat) / 2771825814456705436) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((29816801088590771134228007876561482274850 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((27438948507301718505 : Rat) / 5543651628913410872) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-51697186090388729760460611996644561971200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-14292030270651447405248379072164873790225 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((4518899647857926932409945198887795199775 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9257866479762337468382235231652979733225 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((-52553723233734477915 : Rat) / 5543651628913410872) [(9, 1), (12, 3), (13, 1), (16, 1)],
  term ((25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((29862402581498066970159229540295982703650 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-4518899647857926932409945198887795199775 : Rat) / 168707601851329515375740828258983054697998) [(9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-14931201290749033485079614770147991351825 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 4), (15, 1), (16, 1)],
  term ((18515732959524674936764470463305959466450 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3377183055420234328232576623270081006676205 : Rat) / 337415203702659030751481656517966109395996) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1323943533102467995593693059700735552000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 3), (15, 2), (16, 1)],
  term ((27438948507301718505 : Rat) / 5543651628913410872) [(9, 1), (13, 3), (16, 1)],
  term ((639171020097586079831235697983117561600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 4), (15, 1), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(9, 2), (12, 1), (13, 2), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(9, 2), (12, 2), (14, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(9, 2), (12, 3), (16, 1)],
  term ((-8810830849358918250 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-270165803896301606876408708517888014400600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((28815321509514931500 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-57174644564870688000 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-14407660754757465750 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((28815321509514931500 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((4405415424679459125 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((135082901948150803438204354258944007200300 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 2), (13, 3), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((-14407660754757465750 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 3), (13, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((-8810830849358918250 : Rat) / 692956453614176359) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-270165803896301606876408708517888014400600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((4405415424679459125 : Rat) / 692956453614176359) [(10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-6824804058432236210675565976915994899967700 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (13, 4), (15, 3), (16, 1)],
  term ((-4535975837436520059813933154841411404800 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (13, 5), (15, 2), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(10, 1), (11, 1), (13, 5), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (13, 6), (15, 1), (16, 1)],
  term ((3300136864467900161385498570310483655503521 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((43639609385923547517 : Rat) / 2771825814456705436) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-137479521898907511576574747237029595404000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((69816462944507374392 : Rat) / 692956453614176359) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((4718179633576408489493752210300741859236800 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-43639609385923547517 : Rat) / 5543651628913410872) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-48592261592083198425796990828989228288000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2359089816788204244746876105150370929618400 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((657640320041971837980948999153322147183200 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((5623262052905386233 : Rat) / 2771825814456705436) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((4718179633576408489493752210300741859236800 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-172110668194636631035499426679598207868949 : Rat) / 5817503512114810875025545802033898437862) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((68739760949453755788287373618514797702000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-31435241521961153196 : Rat) / 692956453614176359) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((24296130796041599212898495414494614144000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((43639609385923547517 : Rat) / 2771825814456705436) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-328820160020985918990474499576661073591600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-5623262052905386233 : Rat) / 5543651628913410872) [(10, 1), (12, 2), (16, 1)],
  term ((-2359089816788204244746876105150370929618400 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(10, 1), (12, 3), (14, 1), (16, 1)],
  term ((-43639609385923547517 : Rat) / 5543651628913410872) [(10, 1), (12, 3), (16, 1)],
  term ((3472989950292534000 : Rat) / 692956453614176359) [(10, 1), (12, 4), (16, 1)],
  term ((5623262052905386233 : Rat) / 2771825814456705436) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((657640320041971837980948999153322147183200 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((2971316704446914242395024070733822581911921 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5623262052905386233 : Rat) / 5543651628913410872) [(10, 1), (13, 2), (16, 1)],
  term ((13697421887857553798832047832476295978045903 : Rat) / 168707601851329515375740828258983054697998) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-137479521898907511576574747237029595404000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (15, 3), (16, 1)],
  term ((20147499357370557362490382789525569414000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 4), (15, 2), (16, 1)],
  term ((-34908231472253687196 : Rat) / 692956453614176359) [(10, 1), (13, 4), (16, 1)],
  term ((24296130796041599212898495414494614144000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 5), (15, 1), (16, 1)],
  term ((-27783919602340272000 : Rat) / 692956453614176359) [(10, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(10, 2), (12, 2), (13, 2), (16, 1)],
  term ((-11020747726338080733 : Rat) / 11087303257826821744) [(10, 2), (12, 2), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 11087303257826821744) [(10, 2), (13, 2), (16, 1)],
  term ((-27783919602340272000 : Rat) / 692956453614176359) [(10, 2), (13, 3), (15, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(10, 2), (13, 4), (16, 1)],
  term ((1173444781504062425083384211762035841035200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((14570828880554329875 : Rat) / 2771825814456705436) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4556925335766843166221006196823813410283859 : Rat) / 337415203702659030751481656517966109395996) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5340517152291903444401749853493473481642600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-19492971712695712861533297802293947804924337 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((4982102734784776453972555751987544607200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((13100490383116736898373899207698841678058800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((49391761798543181409 : Rat) / 2771825814456705436) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-6586365436385558078478250633051330537431600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 4), (15, 3), (16, 1)],
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 5), (15, 2), (16, 1)],
  term ((4982102734784776453972555751987544607200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-49391761798543181409 : Rat) / 1385912907228352718) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-657292675757113639409721409155158801326800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-14570828880554329875 : Rat) / 5543651628913410872) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((13172730872771116156956501266102661074863200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4954935753770206180138117052167979269472700 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 2), (15, 3), (16, 1)],
  term ((8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(11, 1), (12, 2), (13, 3), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((-4556925335766843166221006196823813410283859 : Rat) / 337415203702659030751481656517966109395996) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(11, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((-2491051367392388226986277875993772303600 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((49391761798543181409 : Rat) / 2771825814456705436) [(11, 1), (12, 3), (13, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6586365436385558078478250633051330537431600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 3), (13, 3), (15, 2), (16, 1)],
  term ((-2433458103623531960966527699108306234800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((4556925335766843166221006196823813410283859 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(11, 1), (12, 4), (13, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 4), (13, 2), (15, 1), (16, 1)],
  term ((1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 4), (15, 1), (16, 1)],
  term ((14570828880554329875 : Rat) / 2771825814456705436) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1173444781504062425083384211762035841035200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((4753794761539872231860057747612455561125000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (15, 4), (16, 1)],
  term ((-14570828880554329875 : Rat) / 5543651628913410872) [(11, 1), (13, 3), (16, 1)],
  term ((-2670258576145951722200874926746736740821300 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 600 through 699. -/
theorem ep_Q2_008_block_29_0600_0699_valid :
    checkProductSumEq ep_Q2_008_partials_29_0600_0699
      ep_Q2_008_block_29_0600_0699 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
