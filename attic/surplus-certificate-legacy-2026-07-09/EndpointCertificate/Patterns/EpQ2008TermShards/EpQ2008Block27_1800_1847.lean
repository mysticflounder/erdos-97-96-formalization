/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 27:1800-1847

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_27_1800_1847 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1800 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1800 : Poly :=
[
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(11, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 1800 for generator 27. -/
def ep_Q2_008_partial_27_1800 : Poly :=
[
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(11, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1800 for generator 27. -/
theorem ep_Q2_008_partial_27_1800_valid :
    mulPoly ep_Q2_008_coefficient_27_1800
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1800 := by
  native_decide

/-- Coefficient term 1801 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1801 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1801 for generator 27. -/
def ep_Q2_008_partial_27_1801 : Poly :=
[
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1801 for generator 27. -/
theorem ep_Q2_008_partial_27_1801_valid :
    mulPoly ep_Q2_008_coefficient_27_1801
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1801 := by
  native_decide

/-- Coefficient term 1802 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1802 : Poly :=
[
  term ((1620565438521940201508407279246880640831375 : Rat) / 337415203702659030751481656517966109395996) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1802 for generator 27. -/
def ep_Q2_008_partial_27_1802 : Poly :=
[
  term ((1620565438521940201508407279246880640831375 : Rat) / 168707601851329515375740828258983054697998) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1620565438521940201508407279246880640831375 : Rat) / 337415203702659030751481656517966109395996) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1802 for generator 27. -/
theorem ep_Q2_008_partial_27_1802_valid :
    mulPoly ep_Q2_008_coefficient_27_1802
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1802 := by
  native_decide

/-- Coefficient term 1803 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1803 : Poly :=
[
  term ((4652135457825140426859323107484513361600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1803 for generator 27. -/
def ep_Q2_008_partial_27_1803 : Poly :=
[
  term ((-4652135457825140426859323107484513361600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((9304270915650280853718646214969026723200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1803 for generator 27. -/
theorem ep_Q2_008_partial_27_1803_valid :
    mulPoly ep_Q2_008_coefficient_27_1803
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1803 := by
  native_decide

/-- Coefficient term 1804 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1804 : Poly :=
[
  term ((-23682921352661455875 : Rat) / 11087303257826821744) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1804 for generator 27. -/
def ep_Q2_008_partial_27_1804 : Poly :=
[
  term ((23682921352661455875 : Rat) / 11087303257826821744) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-23682921352661455875 : Rat) / 5543651628913410872) [(11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1804 for generator 27. -/
theorem ep_Q2_008_partial_27_1804_valid :
    mulPoly ep_Q2_008_coefficient_27_1804
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1804 := by
  native_decide

/-- Coefficient term 1805 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1805 : Poly :=
[
  term ((2326067728912570213429661553742256680800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1805 for generator 27. -/
def ep_Q2_008_partial_27_1805 : Poly :=
[
  term ((4652135457825140426859323107484513361600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2326067728912570213429661553742256680800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1805 for generator 27. -/
theorem ep_Q2_008_partial_27_1805_valid :
    mulPoly ep_Q2_008_coefficient_27_1805
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1805 := by
  native_decide

/-- Coefficient term 1806 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1806 : Poly :=
[
  term ((-47874220501925149875 : Rat) / 22174606515653643488) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1806 for generator 27. -/
def ep_Q2_008_partial_27_1806 : Poly :=
[
  term ((-47874220501925149875 : Rat) / 11087303257826821744) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((47874220501925149875 : Rat) / 22174606515653643488) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1806 for generator 27. -/
theorem ep_Q2_008_partial_27_1806_valid :
    mulPoly ep_Q2_008_coefficient_27_1806
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1806 := by
  native_decide

/-- Coefficient term 1807 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1807 : Poly :=
[
  term ((3622083870640403091057377579414068105126800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1807 for generator 27. -/
def ep_Q2_008_partial_27_1807 : Poly :=
[
  term ((-3622083870640403091057377579414068105126800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((7244167741280806182114755158828136210253600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1807 for generator 27. -/
theorem ep_Q2_008_partial_27_1807_valid :
    mulPoly ep_Q2_008_coefficient_27_1807
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1807 := by
  native_decide

/-- Coefficient term 1808 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1808 : Poly :=
[
  term ((1811041935320201545528688789707034052563400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1808 for generator 27. -/
def ep_Q2_008_partial_27_1808 : Poly :=
[
  term ((3622083870640403091057377579414068105126800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1811041935320201545528688789707034052563400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1808 for generator 27. -/
theorem ep_Q2_008_partial_27_1808_valid :
    mulPoly ep_Q2_008_coefficient_27_1808
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1808 := by
  native_decide

/-- Coefficient term 1809 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1809 : Poly :=
[
  term ((2465204259476369597724963671109462720000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1809 for generator 27. -/
def ep_Q2_008_partial_27_1809 : Poly :=
[
  term ((-2465204259476369597724963671109462720000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((4930408518952739195449927342218925440000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1809 for generator 27. -/
theorem ep_Q2_008_partial_27_1809_valid :
    mulPoly ep_Q2_008_coefficient_27_1809
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1809 := by
  native_decide

/-- Coefficient term 1810 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1810 : Poly :=
[
  term ((1786707642652209000 : Rat) / 692956453614176359) [(11, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 1810 for generator 27. -/
def ep_Q2_008_partial_27_1810 : Poly :=
[
  term ((-1786707642652209000 : Rat) / 692956453614176359) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term ((3573415285304418000 : Rat) / 692956453614176359) [(11, 1), (13, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1810 for generator 27. -/
theorem ep_Q2_008_partial_27_1810_valid :
    mulPoly ep_Q2_008_coefficient_27_1810
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1810 := by
  native_decide

/-- Coefficient term 1811 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1811 : Poly :=
[
  term ((1232602129738184798862481835554731360000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 1811 for generator 27. -/
def ep_Q2_008_partial_27_1811 : Poly :=
[
  term ((2465204259476369597724963671109462720000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-1232602129738184798862481835554731360000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1811 for generator 27. -/
theorem ep_Q2_008_partial_27_1811_valid :
    mulPoly ep_Q2_008_coefficient_27_1811
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1811 := by
  native_decide

/-- Coefficient term 1812 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1812 : Poly :=
[
  term ((893353821326104500 : Rat) / 692956453614176359) [(11, 1), (13, 3), (16, 1)]
]

/-- Partial product 1812 for generator 27. -/
def ep_Q2_008_partial_27_1812 : Poly :=
[
  term ((1786707642652209000 : Rat) / 692956453614176359) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-893353821326104500 : Rat) / 692956453614176359) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1812 for generator 27. -/
theorem ep_Q2_008_partial_27_1812_valid :
    mulPoly ep_Q2_008_coefficient_27_1812
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1812 := by
  native_decide

/-- Coefficient term 1813 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1813 : Poly :=
[
  term ((147912255568582175863497820266567763200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1813 for generator 27. -/
def ep_Q2_008_partial_27_1813 : Poly :=
[
  term ((-147912255568582175863497820266567763200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((295824511137164351726995640533135526400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1813 for generator 27. -/
theorem ep_Q2_008_partial_27_1813_valid :
    mulPoly ep_Q2_008_coefficient_27_1813
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1813 := by
  native_decide

/-- Coefficient term 1814 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1814 : Poly :=
[
  term ((73956127784291087931748910133283881600 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 1814 for generator 27. -/
def ep_Q2_008_partial_27_1814 : Poly :=
[
  term ((147912255568582175863497820266567763200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-73956127784291087931748910133283881600 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1814 for generator 27. -/
theorem ep_Q2_008_partial_27_1814_valid :
    mulPoly ep_Q2_008_coefficient_27_1814
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1814 := by
  native_decide

/-- Coefficient term 1815 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1815 : Poly :=
[
  term ((-25592271231712285959305679095022809924625 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1815 for generator 27. -/
def ep_Q2_008_partial_27_1815 : Poly :=
[
  term ((25592271231712285959305679095022809924625 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25592271231712285959305679095022809924625 : Rat) / 337415203702659030751481656517966109395996) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1815 for generator 27. -/
theorem ep_Q2_008_partial_27_1815_valid :
    mulPoly ep_Q2_008_coefficient_27_1815
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1815 := by
  native_decide

/-- Coefficient term 1816 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1816 : Poly :=
[
  term ((693968772583968446873450022146030145695175 : Rat) / 1349660814810636123005926626071864437583984) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1816 for generator 27. -/
def ep_Q2_008_partial_27_1816 : Poly :=
[
  term ((693968772583968446873450022146030145695175 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-693968772583968446873450022146030145695175 : Rat) / 1349660814810636123005926626071864437583984) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1816 for generator 27. -/
theorem ep_Q2_008_partial_27_1816_valid :
    mulPoly ep_Q2_008_coefficient_27_1816
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1816 := by
  native_decide

/-- Coefficient term 1817 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1817 : Poly :=
[
  term ((-6194834721731626944678616120841621088000 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1817 for generator 27. -/
def ep_Q2_008_partial_27_1817 : Poly :=
[
  term ((-12389669443463253889357232241683242176000 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6194834721731626944678616120841621088000 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1817 for generator 27. -/
theorem ep_Q2_008_partial_27_1817_valid :
    mulPoly ep_Q2_008_coefficient_27_1817
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1817 := by
  native_decide

/-- Coefficient term 1818 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1818 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(11, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1818 for generator 27. -/
def ep_Q2_008_partial_27_1818 : Poly :=
[
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(11, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(11, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1818 for generator 27. -/
theorem ep_Q2_008_partial_27_1818_valid :
    mulPoly ep_Q2_008_coefficient_27_1818
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1818 := by
  native_decide

/-- Coefficient term 1819 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1819 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1819 for generator 27. -/
def ep_Q2_008_partial_27_1819 : Poly :=
[
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1819 for generator 27. -/
theorem ep_Q2_008_partial_27_1819_valid :
    mulPoly ep_Q2_008_coefficient_27_1819
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1819 := by
  native_decide

/-- Coefficient term 1820 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1820 : Poly :=
[
  term ((-5016397309687708875 : Rat) / 1385912907228352718) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1820 for generator 27. -/
def ep_Q2_008_partial_27_1820 : Poly :=
[
  term ((-5016397309687708875 : Rat) / 692956453614176359) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((5016397309687708875 : Rat) / 1385912907228352718) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1820 for generator 27. -/
theorem ep_Q2_008_partial_27_1820_valid :
    mulPoly ep_Q2_008_coefficient_27_1820
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1820 := by
  native_decide

/-- Coefficient term 1821 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1821 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1821 for generator 27. -/
def ep_Q2_008_partial_27_1821 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1821 for generator 27. -/
theorem ep_Q2_008_partial_27_1821_valid :
    mulPoly ep_Q2_008_coefficient_27_1821
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1821 := by
  native_decide

/-- Coefficient term 1822 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1822 : Poly :=
[
  term ((515700953587329750 : Rat) / 692956453614176359) [(11, 2), (12, 2), (16, 1)]
]

/-- Partial product 1822 for generator 27. -/
def ep_Q2_008_partial_27_1822 : Poly :=
[
  term ((1031401907174659500 : Rat) / 692956453614176359) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-515700953587329750 : Rat) / 692956453614176359) [(11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1822 for generator 27. -/
theorem ep_Q2_008_partial_27_1822_valid :
    mulPoly ep_Q2_008_coefficient_27_1822
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1822 := by
  native_decide

/-- Coefficient term 1823 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1823 : Poly :=
[
  term ((23820232855230000 : Rat) / 692956453614176359) [(11, 2), (16, 1)]
]

/-- Partial product 1823 for generator 27. -/
def ep_Q2_008_partial_27_1823 : Poly :=
[
  term ((47640465710460000 : Rat) / 692956453614176359) [(11, 2), (14, 1), (16, 1)],
  term ((-23820232855230000 : Rat) / 692956453614176359) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1823 for generator 27. -/
theorem ep_Q2_008_partial_27_1823_valid :
    mulPoly ep_Q2_008_coefficient_27_1823
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1823 := by
  native_decide

/-- Coefficient term 1824 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1824 : Poly :=
[
  term ((3619633865363817572736577310676139350225 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1824 for generator 27. -/
def ep_Q2_008_partial_27_1824 : Poly :=
[
  term ((-3619633865363817572736577310676139350225 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7239267730727635145473154621352278700450 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1824 for generator 27. -/
theorem ep_Q2_008_partial_27_1824_valid :
    mulPoly ep_Q2_008_coefficient_27_1824
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1824 := by
  native_decide

/-- Coefficient term 1825 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1825 : Poly :=
[
  term ((41775495131856061377191669193708066434593905 : Rat) / 2699321629621272246011853252143728875167968) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1825 for generator 27. -/
def ep_Q2_008_partial_27_1825 : Poly :=
[
  term ((41775495131856061377191669193708066434593905 : Rat) / 1349660814810636123005926626071864437583984) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41775495131856061377191669193708066434593905 : Rat) / 2699321629621272246011853252143728875167968) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1825 for generator 27. -/
theorem ep_Q2_008_partial_27_1825_valid :
    mulPoly ep_Q2_008_coefficient_27_1825
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1825 := by
  native_decide

/-- Coefficient term 1826 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1826 : Poly :=
[
  term ((-7190777146235880533871023140356672278400 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1826 for generator 27. -/
def ep_Q2_008_partial_27_1826 : Poly :=
[
  term ((-14381554292471761067742046280713344556800 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((7190777146235880533871023140356672278400 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1826 for generator 27. -/
theorem ep_Q2_008_partial_27_1826_valid :
    mulPoly ep_Q2_008_coefficient_27_1826
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1826 := by
  native_decide

/-- Coefficient term 1827 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1827 : Poly :=
[
  term ((4462621787032963451828200149080603155200 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1827 for generator 27. -/
def ep_Q2_008_partial_27_1827 : Poly :=
[
  term ((8925243574065926903656400298161206310400 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4462621787032963451828200149080603155200 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1827 for generator 27. -/
theorem ep_Q2_008_partial_27_1827_valid :
    mulPoly ep_Q2_008_coefficient_27_1827
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1827 := by
  native_decide

/-- Coefficient term 1828 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1828 : Poly :=
[
  term ((229973309930338288839 : Rat) / 11087303257826821744) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1828 for generator 27. -/
def ep_Q2_008_partial_27_1828 : Poly :=
[
  term ((229973309930338288839 : Rat) / 5543651628913410872) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-229973309930338288839 : Rat) / 11087303257826821744) [(12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1828 for generator 27. -/
theorem ep_Q2_008_partial_27_1828_valid :
    mulPoly ep_Q2_008_coefficient_27_1828
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1828 := by
  native_decide

/-- Coefficient term 1829 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1829 : Poly :=
[
  term ((-78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1829 for generator 27. -/
def ep_Q2_008_partial_27_1829 : Poly :=
[
  term ((-156088613732203079208085647751520649177600 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1829 for generator 27. -/
theorem ep_Q2_008_partial_27_1829_valid :
    mulPoly ep_Q2_008_coefficient_27_1829
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1829 := by
  native_decide

/-- Coefficient term 1830 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1830 : Poly :=
[
  term ((101096103663341664333 : Rat) / 22174606515653643488) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1830 for generator 27. -/
def ep_Q2_008_partial_27_1830 : Poly :=
[
  term ((-101096103663341664333 : Rat) / 22174606515653643488) [(12, 1), (14, 1), (16, 1)],
  term ((101096103663341664333 : Rat) / 11087303257826821744) [(12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1830 for generator 27. -/
theorem ep_Q2_008_partial_27_1830_valid :
    mulPoly ep_Q2_008_coefficient_27_1830
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1830 := by
  native_decide

/-- Coefficient term 1831 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1831 : Poly :=
[
  term ((1849652046840188687877349313934403850526141 : Rat) / 337415203702659030751481656517966109395996) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1831 for generator 27. -/
def ep_Q2_008_partial_27_1831 : Poly :=
[
  term ((1849652046840188687877349313934403850526141 : Rat) / 168707601851329515375740828258983054697998) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1849652046840188687877349313934403850526141 : Rat) / 337415203702659030751481656517966109395996) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1831 for generator 27. -/
theorem ep_Q2_008_partial_27_1831_valid :
    mulPoly ep_Q2_008_coefficient_27_1831
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1831 := by
  native_decide

/-- Coefficient term 1832 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1832 : Poly :=
[
  term ((-36555299356401288237 : Rat) / 5543651628913410872) [(12, 1), (16, 1)]
]

/-- Partial product 1832 for generator 27. -/
def ep_Q2_008_partial_27_1832 : Poly :=
[
  term ((-36555299356401288237 : Rat) / 2771825814456705436) [(12, 1), (14, 1), (16, 1)],
  term ((36555299356401288237 : Rat) / 5543651628913410872) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1832 for generator 27. -/
theorem ep_Q2_008_partial_27_1832_valid :
    mulPoly ep_Q2_008_coefficient_27_1832
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1832 := by
  native_decide

/-- Coefficient term 1833 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1833 : Poly :=
[
  term ((-13898801119290272636450225695869851712000 : Rat) / 84353800925664757687870414129491527348999) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1833 for generator 27. -/
def ep_Q2_008_partial_27_1833 : Poly :=
[
  term ((-27797602238580545272900451391739703424000 : Rat) / 84353800925664757687870414129491527348999) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13898801119290272636450225695869851712000 : Rat) / 84353800925664757687870414129491527348999) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1833 for generator 27. -/
theorem ep_Q2_008_partial_27_1833_valid :
    mulPoly ep_Q2_008_coefficient_27_1833
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1833 := by
  native_decide

/-- Coefficient term 1834 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1834 : Poly :=
[
  term ((-110301446648738820921326456735705127525 : Rat) / 2908751756057405437512772901016949218931) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1834 for generator 27. -/
def ep_Q2_008_partial_27_1834 : Poly :=
[
  term ((-220602893297477641842652913471410255050 : Rat) / 2908751756057405437512772901016949218931) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((110301446648738820921326456735705127525 : Rat) / 2908751756057405437512772901016949218931) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1834 for generator 27. -/
theorem ep_Q2_008_partial_27_1834_valid :
    mulPoly ep_Q2_008_coefficient_27_1834
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1834 := by
  native_decide

/-- Coefficient term 1835 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1835 : Poly :=
[
  term ((43316814316511162271 : Rat) / 11087303257826821744) [(12, 2), (16, 1)]
]

/-- Partial product 1835 for generator 27. -/
def ep_Q2_008_partial_27_1835 : Poly :=
[
  term ((43316814316511162271 : Rat) / 5543651628913410872) [(12, 2), (14, 1), (16, 1)],
  term ((-43316814316511162271 : Rat) / 11087303257826821744) [(12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1835 for generator 27. -/
theorem ep_Q2_008_partial_27_1835_valid :
    mulPoly ep_Q2_008_coefficient_27_1835
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1835 := by
  native_decide

/-- Coefficient term 1836 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1836 : Poly :=
[
  term ((-13706723640394173126426503404644670884708903 : Rat) / 1349660814810636123005926626071864437583984) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1836 for generator 27. -/
def ep_Q2_008_partial_27_1836 : Poly :=
[
  term ((13706723640394173126426503404644670884708903 : Rat) / 1349660814810636123005926626071864437583984) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13706723640394173126426503404644670884708903 : Rat) / 674830407405318061502963313035932218791992) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1836 for generator 27. -/
theorem ep_Q2_008_partial_27_1836_valid :
    mulPoly ep_Q2_008_coefficient_27_1836
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1836 := by
  native_decide

/-- Coefficient term 1837 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1837 : Poly :=
[
  term ((-11829978854478485220654180750459398641763703 : Rat) / 2699321629621272246011853252143728875167968) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1837 for generator 27. -/
def ep_Q2_008_partial_27_1837 : Poly :=
[
  term ((-11829978854478485220654180750459398641763703 : Rat) / 1349660814810636123005926626071864437583984) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11829978854478485220654180750459398641763703 : Rat) / 2699321629621272246011853252143728875167968) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1837 for generator 27. -/
theorem ep_Q2_008_partial_27_1837_valid :
    mulPoly ep_Q2_008_coefficient_27_1837
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1837 := by
  native_decide

/-- Coefficient term 1838 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1838 : Poly :=
[
  term ((33200113594526185801888776444766339161600 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1838 for generator 27. -/
def ep_Q2_008_partial_27_1838 : Poly :=
[
  term ((-33200113594526185801888776444766339161600 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((66400227189052371603777552889532678323200 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1838 for generator 27. -/
theorem ep_Q2_008_partial_27_1838_valid :
    mulPoly ep_Q2_008_coefficient_27_1838
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1838 := by
  native_decide

/-- Coefficient term 1839 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1839 : Poly :=
[
  term ((-213058087658861142861 : Rat) / 22174606515653643488) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1839 for generator 27. -/
def ep_Q2_008_partial_27_1839 : Poly :=
[
  term ((213058087658861142861 : Rat) / 22174606515653643488) [(13, 2), (14, 1), (16, 1)],
  term ((-213058087658861142861 : Rat) / 11087303257826821744) [(13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1839 for generator 27. -/
theorem ep_Q2_008_partial_27_1839_valid :
    mulPoly ep_Q2_008_coefficient_27_1839
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1839 := by
  native_decide

/-- Coefficient term 1840 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1840 : Poly :=
[
  term ((16600056797263092900944388222383169580800 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1840 for generator 27. -/
def ep_Q2_008_partial_27_1840 : Poly :=
[
  term ((33200113594526185801888776444766339161600 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-16600056797263092900944388222383169580800 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1840 for generator 27. -/
theorem ep_Q2_008_partial_27_1840_valid :
    mulPoly ep_Q2_008_coefficient_27_1840
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1840 := by
  native_decide

/-- Coefficient term 1841 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1841 : Poly :=
[
  term ((-497105589179502416013 : Rat) / 44349213031307286976) [(13, 2), (16, 1)]
]

/-- Partial product 1841 for generator 27. -/
def ep_Q2_008_partial_27_1841 : Poly :=
[
  term ((-497105589179502416013 : Rat) / 22174606515653643488) [(13, 2), (14, 1), (16, 1)],
  term ((497105589179502416013 : Rat) / 44349213031307286976) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1841 for generator 27. -/
theorem ep_Q2_008_partial_27_1841_valid :
    mulPoly ep_Q2_008_coefficient_27_1841
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1841 := by
  native_decide

/-- Coefficient term 1842 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1842 : Poly :=
[
  term ((-1738805136928038239674489681037331945600 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1842 for generator 27. -/
def ep_Q2_008_partial_27_1842 : Poly :=
[
  term ((1738805136928038239674489681037331945600 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-3477610273856076479348979362074663891200 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1842 for generator 27. -/
theorem ep_Q2_008_partial_27_1842_valid :
    mulPoly ep_Q2_008_coefficient_27_1842
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1842 := by
  native_decide

/-- Coefficient term 1843 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1843 : Poly :=
[
  term ((-1092717521146532237261519743483111156800 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1843 for generator 27. -/
def ep_Q2_008_partial_27_1843 : Poly :=
[
  term ((-2185435042293064474523039486966222313600 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1092717521146532237261519743483111156800 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1843 for generator 27. -/
theorem ep_Q2_008_partial_27_1843_valid :
    mulPoly ep_Q2_008_coefficient_27_1843
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1843 := by
  native_decide

/-- Coefficient term 1844 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1844 : Poly :=
[
  term ((-15147171515955207741812989859627908932600 : Rat) / 84353800925664757687870414129491527348999) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1844 for generator 27. -/
def ep_Q2_008_partial_27_1844 : Poly :=
[
  term ((15147171515955207741812989859627908932600 : Rat) / 84353800925664757687870414129491527348999) [(14, 1), (15, 2), (16, 1)],
  term ((-30294343031910415483625979719255817865200 : Rat) / 84353800925664757687870414129491527348999) [(14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1844 for generator 27. -/
theorem ep_Q2_008_partial_27_1844_valid :
    mulPoly ep_Q2_008_coefficient_27_1844
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1844 := by
  native_decide

/-- Coefficient term 1845 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1845 : Poly :=
[
  term ((-2312443096854046489 : Rat) / 44349213031307286976) [(14, 1), (16, 1)]
]

/-- Partial product 1845 for generator 27. -/
def ep_Q2_008_partial_27_1845 : Poly :=
[
  term ((2312443096854046489 : Rat) / 44349213031307286976) [(14, 1), (16, 1)],
  term ((-2312443096854046489 : Rat) / 22174606515653643488) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1845 for generator 27. -/
theorem ep_Q2_008_partial_27_1845_valid :
    mulPoly ep_Q2_008_coefficient_27_1845
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1845 := by
  native_decide

/-- Coefficient term 1846 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1846 : Poly :=
[
  term ((27409171645251434262136574261480433843825 : Rat) / 84353800925664757687870414129491527348999) [(15, 2), (16, 1)]
]

/-- Partial product 1846 for generator 27. -/
def ep_Q2_008_partial_27_1846 : Poly :=
[
  term ((54818343290502868524273148522960867687650 : Rat) / 84353800925664757687870414129491527348999) [(14, 1), (15, 2), (16, 1)],
  term ((-27409171645251434262136574261480433843825 : Rat) / 84353800925664757687870414129491527348999) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1846 for generator 27. -/
theorem ep_Q2_008_partial_27_1846_valid :
    mulPoly ep_Q2_008_coefficient_27_1846
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1846 := by
  native_decide

/-- Coefficient term 1847 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1847 : Poly :=
[
  term ((104143688779202769239 : Rat) / 88698426062614573952) [(16, 1)]
]

/-- Partial product 1847 for generator 27. -/
def ep_Q2_008_partial_27_1847 : Poly :=
[
  term ((104143688779202769239 : Rat) / 44349213031307286976) [(14, 1), (16, 1)],
  term ((-104143688779202769239 : Rat) / 88698426062614573952) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1847 for generator 27. -/
theorem ep_Q2_008_partial_27_1847_valid :
    mulPoly ep_Q2_008_coefficient_27_1847
        ep_Q2_008_generator_27_1800_1847 =
      ep_Q2_008_partial_27_1847 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_27_1800_1847 : List Poly :=
[
  ep_Q2_008_partial_27_1800,
  ep_Q2_008_partial_27_1801,
  ep_Q2_008_partial_27_1802,
  ep_Q2_008_partial_27_1803,
  ep_Q2_008_partial_27_1804,
  ep_Q2_008_partial_27_1805,
  ep_Q2_008_partial_27_1806,
  ep_Q2_008_partial_27_1807,
  ep_Q2_008_partial_27_1808,
  ep_Q2_008_partial_27_1809,
  ep_Q2_008_partial_27_1810,
  ep_Q2_008_partial_27_1811,
  ep_Q2_008_partial_27_1812,
  ep_Q2_008_partial_27_1813,
  ep_Q2_008_partial_27_1814,
  ep_Q2_008_partial_27_1815,
  ep_Q2_008_partial_27_1816,
  ep_Q2_008_partial_27_1817,
  ep_Q2_008_partial_27_1818,
  ep_Q2_008_partial_27_1819,
  ep_Q2_008_partial_27_1820,
  ep_Q2_008_partial_27_1821,
  ep_Q2_008_partial_27_1822,
  ep_Q2_008_partial_27_1823,
  ep_Q2_008_partial_27_1824,
  ep_Q2_008_partial_27_1825,
  ep_Q2_008_partial_27_1826,
  ep_Q2_008_partial_27_1827,
  ep_Q2_008_partial_27_1828,
  ep_Q2_008_partial_27_1829,
  ep_Q2_008_partial_27_1830,
  ep_Q2_008_partial_27_1831,
  ep_Q2_008_partial_27_1832,
  ep_Q2_008_partial_27_1833,
  ep_Q2_008_partial_27_1834,
  ep_Q2_008_partial_27_1835,
  ep_Q2_008_partial_27_1836,
  ep_Q2_008_partial_27_1837,
  ep_Q2_008_partial_27_1838,
  ep_Q2_008_partial_27_1839,
  ep_Q2_008_partial_27_1840,
  ep_Q2_008_partial_27_1841,
  ep_Q2_008_partial_27_1842,
  ep_Q2_008_partial_27_1843,
  ep_Q2_008_partial_27_1844,
  ep_Q2_008_partial_27_1845,
  ep_Q2_008_partial_27_1846,
  ep_Q2_008_partial_27_1847
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_27_1800_1847 : Poly :=
[
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((1620565438521940201508407279246880640831375 : Rat) / 168707601851329515375740828258983054697998) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1620565438521940201508407279246880640831375 : Rat) / 337415203702659030751481656517966109395996) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1511956196828980875 : Rat) / 692956453614176359) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((9304270915650280853718646214969026723200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-23682921352661455875 : Rat) / 5543651628913410872) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2326067728912570213429661553742256680800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((47874220501925149875 : Rat) / 22174606515653643488) [(11, 1), (13, 1), (16, 1)],
  term ((7244167741280806182114755158828136210253600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1811041935320201545528688789707034052563400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((4930408518952739195449927342218925440000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((3573415285304418000 : Rat) / 692956453614176359) [(11, 1), (13, 3), (14, 2), (16, 1)],
  term ((-1232602129738184798862481835554731360000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-893353821326104500 : Rat) / 692956453614176359) [(11, 1), (13, 3), (16, 1)],
  term ((295824511137164351726995640533135526400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((-73956127784291087931748910133283881600 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (15, 1), (16, 1)],
  term ((89945130476960091604094462655131619452475 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25592271231712285959305679095022809924625 : Rat) / 337415203702659030751481656517966109395996) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-693968772583968446873450022146030145695175 : Rat) / 1349660814810636123005926626071864437583984) [(11, 1), (15, 1), (16, 1)],
  term ((-12389669443463253889357232241683242176000 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6194834721731626944678616120841621088000 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(11, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(11, 2), (12, 1), (13, 2), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-5016397309687708875 : Rat) / 692956453614176359) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((5016397309687708875 : Rat) / 1385912907228352718) [(11, 2), (12, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1031401907174659500 : Rat) / 692956453614176359) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-515700953587329750 : Rat) / 692956453614176359) [(11, 2), (12, 2), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(11, 2), (14, 1), (16, 1)],
  term ((-23820232855230000 : Rat) / 692956453614176359) [(11, 2), (16, 1)],
  term ((41717580990010240296027883956737248204990305 : Rat) / 1349660814810636123005926626071864437583984) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14381554292471761067742046280713344556800 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((7239267730727635145473154621352278700450 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-41775495131856061377191669193708066434593905 : Rat) / 2699321629621272246011853252143728875167968) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7190777146235880533871023140356672278400 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((8925243574065926903656400298161206310400 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((229973309930338288839 : Rat) / 5543651628913410872) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4462621787032963451828200149080603155200 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-229973309930338288839 : Rat) / 11087303257826821744) [(12, 1), (13, 2), (16, 1)],
  term ((-156088613732203079208085647751520649177600 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1849652046840188687877349313934403850526141 : Rat) / 168707601851329515375740828258983054697998) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-393538498514551970229 : Rat) / 22174606515653643488) [(12, 1), (14, 1), (16, 1)],
  term ((101096103663341664333 : Rat) / 11087303257826821744) [(12, 1), (14, 2), (16, 1)],
  term ((-1849652046840188687877349313934403850526141 : Rat) / 337415203702659030751481656517966109395996) [(12, 1), (15, 2), (16, 1)],
  term ((36555299356401288237 : Rat) / 5543651628913410872) [(12, 1), (16, 1)],
  term ((-27797602238580545272900451391739703424000 : Rat) / 84353800925664757687870414129491527348999) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13898801119290272636450225695869851712000 : Rat) / 84353800925664757687870414129491527348999) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-220602893297477641842652913471410255050 : Rat) / 2908751756057405437512772901016949218931) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((43316814316511162271 : Rat) / 5543651628913410872) [(12, 2), (14, 1), (16, 1)],
  term ((110301446648738820921326456735705127525 : Rat) / 2908751756057405437512772901016949218931) [(12, 2), (15, 2), (16, 1)],
  term ((-43316814316511162271 : Rat) / 11087303257826821744) [(12, 2), (16, 1)],
  term ((117296549119730494110770165886579515184075 : Rat) / 84353800925664757687870414129491527348999) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13706723640394173126426503404644670884708903 : Rat) / 674830407405318061502963313035932218791992) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((11829978854478485220654180750459398641763703 : Rat) / 2699321629621272246011853252143728875167968) [(13, 1), (15, 1), (16, 1)],
  term ((-8876484422520039786 : Rat) / 692956453614176359) [(13, 2), (14, 1), (16, 1)],
  term ((66400227189052371603777552889532678323200 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-213058087658861142861 : Rat) / 11087303257826821744) [(13, 2), (14, 2), (16, 1)],
  term ((-16600056797263092900944388222383169580800 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (15, 2), (16, 1)],
  term ((497105589179502416013 : Rat) / 44349213031307286976) [(13, 2), (16, 1)],
  term ((-446629905365026234848549805928890368000 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-3477610273856076479348979362074663891200 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (14, 2), (15, 1), (16, 1)],
  term ((1092717521146532237261519743483111156800 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (15, 1), (16, 1)],
  term ((69965514806458076266086138382588776620250 : Rat) / 84353800925664757687870414129491527348999) [(14, 1), (15, 2), (16, 1)],
  term ((6653508242253550983 : Rat) / 2771825814456705436) [(14, 1), (16, 1)],
  term ((-30294343031910415483625979719255817865200 : Rat) / 84353800925664757687870414129491527348999) [(14, 2), (15, 2), (16, 1)],
  term ((-2312443096854046489 : Rat) / 22174606515653643488) [(14, 2), (16, 1)],
  term ((-27409171645251434262136574261480433843825 : Rat) / 84353800925664757687870414129491527348999) [(15, 2), (16, 1)],
  term ((-104143688779202769239 : Rat) / 88698426062614573952) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 1800 through 1847. -/
theorem ep_Q2_008_block_27_1800_1847_valid :
    checkProductSumEq ep_Q2_008_partials_27_1800_1847
      ep_Q2_008_block_27_1800_1847 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
