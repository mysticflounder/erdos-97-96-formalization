/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 27:1700-1799

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_27_1700_1799 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1700 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1700 : Poly :=
[
  term ((-729877970528763246 : Rat) / 692956453614176359) [(7, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 1700 for generator 27. -/
def ep_Q2_008_partial_27_1700 : Poly :=
[
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(7, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1700 for generator 27. -/
theorem ep_Q2_008_partial_27_1700_valid :
    mulPoly ep_Q2_008_coefficient_27_1700
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1700 := by
  native_decide

/-- Coefficient term 1701 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1701 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1701 for generator 27. -/
def ep_Q2_008_partial_27_1701 : Poly :=
[
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1701 for generator 27. -/
theorem ep_Q2_008_partial_27_1701_valid :
    mulPoly ep_Q2_008_coefficient_27_1701
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1701 := by
  native_decide

/-- Coefficient term 1702 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1702 : Poly :=
[
  term ((133266613119618654974109073756779904578309 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1702 for generator 27. -/
def ep_Q2_008_partial_27_1702 : Poly :=
[
  term ((133266613119618654974109073756779904578309 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-133266613119618654974109073756779904578309 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1702 for generator 27. -/
theorem ep_Q2_008_partial_27_1702_valid :
    mulPoly ep_Q2_008_coefficient_27_1702
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1702 := by
  native_decide

/-- Coefficient term 1703 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1703 : Poly :=
[
  term ((751973919174453577914337485767119200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1703 for generator 27. -/
def ep_Q2_008_partial_27_1703 : Poly :=
[
  term ((-751973919174453577914337485767119200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1503947838348907155828674971534238400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1703 for generator 27. -/
theorem ep_Q2_008_partial_27_1703_valid :
    mulPoly ep_Q2_008_coefficient_27_1703
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1703 := by
  native_decide

/-- Coefficient term 1704 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1704 : Poly :=
[
  term ((209735017581313327755 : Rat) / 22174606515653643488) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1704 for generator 27. -/
def ep_Q2_008_partial_27_1704 : Poly :=
[
  term ((-209735017581313327755 : Rat) / 22174606515653643488) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((209735017581313327755 : Rat) / 11087303257826821744) [(7, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1704 for generator 27. -/
theorem ep_Q2_008_partial_27_1704_valid :
    mulPoly ep_Q2_008_coefficient_27_1704
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1704 := by
  native_decide

/-- Coefficient term 1705 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1705 : Poly :=
[
  term ((375986959587226788957168742883559600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1705 for generator 27. -/
def ep_Q2_008_partial_27_1705 : Poly :=
[
  term ((751973919174453577914337485767119200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-375986959587226788957168742883559600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1705 for generator 27. -/
theorem ep_Q2_008_partial_27_1705_valid :
    mulPoly ep_Q2_008_coefficient_27_1705
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1705 := by
  native_decide

/-- Coefficient term 1706 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1706 : Poly :=
[
  term ((292057742328988207755 : Rat) / 44349213031307286976) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 1706 for generator 27. -/
def ep_Q2_008_partial_27_1706 : Poly :=
[
  term ((292057742328988207755 : Rat) / 22174606515653643488) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-292057742328988207755 : Rat) / 44349213031307286976) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1706 for generator 27. -/
theorem ep_Q2_008_partial_27_1706_valid :
    mulPoly ep_Q2_008_coefficient_27_1706
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1706 := by
  native_decide

/-- Coefficient term 1707 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1707 : Poly :=
[
  term ((995161048697688756233929833296255950547775 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1707 for generator 27. -/
def ep_Q2_008_partial_27_1707 : Poly :=
[
  term ((-995161048697688756233929833296255950547775 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((995161048697688756233929833296255950547775 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1707 for generator 27. -/
theorem ep_Q2_008_partial_27_1707_valid :
    mulPoly ep_Q2_008_coefficient_27_1707
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1707 := by
  native_decide

/-- Coefficient term 1708 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1708 : Poly :=
[
  term ((995161048697688756233929833296255950547775 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1708 for generator 27. -/
def ep_Q2_008_partial_27_1708 : Poly :=
[
  term ((995161048697688756233929833296255950547775 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-995161048697688756233929833296255950547775 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1708 for generator 27. -/
theorem ep_Q2_008_partial_27_1708_valid :
    mulPoly ep_Q2_008_coefficient_27_1708
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1708 := by
  native_decide

/-- Coefficient term 1709 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1709 : Poly :=
[
  term ((46084193031640799066329331165761200000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1709 for generator 27. -/
def ep_Q2_008_partial_27_1709 : Poly :=
[
  term ((-46084193031640799066329331165761200000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((92168386063281598132658662331522400000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1709 for generator 27. -/
theorem ep_Q2_008_partial_27_1709_valid :
    mulPoly ep_Q2_008_coefficient_27_1709
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1709 := by
  native_decide

/-- Coefficient term 1710 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1710 : Poly :=
[
  term ((1094816955793144869 : Rat) / 5543651628913410872) [(7, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 1710 for generator 27. -/
def ep_Q2_008_partial_27_1710 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 5543651628913410872) [(7, 1), (13, 3), (14, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 2771825814456705436) [(7, 1), (13, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1710 for generator 27. -/
theorem ep_Q2_008_partial_27_1710_valid :
    mulPoly ep_Q2_008_coefficient_27_1710
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1710 := by
  native_decide

/-- Coefficient term 1711 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1711 : Poly :=
[
  term ((23042096515820399533164665582880600000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 1711 for generator 27. -/
def ep_Q2_008_partial_27_1711 : Poly :=
[
  term ((46084193031640799066329331165761200000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-23042096515820399533164665582880600000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1711 for generator 27. -/
theorem ep_Q2_008_partial_27_1711_valid :
    mulPoly ep_Q2_008_coefficient_27_1711
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1711 := by
  native_decide

/-- Coefficient term 1712 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1712 : Poly :=
[
  term ((1094816955793144869 : Rat) / 11087303257826821744) [(7, 1), (13, 3), (16, 1)]
]

/-- Partial product 1712 for generator 27. -/
def ep_Q2_008_partial_27_1712 : Poly :=
[
  term ((1094816955793144869 : Rat) / 5543651628913410872) [(7, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 11087303257826821744) [(7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1712 for generator 27. -/
theorem ep_Q2_008_partial_27_1712_valid :
    mulPoly ep_Q2_008_coefficient_27_1712
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1712 := by
  native_decide

/-- Coefficient term 1713 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1713 : Poly :=
[
  term ((2765051581898447943979759869945672000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1713 for generator 27. -/
def ep_Q2_008_partial_27_1713 : Poly :=
[
  term ((-2765051581898447943979759869945672000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((5530103163796895887959519739891344000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1713 for generator 27. -/
theorem ep_Q2_008_partial_27_1713_valid :
    mulPoly ep_Q2_008_coefficient_27_1713
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1713 := by
  native_decide

/-- Coefficient term 1714 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1714 : Poly :=
[
  term ((1382525790949223971989879934972836000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 1714 for generator 27. -/
def ep_Q2_008_partial_27_1714 : Poly :=
[
  term ((2765051581898447943979759869945672000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-1382525790949223971989879934972836000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1714 for generator 27. -/
theorem ep_Q2_008_partial_27_1714_valid :
    mulPoly ep_Q2_008_coefficient_27_1714
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1714 := by
  native_decide

/-- Coefficient term 1715 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1715 : Poly :=
[
  term ((914614170380275601770263622430318034863967 : Rat) / 1349660814810636123005926626071864437583984) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1715 for generator 27. -/
def ep_Q2_008_partial_27_1715 : Poly :=
[
  term ((-914614170380275601770263622430318034863967 : Rat) / 1349660814810636123005926626071864437583984) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((914614170380275601770263622430318034863967 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1715 for generator 27. -/
theorem ep_Q2_008_partial_27_1715_valid :
    mulPoly ep_Q2_008_coefficient_27_1715
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1715 := by
  native_decide

/-- Coefficient term 1716 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1716 : Poly :=
[
  term ((96880060607548013847101848992359175086367 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1716 for generator 27. -/
def ep_Q2_008_partial_27_1716 : Poly :=
[
  term ((96880060607548013847101848992359175086367 : Rat) / 1349660814810636123005926626071864437583984) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-96880060607548013847101848992359175086367 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1716 for generator 27. -/
theorem ep_Q2_008_partial_27_1716_valid :
    mulPoly ep_Q2_008_coefficient_27_1716
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1716 := by
  native_decide

/-- Coefficient term 1717 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1717 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1717 for generator 27. -/
def ep_Q2_008_partial_27_1717 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1717 for generator 27. -/
theorem ep_Q2_008_partial_27_1717_valid :
    mulPoly ep_Q2_008_coefficient_27_1717
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1717 := by
  native_decide

/-- Coefficient term 1718 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1718 : Poly :=
[
  term ((133807312762030463048877203514835200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1718 for generator 27. -/
def ep_Q2_008_partial_27_1718 : Poly :=
[
  term ((267614625524060926097754407029670400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-133807312762030463048877203514835200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1718 for generator 27. -/
theorem ep_Q2_008_partial_27_1718_valid :
    mulPoly ep_Q2_008_coefficient_27_1718
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1718 := by
  native_decide

/-- Coefficient term 1719 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1719 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 1719 for generator 27. -/
def ep_Q2_008_partial_27_1719 : Poly :=
[
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1719 for generator 27. -/
theorem ep_Q2_008_partial_27_1719_valid :
    mulPoly ep_Q2_008_coefficient_27_1719
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1719 := by
  native_decide

/-- Coefficient term 1720 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1720 : Poly :=
[
  term ((-21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1720 for generator 27. -/
def ep_Q2_008_partial_27_1720 : Poly :=
[
  term ((-43022383109528522066169810959989324800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1720 for generator 27. -/
theorem ep_Q2_008_partial_27_1720_valid :
    mulPoly ep_Q2_008_coefficient_27_1720
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1720 := by
  native_decide

/-- Coefficient term 1721 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1721 : Poly :=
[
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1721 for generator 27. -/
def ep_Q2_008_partial_27_1721 : Poly :=
[
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1721 for generator 27. -/
theorem ep_Q2_008_partial_27_1721_valid :
    mulPoly ep_Q2_008_coefficient_27_1721
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1721 := by
  native_decide

/-- Coefficient term 1722 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1722 : Poly :=
[
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(7, 2), (10, 1), (16, 1)]
]

/-- Partial product 1722 for generator 27. -/
def ep_Q2_008_partial_27_1722 : Poly :=
[
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(7, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1722 for generator 27. -/
theorem ep_Q2_008_partial_27_1722_valid :
    mulPoly ep_Q2_008_coefficient_27_1722
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1722 := by
  native_decide

/-- Coefficient term 1723 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1723 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1723 for generator 27. -/
def ep_Q2_008_partial_27_1723 : Poly :=
[
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1723 for generator 27. -/
theorem ep_Q2_008_partial_27_1723_valid :
    mulPoly ep_Q2_008_coefficient_27_1723
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1723 := by
  native_decide

/-- Coefficient term 1724 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1724 : Poly :=
[
  term ((-94105354281778140327160846420032000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1724 for generator 27. -/
def ep_Q2_008_partial_27_1724 : Poly :=
[
  term ((-188210708563556280654321692840064000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((94105354281778140327160846420032000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1724 for generator 27. -/
theorem ep_Q2_008_partial_27_1724_valid :
    mulPoly ep_Q2_008_coefficient_27_1724
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1724 := by
  native_decide

/-- Coefficient term 1725 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1725 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1725 for generator 27. -/
def ep_Q2_008_partial_27_1725 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1725 for generator 27. -/
theorem ep_Q2_008_partial_27_1725_valid :
    mulPoly ep_Q2_008_coefficient_27_1725
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1725 := by
  native_decide

/-- Coefficient term 1726 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1726 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1726 for generator 27. -/
def ep_Q2_008_partial_27_1726 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1726 for generator 27. -/
theorem ep_Q2_008_partial_27_1726_valid :
    mulPoly ep_Q2_008_coefficient_27_1726
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1726 := by
  native_decide

/-- Coefficient term 1727 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1727 : Poly :=
[
  term ((-88818165567864642436671460400034172127406 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1727 for generator 27. -/
def ep_Q2_008_partial_27_1727 : Poly :=
[
  term ((-177636331135729284873342920800068344254812 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((88818165567864642436671460400034172127406 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1727 for generator 27. -/
theorem ep_Q2_008_partial_27_1727_valid :
    mulPoly ep_Q2_008_coefficient_27_1727
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1727 := by
  native_decide

/-- Coefficient term 1728 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1728 : Poly :=
[
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1728 for generator 27. -/
def ep_Q2_008_partial_27_1728 : Poly :=
[
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1728 for generator 27. -/
theorem ep_Q2_008_partial_27_1728_valid :
    mulPoly ep_Q2_008_coefficient_27_1728
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1728 := by
  native_decide

/-- Coefficient term 1729 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1729 : Poly :=
[
  term ((-14823094407677971016069532657989923200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1729 for generator 27. -/
def ep_Q2_008_partial_27_1729 : Poly :=
[
  term ((-29646188815355942032139065315979846400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((14823094407677971016069532657989923200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1729 for generator 27. -/
theorem ep_Q2_008_partial_27_1729_valid :
    mulPoly ep_Q2_008_coefficient_27_1729
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1729 := by
  native_decide

/-- Coefficient term 1730 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1730 : Poly :=
[
  term ((-2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1730 for generator 27. -/
def ep_Q2_008_partial_27_1730 : Poly :=
[
  term ((-4569158253174918890648801096780352000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1730 for generator 27. -/
theorem ep_Q2_008_partial_27_1730_valid :
    mulPoly ep_Q2_008_coefficient_27_1730
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1730 := by
  native_decide

/-- Coefficient term 1731 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1731 : Poly :=
[
  term ((-124772615360609869772117233364376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1731 for generator 27. -/
def ep_Q2_008_partial_27_1731 : Poly :=
[
  term ((-249545230721219739544234466728752000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((124772615360609869772117233364376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1731 for generator 27. -/
theorem ep_Q2_008_partial_27_1731_valid :
    mulPoly ep_Q2_008_coefficient_27_1731
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1731 := by
  native_decide

/-- Coefficient term 1732 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1732 : Poly :=
[
  term ((121646328421460541 : Rat) / 2771825814456705436) [(7, 2), (12, 1), (16, 1)]
]

/-- Partial product 1732 for generator 27. -/
def ep_Q2_008_partial_27_1732 : Poly :=
[
  term ((121646328421460541 : Rat) / 1385912907228352718) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-121646328421460541 : Rat) / 2771825814456705436) [(7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1732 for generator 27. -/
theorem ep_Q2_008_partial_27_1732_valid :
    mulPoly ep_Q2_008_coefficient_27_1732
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1732 := by
  native_decide

/-- Coefficient term 1733 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1733 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1733 for generator 27. -/
def ep_Q2_008_partial_27_1733 : Poly :=
[
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1733 for generator 27. -/
theorem ep_Q2_008_partial_27_1733_valid :
    mulPoly ep_Q2_008_coefficient_27_1733
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1733 := by
  native_decide

/-- Coefficient term 1734 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1734 : Poly :=
[
  term ((152305275105830629688293369892678400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1734 for generator 27. -/
def ep_Q2_008_partial_27_1734 : Poly :=
[
  term ((304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-152305275105830629688293369892678400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1734 for generator 27. -/
theorem ep_Q2_008_partial_27_1734_valid :
    mulPoly ep_Q2_008_coefficient_27_1734
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1734 := by
  native_decide

/-- Coefficient term 1735 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1735 : Poly :=
[
  term ((-856175679211421917070486717243330980800 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1735 for generator 27. -/
def ep_Q2_008_partial_27_1735 : Poly :=
[
  term ((856175679211421917070486717243330980800 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1712351358422843834140973434486661961600 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1735 for generator 27. -/
theorem ep_Q2_008_partial_27_1735_valid :
    mulPoly ep_Q2_008_coefficient_27_1735
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1735 := by
  native_decide

/-- Coefficient term 1736 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1736 : Poly :=
[
  term ((-428087839605710958535243358621665490400 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1736 for generator 27. -/
def ep_Q2_008_partial_27_1736 : Poly :=
[
  term ((-856175679211421917070486717243330980800 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((428087839605710958535243358621665490400 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1736 for generator 27. -/
theorem ep_Q2_008_partial_27_1736_valid :
    mulPoly ep_Q2_008_coefficient_27_1736
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1736 := by
  native_decide

/-- Coefficient term 1737 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1737 : Poly :=
[
  term ((1269210625881921914069111415772320000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1737 for generator 27. -/
def ep_Q2_008_partial_27_1737 : Poly :=
[
  term ((-1269210625881921914069111415772320000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((2538421251763843828138222831544640000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1737 for generator 27. -/
theorem ep_Q2_008_partial_27_1737_valid :
    mulPoly ep_Q2_008_coefficient_27_1737
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1737 := by
  native_decide

/-- Coefficient term 1738 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1738 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1738 for generator 27. -/
def ep_Q2_008_partial_27_1738 : Poly :=
[
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(7, 2), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1738 for generator 27. -/
theorem ep_Q2_008_partial_27_1738_valid :
    mulPoly ep_Q2_008_coefficient_27_1738
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1738 := by
  native_decide

/-- Coefficient term 1739 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1739 : Poly :=
[
  term ((634605312940960957034555707886160000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1739 for generator 27. -/
def ep_Q2_008_partial_27_1739 : Poly :=
[
  term ((1269210625881921914069111415772320000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-634605312940960957034555707886160000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1739 for generator 27. -/
theorem ep_Q2_008_partial_27_1739_valid :
    mulPoly ep_Q2_008_coefficient_27_1739
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1739 := by
  native_decide

/-- Coefficient term 1740 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1740 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 1385912907228352718) [(7, 2), (13, 2), (16, 1)]
]

/-- Partial product 1740 for generator 27. -/
def ep_Q2_008_partial_27_1740 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (13, 2), (14, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 1385912907228352718) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1740 for generator 27. -/
theorem ep_Q2_008_partial_27_1740_valid :
    mulPoly ep_Q2_008_coefficient_27_1740
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1740 := by
  native_decide

/-- Coefficient term 1741 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1741 : Poly :=
[
  term ((-22044260017634668236993932274619036800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1741 for generator 27. -/
def ep_Q2_008_partial_27_1741 : Poly :=
[
  term ((22044260017634668236993932274619036800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-44088520035269336473987864549238073600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1741 for generator 27. -/
theorem ep_Q2_008_partial_27_1741_valid :
    mulPoly ep_Q2_008_coefficient_27_1741
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1741 := by
  native_decide

/-- Coefficient term 1742 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1742 : Poly :=
[
  term ((-11022130008817334118496966137309518400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1742 for generator 27. -/
def ep_Q2_008_partial_27_1742 : Poly :=
[
  term ((-22044260017634668236993932274619036800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((11022130008817334118496966137309518400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1742 for generator 27. -/
theorem ep_Q2_008_partial_27_1742_valid :
    mulPoly ep_Q2_008_coefficient_27_1742
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1742 := by
  native_decide

/-- Coefficient term 1743 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1743 : Poly :=
[
  term ((7047804430116002354974063390684800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1743 for generator 27. -/
def ep_Q2_008_partial_27_1743 : Poly :=
[
  term ((-7047804430116002354974063390684800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((14095608860232004709948126781369600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1743 for generator 27. -/
theorem ep_Q2_008_partial_27_1743_valid :
    mulPoly ep_Q2_008_coefficient_27_1743
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1743 := by
  native_decide

/-- Coefficient term 1744 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1744 : Poly :=
[
  term ((-2312223332774106449 : Rat) / 2771825814456705436) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 1744 for generator 27. -/
def ep_Q2_008_partial_27_1744 : Poly :=
[
  term ((2312223332774106449 : Rat) / 2771825814456705436) [(7, 2), (14, 1), (16, 1)],
  term ((-2312223332774106449 : Rat) / 1385912907228352718) [(7, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1744 for generator 27. -/
theorem ep_Q2_008_partial_27_1744_valid :
    mulPoly ep_Q2_008_coefficient_27_1744
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1744 := by
  native_decide

/-- Coefficient term 1745 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1745 : Poly :=
[
  term ((3523902215058001177487031695342400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 1745 for generator 27. -/
def ep_Q2_008_partial_27_1745 : Poly :=
[
  term ((7047804430116002354974063390684800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3523902215058001177487031695342400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1745 for generator 27. -/
theorem ep_Q2_008_partial_27_1745_valid :
    mulPoly ep_Q2_008_coefficient_27_1745
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1745 := by
  native_decide

/-- Coefficient term 1746 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1746 : Poly :=
[
  term ((-2312223332774106449 : Rat) / 5543651628913410872) [(7, 2), (16, 1)]
]

/-- Partial product 1746 for generator 27. -/
def ep_Q2_008_partial_27_1746 : Poly :=
[
  term ((-2312223332774106449 : Rat) / 2771825814456705436) [(7, 2), (14, 1), (16, 1)],
  term ((2312223332774106449 : Rat) / 5543651628913410872) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1746 for generator 27. -/
theorem ep_Q2_008_partial_27_1746_valid :
    mulPoly ep_Q2_008_coefficient_27_1746
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1746 := by
  native_decide

/-- Coefficient term 1747 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1747 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1747 for generator 27. -/
def ep_Q2_008_partial_27_1747 : Poly :=
[
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1747 for generator 27. -/
theorem ep_Q2_008_partial_27_1747_valid :
    mulPoly ep_Q2_008_coefficient_27_1747
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1747 := by
  native_decide

/-- Coefficient term 1748 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1748 : Poly :=
[
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1748 for generator 27. -/
def ep_Q2_008_partial_27_1748 : Poly :=
[
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1748 for generator 27. -/
theorem ep_Q2_008_partial_27_1748_valid :
    mulPoly ep_Q2_008_coefficient_27_1748
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1748 := by
  native_decide

/-- Coefficient term 1749 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1749 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1749 for generator 27. -/
def ep_Q2_008_partial_27_1749 : Poly :=
[
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1749 for generator 27. -/
theorem ep_Q2_008_partial_27_1749_valid :
    mulPoly ep_Q2_008_coefficient_27_1749
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1749 := by
  native_decide

/-- Coefficient term 1750 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1750 : Poly :=
[
  term ((16922808345092292187588152210297600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1750 for generator 27. -/
def ep_Q2_008_partial_27_1750 : Poly :=
[
  term ((33845616690184584375176304420595200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16922808345092292187588152210297600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1750 for generator 27. -/
theorem ep_Q2_008_partial_27_1750_valid :
    mulPoly ep_Q2_008_coefficient_27_1750
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1750 := by
  native_decide

/-- Coefficient term 1751 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1751 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1751 for generator 27. -/
def ep_Q2_008_partial_27_1751 : Poly :=
[
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1751 for generator 27. -/
theorem ep_Q2_008_partial_27_1751_valid :
    mulPoly ep_Q2_008_coefficient_27_1751
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1751 := by
  native_decide

/-- Coefficient term 1752 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1752 : Poly :=
[
  term ((-304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1752 for generator 27. -/
def ep_Q2_008_partial_27_1752 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1752 for generator 27. -/
theorem ep_Q2_008_partial_27_1752_valid :
    mulPoly ep_Q2_008_coefficient_27_1752
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1752 := by
  native_decide

/-- Coefficient term 1753 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1753 : Poly :=
[
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1753 for generator 27. -/
def ep_Q2_008_partial_27_1753 : Poly :=
[
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (14, 1), (15, 1), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1753 for generator 27. -/
theorem ep_Q2_008_partial_27_1753_valid :
    mulPoly ep_Q2_008_coefficient_27_1753
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1753 := by
  native_decide

/-- Coefficient term 1754 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1754 : Poly :=
[
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (15, 1), (16, 1)]
]

/-- Partial product 1754 for generator 27. -/
def ep_Q2_008_partial_27_1754 : Poly :=
[
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (14, 1), (15, 1), (16, 1)],
  term ((4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1754 for generator 27. -/
theorem ep_Q2_008_partial_27_1754_valid :
    mulPoly ep_Q2_008_coefficient_27_1754
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1754 := by
  native_decide

/-- Coefficient term 1755 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1755 : Poly :=
[
  term ((60212255272942500 : Rat) / 692956453614176359) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1755 for generator 27. -/
def ep_Q2_008_partial_27_1755 : Poly :=
[
  term ((120424510545885000 : Rat) / 692956453614176359) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-60212255272942500 : Rat) / 692956453614176359) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1755 for generator 27. -/
theorem ep_Q2_008_partial_27_1755_valid :
    mulPoly ep_Q2_008_coefficient_27_1755
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1755 := by
  native_decide

/-- Coefficient term 1756 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1756 : Poly :=
[
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1756 for generator 27. -/
def ep_Q2_008_partial_27_1756 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1756 for generator 27. -/
theorem ep_Q2_008_partial_27_1756_valid :
    mulPoly ep_Q2_008_coefficient_27_1756
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1756 := by
  native_decide

/-- Coefficient term 1757 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1757 : Poly :=
[
  term ((130680444136331250 : Rat) / 692956453614176359) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1757 for generator 27. -/
def ep_Q2_008_partial_27_1757 : Poly :=
[
  term ((261360888272662500 : Rat) / 692956453614176359) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-130680444136331250 : Rat) / 692956453614176359) [(9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1757 for generator 27. -/
theorem ep_Q2_008_partial_27_1757_valid :
    mulPoly ep_Q2_008_coefficient_27_1757
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1757 := by
  native_decide

/-- Coefficient term 1758 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1758 : Poly :=
[
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1758 for generator 27. -/
def ep_Q2_008_partial_27_1758 : Poly :=
[
  term ((-104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1758 for generator 27. -/
theorem ep_Q2_008_partial_27_1758_valid :
    mulPoly ep_Q2_008_coefficient_27_1758
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1758 := by
  native_decide

/-- Coefficient term 1759 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1759 : Poly :=
[
  term ((11158993365187234723631293517318110784400 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1759 for generator 27. -/
def ep_Q2_008_partial_27_1759 : Poly :=
[
  term ((22317986730374469447262587034636221568800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11158993365187234723631293517318110784400 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1759 for generator 27. -/
theorem ep_Q2_008_partial_27_1759_valid :
    mulPoly ep_Q2_008_coefficient_27_1759
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1759 := by
  native_decide

/-- Coefficient term 1760 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1760 : Poly :=
[
  term ((-93766382576283600 : Rat) / 692956453614176359) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1760 for generator 27. -/
def ep_Q2_008_partial_27_1760 : Poly :=
[
  term ((93766382576283600 : Rat) / 692956453614176359) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-187532765152567200 : Rat) / 692956453614176359) [(9, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1760 for generator 27. -/
theorem ep_Q2_008_partial_27_1760_valid :
    mulPoly ep_Q2_008_coefficient_27_1760
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1760 := by
  native_decide

/-- Coefficient term 1761 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1761 : Poly :=
[
  term ((7766215387138000461 : Rat) / 2771825814456705436) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1761 for generator 27. -/
def ep_Q2_008_partial_27_1761 : Poly :=
[
  term ((7766215387138000461 : Rat) / 1385912907228352718) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7766215387138000461 : Rat) / 2771825814456705436) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1761 for generator 27. -/
theorem ep_Q2_008_partial_27_1761_valid :
    mulPoly ep_Q2_008_coefficient_27_1761
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1761 := by
  native_decide

/-- Coefficient term 1762 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1762 : Poly :=
[
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1762 for generator 27. -/
def ep_Q2_008_partial_27_1762 : Poly :=
[
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1762 for generator 27. -/
theorem ep_Q2_008_partial_27_1762_valid :
    mulPoly ep_Q2_008_coefficient_27_1762
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1762 := by
  native_decide

/-- Coefficient term 1763 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1763 : Poly :=
[
  term ((137715472288282750672835545044794265600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1763 for generator 27. -/
def ep_Q2_008_partial_27_1763 : Poly :=
[
  term ((275430944576565501345671090089588531200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-137715472288282750672835545044794265600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1763 for generator 27. -/
theorem ep_Q2_008_partial_27_1763_valid :
    mulPoly ep_Q2_008_coefficient_27_1763
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1763 := by
  native_decide

/-- Coefficient term 1764 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1764 : Poly :=
[
  term ((-10817386312601780468746745445030025053900 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1764 for generator 27. -/
def ep_Q2_008_partial_27_1764 : Poly :=
[
  term ((10817386312601780468746745445030025053900 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21634772625203560937493490890060050107800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1764 for generator 27. -/
theorem ep_Q2_008_partial_27_1764_valid :
    mulPoly ep_Q2_008_coefficient_27_1764
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1764 := by
  native_decide

/-- Coefficient term 1765 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1765 : Poly :=
[
  term ((-5425578354332113614723817298824465652550 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1765 for generator 27. -/
def ep_Q2_008_partial_27_1765 : Poly :=
[
  term ((-10851156708664227229447634597648931305100 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((5425578354332113614723817298824465652550 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1765 for generator 27. -/
theorem ep_Q2_008_partial_27_1765_valid :
    mulPoly ep_Q2_008_coefficient_27_1765
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1765 := by
  native_decide

/-- Coefficient term 1766 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1766 : Poly :=
[
  term ((-6430278946997738250 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1766 for generator 27. -/
def ep_Q2_008_partial_27_1766 : Poly :=
[
  term ((-12860557893995476500 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((6430278946997738250 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1766 for generator 27. -/
theorem ep_Q2_008_partial_27_1766_valid :
    mulPoly ep_Q2_008_coefficient_27_1766
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1766 := by
  native_decide

/-- Coefficient term 1767 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1767 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1767 for generator 27. -/
def ep_Q2_008_partial_27_1767 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1767 for generator 27. -/
theorem ep_Q2_008_partial_27_1767_valid :
    mulPoly ep_Q2_008_coefficient_27_1767
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1767 := by
  native_decide

/-- Coefficient term 1768 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1768 : Poly :=
[
  term ((3889714471092129375 : Rat) / 1385912907228352718) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1768 for generator 27. -/
def ep_Q2_008_partial_27_1768 : Poly :=
[
  term ((3889714471092129375 : Rat) / 692956453614176359) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3889714471092129375 : Rat) / 1385912907228352718) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1768 for generator 27. -/
theorem ep_Q2_008_partial_27_1768_valid :
    mulPoly ep_Q2_008_coefficient_27_1768
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1768 := by
  native_decide

/-- Coefficient term 1769 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1769 : Poly :=
[
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1769 for generator 27. -/
def ep_Q2_008_partial_27_1769 : Poly :=
[
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1769 for generator 27. -/
theorem ep_Q2_008_partial_27_1769_valid :
    mulPoly ep_Q2_008_coefficient_27_1769
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1769 := by
  native_decide

/-- Coefficient term 1770 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1770 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 1770 for generator 27. -/
def ep_Q2_008_partial_27_1770 : Poly :=
[
  term ((28587322282435344000 : Rat) / 692956453614176359) [(10, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1770 for generator 27. -/
theorem ep_Q2_008_partial_27_1770_valid :
    mulPoly ep_Q2_008_coefficient_27_1770
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1770 := by
  native_decide

/-- Coefficient term 1771 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1771 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 1771 for generator 27. -/
def ep_Q2_008_partial_27_1771 : Poly :=
[
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1771 for generator 27. -/
theorem ep_Q2_008_partial_27_1771_valid :
    mulPoly ep_Q2_008_coefficient_27_1771
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1771 := by
  native_decide

/-- Coefficient term 1772 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1772 : Poly :=
[
  term ((-212649250231385485005761502961178225682900 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1772 for generator 27. -/
def ep_Q2_008_partial_27_1772 : Poly :=
[
  term ((-425298500462770970011523005922356451365800 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((212649250231385485005761502961178225682900 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1772 for generator 27. -/
theorem ep_Q2_008_partial_27_1772_valid :
    mulPoly ep_Q2_008_coefficient_27_1772
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1772 := by
  native_decide

/-- Coefficient term 1773 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1773 : Poly :=
[
  term ((-19101444726608937000 : Rat) / 692956453614176359) [(10, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1773 for generator 27. -/
def ep_Q2_008_partial_27_1773 : Poly :=
[
  term ((-38202889453217874000 : Rat) / 692956453614176359) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((19101444726608937000 : Rat) / 692956453614176359) [(10, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1773 for generator 27. -/
theorem ep_Q2_008_partial_27_1773_valid :
    mulPoly ep_Q2_008_coefficient_27_1773
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1773 := by
  native_decide

/-- Coefficient term 1774 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1774 : Poly :=
[
  term ((-675303601445770500 : Rat) / 692956453614176359) [(10, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1774 for generator 27. -/
def ep_Q2_008_partial_27_1774 : Poly :=
[
  term ((675303601445770500 : Rat) / 692956453614176359) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1350607202891541000 : Rat) / 692956453614176359) [(10, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1774 for generator 27. -/
theorem ep_Q2_008_partial_27_1774_valid :
    mulPoly ep_Q2_008_coefficient_27_1774
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1774 := by
  native_decide

/-- Coefficient term 1775 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1775 : Poly :=
[
  term ((-822050147711915379238003077261447850084200 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1775 for generator 27. -/
def ep_Q2_008_partial_27_1775 : Poly :=
[
  term ((-1644100295423830758476006154522895700168400 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((822050147711915379238003077261447850084200 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1775 for generator 27. -/
theorem ep_Q2_008_partial_27_1775_valid :
    mulPoly ep_Q2_008_coefficient_27_1775
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1775 := by
  native_decide

/-- Coefficient term 1776 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1776 : Poly :=
[
  term ((24351937160537397375 : Rat) / 2771825814456705436) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1776 for generator 27. -/
def ep_Q2_008_partial_27_1776 : Poly :=
[
  term ((24351937160537397375 : Rat) / 1385912907228352718) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-24351937160537397375 : Rat) / 2771825814456705436) [(10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1776 for generator 27. -/
theorem ep_Q2_008_partial_27_1776_valid :
    mulPoly ep_Q2_008_coefficient_27_1776
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1776 := by
  native_decide

/-- Coefficient term 1777 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1777 : Poly :=
[
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(10, 1), (12, 2), (16, 1)]
]

/-- Partial product 1777 for generator 27. -/
def ep_Q2_008_partial_27_1777 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((3472989950292534000 : Rat) / 692956453614176359) [(10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1777 for generator 27. -/
theorem ep_Q2_008_partial_27_1777_valid :
    mulPoly ep_Q2_008_coefficient_27_1777
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1777 := by
  native_decide

/-- Coefficient term 1778 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1778 : Poly :=
[
  term ((1597391058293132251826094905190586940071200 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1778 for generator 27. -/
def ep_Q2_008_partial_27_1778 : Poly :=
[
  term ((-1597391058293132251826094905190586940071200 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3194782116586264503652189810381173880142400 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1778 for generator 27. -/
theorem ep_Q2_008_partial_27_1778_valid :
    mulPoly ep_Q2_008_coefficient_27_1778
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1778 := by
  native_decide

/-- Coefficient term 1779 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1779 : Poly :=
[
  term ((2115976513007958739574405320664416020758979 : Rat) / 337415203702659030751481656517966109395996) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1779 for generator 27. -/
def ep_Q2_008_partial_27_1779 : Poly :=
[
  term ((2115976513007958739574405320664416020758979 : Rat) / 168707601851329515375740828258983054697998) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2115976513007958739574405320664416020758979 : Rat) / 337415203702659030751481656517966109395996) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1779 for generator 27. -/
theorem ep_Q2_008_partial_27_1779_valid :
    mulPoly ep_Q2_008_coefficient_27_1779
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1779 := by
  native_decide

/-- Coefficient term 1780 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1780 : Poly :=
[
  term ((2025910804337311500 : Rat) / 692956453614176359) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1780 for generator 27. -/
def ep_Q2_008_partial_27_1780 : Poly :=
[
  term ((-2025910804337311500 : Rat) / 692956453614176359) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((4051821608674623000 : Rat) / 692956453614176359) [(10, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1780 for generator 27. -/
theorem ep_Q2_008_partial_27_1780_valid :
    mulPoly ep_Q2_008_coefficient_27_1780
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1780 := by
  native_decide

/-- Coefficient term 1781 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1781 : Poly :=
[
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1781 for generator 27. -/
def ep_Q2_008_partial_27_1781 : Poly :=
[
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1781 for generator 27. -/
theorem ep_Q2_008_partial_27_1781_valid :
    mulPoly ep_Q2_008_coefficient_27_1781
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1781 := by
  native_decide

/-- Coefficient term 1782 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1782 : Poly :=
[
  term ((-23898406608870769071 : Rat) / 1385912907228352718) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 1782 for generator 27. -/
def ep_Q2_008_partial_27_1782 : Poly :=
[
  term ((-23898406608870769071 : Rat) / 692956453614176359) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((23898406608870769071 : Rat) / 1385912907228352718) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1782 for generator 27. -/
theorem ep_Q2_008_partial_27_1782_valid :
    mulPoly ep_Q2_008_coefficient_27_1782
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1782 := by
  native_decide

/-- Coefficient term 1783 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1783 : Poly :=
[
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1783 for generator 27. -/
def ep_Q2_008_partial_27_1783 : Poly :=
[
  term ((23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1783 for generator 27. -/
theorem ep_Q2_008_partial_27_1783_valid :
    mulPoly ep_Q2_008_coefficient_27_1783
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1783 := by
  native_decide

/-- Coefficient term 1784 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1784 : Poly :=
[
  term ((-30947423081533875 : Rat) / 23895050124626771) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1784 for generator 27. -/
def ep_Q2_008_partial_27_1784 : Poly :=
[
  term ((30947423081533875 : Rat) / 23895050124626771) [(10, 1), (14, 1), (16, 1)],
  term ((-61894846163067750 : Rat) / 23895050124626771) [(10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1784 for generator 27. -/
theorem ep_Q2_008_partial_27_1784_valid :
    mulPoly ep_Q2_008_coefficient_27_1784
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1784 := by
  native_decide

/-- Coefficient term 1785 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1785 : Poly :=
[
  term ((-886756164579628875 : Rat) / 1385912907228352718) [(10, 1), (16, 1)]
]

/-- Partial product 1785 for generator 27. -/
def ep_Q2_008_partial_27_1785 : Poly :=
[
  term ((-886756164579628875 : Rat) / 692956453614176359) [(10, 1), (14, 1), (16, 1)],
  term ((886756164579628875 : Rat) / 1385912907228352718) [(10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1785 for generator 27. -/
theorem ep_Q2_008_partial_27_1785_valid :
    mulPoly ep_Q2_008_coefficient_27_1785
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1785 := by
  native_decide

/-- Coefficient term 1786 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1786 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(10, 2), (13, 2), (16, 1)]
]

/-- Partial product 1786 for generator 27. -/
def ep_Q2_008_partial_27_1786 : Poly :=
[
  term ((13891959801170136000 : Rat) / 692956453614176359) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1786 for generator 27. -/
theorem ep_Q2_008_partial_27_1786_valid :
    mulPoly ep_Q2_008_coefficient_27_1786
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1786 := by
  native_decide

/-- Coefficient term 1787 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1787 : Poly :=
[
  term ((-17002346414744775375 : Rat) / 2771825814456705436) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1787 for generator 27. -/
def ep_Q2_008_partial_27_1787 : Poly :=
[
  term ((17002346414744775375 : Rat) / 2771825814456705436) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17002346414744775375 : Rat) / 1385912907228352718) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1787 for generator 27. -/
theorem ep_Q2_008_partial_27_1787_valid :
    mulPoly ep_Q2_008_coefficient_27_1787
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1787 := by
  native_decide

/-- Coefficient term 1788 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1788 : Poly :=
[
  term ((-1454805734040421036189416143747845179292800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1788 for generator 27. -/
def ep_Q2_008_partial_27_1788 : Poly :=
[
  term ((-2909611468080842072378832287495690358585600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1454805734040421036189416143747845179292800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1788 for generator 27. -/
theorem ep_Q2_008_partial_27_1788_valid :
    mulPoly ep_Q2_008_coefficient_27_1788
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1788 := by
  native_decide

/-- Coefficient term 1789 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1789 : Poly :=
[
  term ((198503583210080865909 : Rat) / 5543651628913410872) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1789 for generator 27. -/
def ep_Q2_008_partial_27_1789 : Poly :=
[
  term ((198503583210080865909 : Rat) / 2771825814456705436) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-198503583210080865909 : Rat) / 5543651628913410872) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1789 for generator 27. -/
theorem ep_Q2_008_partial_27_1789_valid :
    mulPoly ep_Q2_008_coefficient_27_1789
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1789 := by
  native_decide

/-- Coefficient term 1790 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1790 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1790 for generator 27. -/
def ep_Q2_008_partial_27_1790 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1790 for generator 27. -/
theorem ep_Q2_008_partial_27_1790_valid :
    mulPoly ep_Q2_008_coefficient_27_1790
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1790 := by
  native_decide

/-- Coefficient term 1791 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1791 : Poly :=
[
  term ((-212671472433427809058584759381482839439400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1791 for generator 27. -/
def ep_Q2_008_partial_27_1791 : Poly :=
[
  term ((-425342944866855618117169518762965678878800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((212671472433427809058584759381482839439400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1791 for generator 27. -/
theorem ep_Q2_008_partial_27_1791_valid :
    mulPoly ep_Q2_008_coefficient_27_1791
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1791 := by
  native_decide

/-- Coefficient term 1792 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1792 : Poly :=
[
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 1792 for generator 27. -/
def ep_Q2_008_partial_27_1792 : Poly :=
[
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1792 for generator 27. -/
theorem ep_Q2_008_partial_27_1792_valid :
    mulPoly ep_Q2_008_coefficient_27_1792
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1792 := by
  native_decide

/-- Coefficient term 1793 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1793 : Poly :=
[
  term ((-147912255568582175863497820266567763200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 1793 for generator 27. -/
def ep_Q2_008_partial_27_1793 : Poly :=
[
  term ((-295824511137164351726995640533135526400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((147912255568582175863497820266567763200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1793 for generator 27. -/
theorem ep_Q2_008_partial_27_1793_valid :
    mulPoly ep_Q2_008_coefficient_27_1793
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1793 := by
  native_decide

/-- Coefficient term 1794 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1794 : Poly :=
[
  term ((-53601229279566270000 : Rat) / 692956453614176359) [(11, 1), (12, 1), (13, 3), (16, 1)]
]

/-- Partial product 1794 for generator 27. -/
def ep_Q2_008_partial_27_1794 : Poly :=
[
  term ((-107202458559132540000 : Rat) / 692956453614176359) [(11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((53601229279566270000 : Rat) / 692956453614176359) [(11, 1), (12, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1794 for generator 27. -/
theorem ep_Q2_008_partial_27_1794_valid :
    mulPoly ep_Q2_008_coefficient_27_1794
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1794 := by
  native_decide

/-- Coefficient term 1795 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1795 : Poly :=
[
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 1795 for generator 27. -/
def ep_Q2_008_partial_27_1795 : Poly :=
[
  term ((-8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1795 for generator 27. -/
theorem ep_Q2_008_partial_27_1795_valid :
    mulPoly ep_Q2_008_coefficient_27_1795
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1795 := by
  native_decide

/-- Coefficient term 1796 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1796 : Poly :=
[
  term ((-153401408165429573908133975841432576000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1796 for generator 27. -/
def ep_Q2_008_partial_27_1796 : Poly :=
[
  term ((153401408165429573908133975841432576000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-306802816330859147816267951682865152000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1796 for generator 27. -/
theorem ep_Q2_008_partial_27_1796_valid :
    mulPoly ep_Q2_008_coefficient_27_1796
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1796 := by
  native_decide

/-- Coefficient term 1797 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1797 : Poly :=
[
  term ((-298990035776718498464741881097753713946841 : Rat) / 1349660814810636123005926626071864437583984) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1797 for generator 27. -/
def ep_Q2_008_partial_27_1797 : Poly :=
[
  term ((-298990035776718498464741881097753713946841 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((298990035776718498464741881097753713946841 : Rat) / 1349660814810636123005926626071864437583984) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1797 for generator 27. -/
theorem ep_Q2_008_partial_27_1797_valid :
    mulPoly ep_Q2_008_coefficient_27_1797
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1797 := by
  native_decide

/-- Coefficient term 1798 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1798 : Poly :=
[
  term ((-1534014081654295739081339758414325760000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1798 for generator 27. -/
def ep_Q2_008_partial_27_1798 : Poly :=
[
  term ((-3068028163308591478162679516828651520000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((1534014081654295739081339758414325760000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1798 for generator 27. -/
theorem ep_Q2_008_partial_27_1798_valid :
    mulPoly ep_Q2_008_coefficient_27_1798
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1798 := by
  native_decide

/-- Coefficient term 1799 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1799 : Poly :=
[
  term ((295824511137164351726995640533135526400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1799 for generator 27. -/
def ep_Q2_008_partial_27_1799 : Poly :=
[
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-295824511137164351726995640533135526400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1799 for generator 27. -/
theorem ep_Q2_008_partial_27_1799_valid :
    mulPoly ep_Q2_008_coefficient_27_1799
        ep_Q2_008_generator_27_1700_1799 =
      ep_Q2_008_partial_27_1799 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_27_1700_1799 : List Poly :=
[
  ep_Q2_008_partial_27_1700,
  ep_Q2_008_partial_27_1701,
  ep_Q2_008_partial_27_1702,
  ep_Q2_008_partial_27_1703,
  ep_Q2_008_partial_27_1704,
  ep_Q2_008_partial_27_1705,
  ep_Q2_008_partial_27_1706,
  ep_Q2_008_partial_27_1707,
  ep_Q2_008_partial_27_1708,
  ep_Q2_008_partial_27_1709,
  ep_Q2_008_partial_27_1710,
  ep_Q2_008_partial_27_1711,
  ep_Q2_008_partial_27_1712,
  ep_Q2_008_partial_27_1713,
  ep_Q2_008_partial_27_1714,
  ep_Q2_008_partial_27_1715,
  ep_Q2_008_partial_27_1716,
  ep_Q2_008_partial_27_1717,
  ep_Q2_008_partial_27_1718,
  ep_Q2_008_partial_27_1719,
  ep_Q2_008_partial_27_1720,
  ep_Q2_008_partial_27_1721,
  ep_Q2_008_partial_27_1722,
  ep_Q2_008_partial_27_1723,
  ep_Q2_008_partial_27_1724,
  ep_Q2_008_partial_27_1725,
  ep_Q2_008_partial_27_1726,
  ep_Q2_008_partial_27_1727,
  ep_Q2_008_partial_27_1728,
  ep_Q2_008_partial_27_1729,
  ep_Q2_008_partial_27_1730,
  ep_Q2_008_partial_27_1731,
  ep_Q2_008_partial_27_1732,
  ep_Q2_008_partial_27_1733,
  ep_Q2_008_partial_27_1734,
  ep_Q2_008_partial_27_1735,
  ep_Q2_008_partial_27_1736,
  ep_Q2_008_partial_27_1737,
  ep_Q2_008_partial_27_1738,
  ep_Q2_008_partial_27_1739,
  ep_Q2_008_partial_27_1740,
  ep_Q2_008_partial_27_1741,
  ep_Q2_008_partial_27_1742,
  ep_Q2_008_partial_27_1743,
  ep_Q2_008_partial_27_1744,
  ep_Q2_008_partial_27_1745,
  ep_Q2_008_partial_27_1746,
  ep_Q2_008_partial_27_1747,
  ep_Q2_008_partial_27_1748,
  ep_Q2_008_partial_27_1749,
  ep_Q2_008_partial_27_1750,
  ep_Q2_008_partial_27_1751,
  ep_Q2_008_partial_27_1752,
  ep_Q2_008_partial_27_1753,
  ep_Q2_008_partial_27_1754,
  ep_Q2_008_partial_27_1755,
  ep_Q2_008_partial_27_1756,
  ep_Q2_008_partial_27_1757,
  ep_Q2_008_partial_27_1758,
  ep_Q2_008_partial_27_1759,
  ep_Q2_008_partial_27_1760,
  ep_Q2_008_partial_27_1761,
  ep_Q2_008_partial_27_1762,
  ep_Q2_008_partial_27_1763,
  ep_Q2_008_partial_27_1764,
  ep_Q2_008_partial_27_1765,
  ep_Q2_008_partial_27_1766,
  ep_Q2_008_partial_27_1767,
  ep_Q2_008_partial_27_1768,
  ep_Q2_008_partial_27_1769,
  ep_Q2_008_partial_27_1770,
  ep_Q2_008_partial_27_1771,
  ep_Q2_008_partial_27_1772,
  ep_Q2_008_partial_27_1773,
  ep_Q2_008_partial_27_1774,
  ep_Q2_008_partial_27_1775,
  ep_Q2_008_partial_27_1776,
  ep_Q2_008_partial_27_1777,
  ep_Q2_008_partial_27_1778,
  ep_Q2_008_partial_27_1779,
  ep_Q2_008_partial_27_1780,
  ep_Q2_008_partial_27_1781,
  ep_Q2_008_partial_27_1782,
  ep_Q2_008_partial_27_1783,
  ep_Q2_008_partial_27_1784,
  ep_Q2_008_partial_27_1785,
  ep_Q2_008_partial_27_1786,
  ep_Q2_008_partial_27_1787,
  ep_Q2_008_partial_27_1788,
  ep_Q2_008_partial_27_1789,
  ep_Q2_008_partial_27_1790,
  ep_Q2_008_partial_27_1791,
  ep_Q2_008_partial_27_1792,
  ep_Q2_008_partial_27_1793,
  ep_Q2_008_partial_27_1794,
  ep_Q2_008_partial_27_1795,
  ep_Q2_008_partial_27_1796,
  ep_Q2_008_partial_27_1797,
  ep_Q2_008_partial_27_1798,
  ep_Q2_008_partial_27_1799
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_27_1700_1799 : Poly :=
[
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((133266613119618654974109073756779904578309 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-133266613119618654974109073756779904578309 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((2572585148364840000 : Rat) / 692956453614176359) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1503947838348907155828674971534238400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((209735017581313327755 : Rat) / 11087303257826821744) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-375986959587226788957168742883559600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-292057742328988207755 : Rat) / 44349213031307286976) [(7, 1), (13, 1), (16, 1)],
  term ((995161048697688756233929833296255950547775 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-995161048697688756233929833296255950547775 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((92168386063281598132658662331522400000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 2771825814456705436) [(7, 1), (13, 3), (14, 2), (16, 1)],
  term ((-23042096515820399533164665582880600000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 11087303257826821744) [(7, 1), (13, 3), (16, 1)],
  term ((5530103163796895887959519739891344000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((-1382525790949223971989879934972836000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-51108381860795474245197610839872428736100 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((914614170380275601770263622430318034863967 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-96880060607548013847101848992359175086367 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((267614625524060926097754407029670400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-133807312762030463048877203514835200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 2), (16, 1)],
  term ((-43022383109528522066169810959989324800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(7, 2), (10, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-188210708563556280654321692840064000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((94105354281778140327160846420032000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-177630441998425192755661640123099160690012 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((88818165567864642436671460400034172127406 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-29646188815355942032139065315979846400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((14823094407677971016069532657989923200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4569158253174918890648801096780352000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-249545230721219739544234466728752000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((121646328421460541 : Rat) / 1385912907228352718) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((124772615360609869772117233364376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-121646328421460541 : Rat) / 2771825814456705436) [(7, 2), (12, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-152305275105830629688293369892678400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (15, 2), (16, 1)],
  term ((-1712351358422843834140973434486661961600 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((428087839605710958535243358621665490400 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((2538421251763843828138222831544640000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(7, 2), (13, 2), (14, 2), (16, 1)],
  term ((-634605312940960957034555707886160000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 1385912907228352718) [(7, 2), (13, 2), (16, 1)],
  term ((-44088520035269336473987864549238073600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((11022130008817334118496966137309518400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 1), (16, 1)],
  term ((14095608860232004709948126781369600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (14, 2), (15, 2), (16, 1)],
  term ((-2312223332774106449 : Rat) / 1385912907228352718) [(7, 2), (14, 2), (16, 1)],
  term ((-3523902215058001177487031695342400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (15, 2), (16, 1)],
  term ((2312223332774106449 : Rat) / 5543651628913410872) [(7, 2), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((33845616690184584375176304420595200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16922808345092292187588152210297600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 2), (15, 1), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (14, 2), (15, 1), (16, 1)],
  term ((4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (15, 1), (16, 1)],
  term ((120424510545885000 : Rat) / 692956453614176359) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-60212255272942500 : Rat) / 692956453614176359) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((261360888272662500 : Rat) / 692956453614176359) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-130680444136331250 : Rat) / 692956453614176359) [(9, 1), (11, 1), (16, 1)],
  term ((-104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((22317986730374469447262587034636221568800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11158993365187234723631293517318110784400 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((7953748152290567661 : Rat) / 1385912907228352718) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-187532765152567200 : Rat) / 692956453614176359) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7766215387138000461 : Rat) / 2771825814456705436) [(9, 1), (13, 1), (16, 1)],
  term ((223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-137715472288282750672835545044794265600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21634772625203560937493490890060050107800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((5425578354332113614723817298824465652550 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (15, 1), (16, 1)],
  term ((-12860557893995476500 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((6430278946997738250 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3889714471092129375 : Rat) / 692956453614176359) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3889714471092129375 : Rat) / 1385912907228352718) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(10, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(10, 1), (11, 1), (13, 3), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-425298500462770970011523005922356451365800 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((212649250231385485005761502961178225682900 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38202889453217874000 : Rat) / 692956453614176359) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((19101444726608937000 : Rat) / 692956453614176359) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1644100295423830758476006154522895700168400 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((25702544363428938375 : Rat) / 1385912907228352718) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1350607202891541000 : Rat) / 692956453614176359) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((822050147711915379238003077261447850084200 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-24351937160537397375 : Rat) / 2771825814456705436) [(10, 1), (12, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((3472989950292534000 : Rat) / 692956453614176359) [(10, 1), (12, 2), (16, 1)],
  term ((-1078805603578305764077784489716757859383421 : Rat) / 168707601851329515375740828258983054697998) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3194782116586264503652189810381173880142400 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2115976513007958739574405320664416020758979 : Rat) / 337415203702659030751481656517966109395996) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-25924317413208080571 : Rat) / 692956453614176359) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((4051821608674623000 : Rat) / 692956453614176359) [(10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((23898406608870769071 : Rat) / 1385912907228352718) [(10, 1), (13, 2), (16, 1)],
  term ((23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((10719104784853500 : Rat) / 692956453614176359) [(10, 1), (14, 1), (16, 1)],
  term ((-61894846163067750 : Rat) / 23895050124626771) [(10, 1), (14, 2), (16, 1)],
  term ((886756164579628875 : Rat) / 1385912907228352718) [(10, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(10, 2), (13, 2), (16, 1)],
  term ((-2909611468080842072378832287495690358585600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((53876482406206410321 : Rat) / 692956453614176359) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17002346414744775375 : Rat) / 1385912907228352718) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((1454805734040421036189416143747845179292800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-198503583210080865909 : Rat) / 5543651628913410872) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-413904397102885263183725687329017771858000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((212671472433427809058584759381482839439400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-295824511137164351726995640533135526400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-107202458559132540000 : Rat) / 692956453614176359) [(11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((147912255568582175863497820266567763200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((53601229279566270000 : Rat) / 692956453614176359) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-297762824511395061873476809291022253338841 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3068028163308591478162679516828651520000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-306802816330859147816267951682865152000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((298990035776718498464741881097753713946841 : Rat) / 1349660814810636123005926626071864437583984) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1534014081654295739081339758414325760000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-295824511137164351726995640533135526400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 1700 through 1799. -/
theorem ep_Q2_008_block_27_1700_1799_valid :
    checkProductSumEq ep_Q2_008_partials_27_1700_1799
      ep_Q2_008_block_27_1700_1799 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
