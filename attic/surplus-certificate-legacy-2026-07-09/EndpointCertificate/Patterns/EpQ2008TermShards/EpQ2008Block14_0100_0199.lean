/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 14:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 14 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_14_0100_0199 : Poly :=
[
  term (2 : Rat) [(4, 1), (12, 1)],
  term (2 : Rat) [(5, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0100 : Poly :=
[
  term ((1163406717006699383447146755879610415685600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 14. -/
def ep_Q2_008_partial_14_0100 : Poly :=
[
  term ((2326813434013398766894293511759220831371200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2326813434013398766894293511759220831371200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1163406717006699383447146755879610415685600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1163406717006699383447146755879610415685600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 14. -/
theorem ep_Q2_008_partial_14_0100_valid :
    mulPoly ep_Q2_008_coefficient_14_0100
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0101 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 101 for generator 14. -/
def ep_Q2_008_partial_14_0101 : Poly :=
[
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 14. -/
theorem ep_Q2_008_partial_14_0101_valid :
    mulPoly ep_Q2_008_coefficient_14_0101
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0102 : Poly :=
[
  term ((-4168984499521821000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 102 for generator 14. -/
def ep_Q2_008_partial_14_0102 : Poly :=
[
  term ((-8337968999043642000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-8337968999043642000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 3), (16, 1)],
  term ((4168984499521821000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((4168984499521821000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 14. -/
theorem ep_Q2_008_partial_14_0102_valid :
    mulPoly ep_Q2_008_coefficient_14_0102
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0103 : Poly :=
[
  term ((-345128596326691743681494913955324780800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 14. -/
def ep_Q2_008_partial_14_0103 : Poly :=
[
  term ((-690257192653383487362989827910649561600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-690257192653383487362989827910649561600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((345128596326691743681494913955324780800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((345128596326691743681494913955324780800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 14. -/
theorem ep_Q2_008_partial_14_0103_valid :
    mulPoly ep_Q2_008_coefficient_14_0103
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0104 : Poly :=
[
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 104 for generator 14. -/
def ep_Q2_008_partial_14_0104 : Poly :=
[
  term ((2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 14. -/
theorem ep_Q2_008_partial_14_0104_valid :
    mulPoly ep_Q2_008_coefficient_14_0104
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0105 : Poly :=
[
  term ((26395544874479014125 : Rat) / 11087303257826821744) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 105 for generator 14. -/
def ep_Q2_008_partial_14_0105 : Poly :=
[
  term ((26395544874479014125 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((26395544874479014125 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-26395544874479014125 : Rat) / 11087303257826821744) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-26395544874479014125 : Rat) / 11087303257826821744) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 14. -/
theorem ep_Q2_008_partial_14_0105_valid :
    mulPoly ep_Q2_008_coefficient_14_0105
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0106 : Poly :=
[
  term ((-7193516809785123211251598039946631782400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 14. -/
def ep_Q2_008_partial_14_0106 : Poly :=
[
  term ((-14387033619570246422503196079893263564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((-14387033619570246422503196079893263564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7193516809785123211251598039946631782400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((7193516809785123211251598039946631782400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 14. -/
theorem ep_Q2_008_partial_14_0106_valid :
    mulPoly ep_Q2_008_coefficient_14_0106
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0107 : Poly :=
[
  term ((221919883030210679699258829180721348800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 107 for generator 14. -/
def ep_Q2_008_partial_14_0107 : Poly :=
[
  term ((443839766060421359398517658361442697600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((443839766060421359398517658361442697600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-221919883030210679699258829180721348800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-221919883030210679699258829180721348800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 14. -/
theorem ep_Q2_008_partial_14_0107_valid :
    mulPoly ep_Q2_008_coefficient_14_0107
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0108 : Poly :=
[
  term ((-15566498222321469819 : Rat) / 22174606515653643488) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 108 for generator 14. -/
def ep_Q2_008_partial_14_0108 : Poly :=
[
  term ((-15566498222321469819 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-15566498222321469819 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((15566498222321469819 : Rat) / 22174606515653643488) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term ((15566498222321469819 : Rat) / 22174606515653643488) [(3, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 14. -/
theorem ep_Q2_008_partial_14_0108_valid :
    mulPoly ep_Q2_008_coefficient_14_0108
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0109 : Poly :=
[
  term ((-7983864090657473113112702734066235990400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 14. -/
def ep_Q2_008_partial_14_0109 : Poly :=
[
  term ((-15967728181314946226225405468132471980800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-15967728181314946226225405468132471980800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((7983864090657473113112702734066235990400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((7983864090657473113112702734066235990400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 14. -/
theorem ep_Q2_008_partial_14_0109_valid :
    mulPoly ep_Q2_008_coefficient_14_0109
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0110 : Poly :=
[
  term ((-13721890041759525469219392208514778304509 : Rat) / 46540028096918487000204366416271187502896) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 14. -/
def ep_Q2_008_partial_14_0110 : Poly :=
[
  term ((-13721890041759525469219392208514778304509 : Rat) / 23270014048459243500102183208135593751448) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13721890041759525469219392208514778304509 : Rat) / 23270014048459243500102183208135593751448) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((13721890041759525469219392208514778304509 : Rat) / 46540028096918487000204366416271187502896) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((13721890041759525469219392208514778304509 : Rat) / 46540028096918487000204366416271187502896) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 14. -/
theorem ep_Q2_008_partial_14_0110_valid :
    mulPoly ep_Q2_008_coefficient_14_0110
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0111 : Poly :=
[
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 14. -/
def ep_Q2_008_partial_14_0111 : Poly :=
[
  term ((863269656038284001922505986804115200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((863269656038284001922505986804115200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 14. -/
theorem ep_Q2_008_partial_14_0111_valid :
    mulPoly ep_Q2_008_coefficient_14_0111
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0112 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (16, 1)]
]

/-- Partial product 112 for generator 14. -/
def ep_Q2_008_partial_14_0112 : Poly :=
[
  term ((1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (12, 2), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 14. -/
theorem ep_Q2_008_partial_14_0112_valid :
    mulPoly ep_Q2_008_coefficient_14_0112
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0113 : Poly :=
[
  term ((1804205182183737225 : Rat) / 692956453614176359) [(3, 2), (16, 1)]
]

/-- Partial product 113 for generator 14. -/
def ep_Q2_008_partial_14_0113 : Poly :=
[
  term ((3608410364367474450 : Rat) / 692956453614176359) [(3, 2), (4, 1), (12, 1), (16, 1)],
  term ((3608410364367474450 : Rat) / 692956453614176359) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 692956453614176359) [(3, 2), (12, 2), (16, 1)],
  term ((-1804205182183737225 : Rat) / 692956453614176359) [(3, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 14. -/
theorem ep_Q2_008_partial_14_0113_valid :
    mulPoly ep_Q2_008_coefficient_14_0113
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0114 : Poly :=
[
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 14. -/
def ep_Q2_008_partial_14_0114 : Poly :=
[
  term ((7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 14. -/
theorem ep_Q2_008_partial_14_0114_valid :
    mulPoly ep_Q2_008_coefficient_14_0114
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0115 : Poly :=
[
  term ((17984823394286703351 : Rat) / 5543651628913410872) [(4, 1), (16, 1)]
]

/-- Partial product 115 for generator 14. -/
def ep_Q2_008_partial_14_0115 : Poly :=
[
  term ((17984823394286703351 : Rat) / 2771825814456705436) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-17984823394286703351 : Rat) / 5543651628913410872) [(4, 1), (12, 2), (16, 1)],
  term ((-17984823394286703351 : Rat) / 5543651628913410872) [(4, 1), (13, 2), (16, 1)],
  term ((17984823394286703351 : Rat) / 2771825814456705436) [(4, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 14. -/
theorem ep_Q2_008_partial_14_0115_valid :
    mulPoly ep_Q2_008_coefficient_14_0115
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0116 : Poly :=
[
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 14. -/
def ep_Q2_008_partial_14_0116 : Poly :=
[
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 14. -/
theorem ep_Q2_008_partial_14_0116_valid :
    mulPoly ep_Q2_008_coefficient_14_0116
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0117 : Poly :=
[
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 14. -/
def ep_Q2_008_partial_14_0117 : Poly :=
[
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 14. -/
theorem ep_Q2_008_partial_14_0117_valid :
    mulPoly ep_Q2_008_coefficient_14_0117
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0118 : Poly :=
[
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 118 for generator 14. -/
def ep_Q2_008_partial_14_0118 : Poly :=
[
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 4), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(5, 2), (6, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 14. -/
theorem ep_Q2_008_partial_14_0118_valid :
    mulPoly ep_Q2_008_coefficient_14_0118
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0119 : Poly :=
[
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 119 for generator 14. -/
def ep_Q2_008_partial_14_0119 : Poly :=
[
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(5, 2), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 14. -/
theorem ep_Q2_008_partial_14_0119_valid :
    mulPoly ep_Q2_008_coefficient_14_0119
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0120 : Poly :=
[
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 120 for generator 14. -/
def ep_Q2_008_partial_14_0120 : Poly :=
[
  term ((129167667102054335688 : Rat) / 692956453614176359) [(4, 1), (5, 1), (7, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 4), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(5, 2), (7, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 14. -/
theorem ep_Q2_008_partial_14_0120_valid :
    mulPoly ep_Q2_008_coefficient_14_0120
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0121 : Poly :=
[
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 121 for generator 14. -/
def ep_Q2_008_partial_14_0121 : Poly :=
[
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(5, 2), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 14. -/
theorem ep_Q2_008_partial_14_0121_valid :
    mulPoly ep_Q2_008_coefficient_14_0121
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0122 : Poly :=
[
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 14. -/
def ep_Q2_008_partial_14_0122 : Poly :=
[
  term ((1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 14. -/
theorem ep_Q2_008_partial_14_0122_valid :
    mulPoly ep_Q2_008_coefficient_14_0122
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0123 : Poly :=
[
  term ((1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 123 for generator 14. -/
def ep_Q2_008_partial_14_0123 : Poly :=
[
  term ((2904341642232903893101346122774464000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((-1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 3), (13, 2), (15, 2), (16, 1)],
  term ((2904341642232903893101346122774464000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 14. -/
theorem ep_Q2_008_partial_14_0123_valid :
    mulPoly ep_Q2_008_coefficient_14_0123
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0124 : Poly :=
[
  term ((-38914381480898385495802350011030400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 124 for generator 14. -/
def ep_Q2_008_partial_14_0124 : Poly :=
[
  term ((-77828762961796770991604700022060800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((38914381480898385495802350011030400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((38914381480898385495802350011030400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 3), (15, 2), (16, 1)],
  term ((-77828762961796770991604700022060800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 14. -/
theorem ep_Q2_008_partial_14_0124_valid :
    mulPoly ep_Q2_008_coefficient_14_0124
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0125 : Poly :=
[
  term ((-535784593804076551521473819054308800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 14. -/
def ep_Q2_008_partial_14_0125 : Poly :=
[
  term ((-1071569187608153103042947638108617600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((535784593804076551521473819054308800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((535784593804076551521473819054308800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1071569187608153103042947638108617600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 14. -/
theorem ep_Q2_008_partial_14_0125_valid :
    mulPoly ep_Q2_008_coefficient_14_0125
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0126 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 126 for generator 14. -/
def ep_Q2_008_partial_14_0126 : Poly :=
[
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 14. -/
theorem ep_Q2_008_partial_14_0126_valid :
    mulPoly ep_Q2_008_coefficient_14_0126
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0127 : Poly :=
[
  term ((-2597772246663875148829537365370492800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 127 for generator 14. -/
def ep_Q2_008_partial_14_0127 : Poly :=
[
  term ((-5195544493327750297659074730740985600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((2597772246663875148829537365370492800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((2597772246663875148829537365370492800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((-5195544493327750297659074730740985600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 14. -/
theorem ep_Q2_008_partial_14_0127_valid :
    mulPoly ep_Q2_008_coefficient_14_0127
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0128 : Poly :=
[
  term ((726085410558225973275336530693616000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 14. -/
def ep_Q2_008_partial_14_0128 : Poly :=
[
  term ((1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-726085410558225973275336530693616000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-726085410558225973275336530693616000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 5), (15, 1), (16, 1)],
  term ((1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 14. -/
theorem ep_Q2_008_partial_14_0128_valid :
    mulPoly ep_Q2_008_coefficient_14_0128
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0129 : Poly :=
[
  term ((25151978274239200381433226226641600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 129 for generator 14. -/
def ep_Q2_008_partial_14_0129 : Poly :=
[
  term ((50303956548478400762866452453283200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-25151978274239200381433226226641600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-25151978274239200381433226226641600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((50303956548478400762866452453283200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 14. -/
theorem ep_Q2_008_partial_14_0129_valid :
    mulPoly ep_Q2_008_coefficient_14_0129
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0130 : Poly :=
[
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 14. -/
def ep_Q2_008_partial_14_0130 : Poly :=
[
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 2), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 14. -/
theorem ep_Q2_008_partial_14_0130_valid :
    mulPoly ep_Q2_008_coefficient_14_0130
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0131 : Poly :=
[
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 14. -/
def ep_Q2_008_partial_14_0131 : Poly :=
[
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 14. -/
theorem ep_Q2_008_partial_14_0131_valid :
    mulPoly ep_Q2_008_coefficient_14_0131
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0132 : Poly :=
[
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 132 for generator 14. -/
def ep_Q2_008_partial_14_0132 : Poly :=
[
  term ((172223556136072447584 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 3), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (12, 3), (13, 1), (16, 1)],
  term ((172223556136072447584 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 14. -/
theorem ep_Q2_008_partial_14_0132_valid :
    mulPoly ep_Q2_008_coefficient_14_0132
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0133 : Poly :=
[
  term ((242189375816351879415 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 14. -/
def ep_Q2_008_partial_14_0133 : Poly :=
[
  term ((484378751632703758830 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-242189375816351879415 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-242189375816351879415 : Rat) / 692956453614176359) [(5, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((484378751632703758830 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 14. -/
theorem ep_Q2_008_partial_14_0133_valid :
    mulPoly ep_Q2_008_coefficient_14_0133
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0134 : Poly :=
[
  term ((-127095637984555912203 : Rat) / 11087303257826821744) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 14. -/
def ep_Q2_008_partial_14_0134 : Poly :=
[
  term ((-127095637984555912203 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((127095637984555912203 : Rat) / 11087303257826821744) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((127095637984555912203 : Rat) / 11087303257826821744) [(5, 1), (12, 3), (15, 1), (16, 1)],
  term ((-127095637984555912203 : Rat) / 5543651628913410872) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 14. -/
theorem ep_Q2_008_partial_14_0134_valid :
    mulPoly ep_Q2_008_coefficient_14_0134
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0135 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 135 for generator 14. -/
def ep_Q2_008_partial_14_0135 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (13, 3), (15, 2), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 14. -/
theorem ep_Q2_008_partial_14_0135_valid :
    mulPoly ep_Q2_008_coefficient_14_0135
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0136 : Poly :=
[
  term ((-2882672536161715073547 : Rat) / 22174606515653643488) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 136 for generator 14. -/
def ep_Q2_008_partial_14_0136 : Poly :=
[
  term ((-2882672536161715073547 : Rat) / 11087303257826821744) [(4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((2882672536161715073547 : Rat) / 22174606515653643488) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((2882672536161715073547 : Rat) / 22174606515653643488) [(5, 1), (13, 3), (16, 1)],
  term ((-2882672536161715073547 : Rat) / 11087303257826821744) [(5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 14. -/
theorem ep_Q2_008_partial_14_0136_valid :
    mulPoly ep_Q2_008_coefficient_14_0136
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0137 : Poly :=
[
  term ((-866499766809614501907 : Rat) / 1385912907228352718) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 14. -/
def ep_Q2_008_partial_14_0137 : Poly :=
[
  term ((-866499766809614501907 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((866499766809614501907 : Rat) / 1385912907228352718) [(5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((866499766809614501907 : Rat) / 1385912907228352718) [(5, 1), (13, 4), (15, 1), (16, 1)],
  term ((-866499766809614501907 : Rat) / 692956453614176359) [(5, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 14. -/
theorem ep_Q2_008_partial_14_0137_valid :
    mulPoly ep_Q2_008_coefficient_14_0137
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0138 : Poly :=
[
  term ((242189375816351879415 : Rat) / 1385912907228352718) [(5, 1), (13, 3), (16, 1)]
]

/-- Partial product 138 for generator 14. -/
def ep_Q2_008_partial_14_0138 : Poly :=
[
  term ((242189375816351879415 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 3), (16, 1)],
  term ((-242189375816351879415 : Rat) / 1385912907228352718) [(5, 1), (12, 2), (13, 3), (16, 1)],
  term ((-242189375816351879415 : Rat) / 1385912907228352718) [(5, 1), (13, 5), (16, 1)],
  term ((242189375816351879415 : Rat) / 692956453614176359) [(5, 2), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 14. -/
theorem ep_Q2_008_partial_14_0138_valid :
    mulPoly ep_Q2_008_coefficient_14_0138
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0139 : Poly :=
[
  term ((17912901500807099039872241275243417596477279 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 139 for generator 14. -/
def ep_Q2_008_partial_14_0139 : Poly :=
[
  term ((17912901500807099039872241275243417596477279 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17912901500807099039872241275243417596477279 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-17912901500807099039872241275243417596477279 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((17912901500807099039872241275243417596477279 : Rat) / 1349660814810636123005926626071864437583984) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 14. -/
theorem ep_Q2_008_partial_14_0139_valid :
    mulPoly ep_Q2_008_coefficient_14_0139
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0140 : Poly :=
[
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 14. -/
def ep_Q2_008_partial_14_0140 : Poly :=
[
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 14. -/
theorem ep_Q2_008_partial_14_0140_valid :
    mulPoly ep_Q2_008_coefficient_14_0140
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0141 : Poly :=
[
  term ((-90470383515529199284480813725696000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 141 for generator 14. -/
def ep_Q2_008_partial_14_0141 : Poly :=
[
  term ((-180940767031058398568961627451392000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-180940767031058398568961627451392000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((90470383515529199284480813725696000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((90470383515529199284480813725696000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 14. -/
theorem ep_Q2_008_partial_14_0141_valid :
    mulPoly ep_Q2_008_coefficient_14_0141
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0142 : Poly :=
[
  term ((1094816955793144869 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 142 for generator 14. -/
def ep_Q2_008_partial_14_0142 : Poly :=
[
  term ((2189633911586289738 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 14. -/
theorem ep_Q2_008_partial_14_0142_valid :
    mulPoly ep_Q2_008_coefficient_14_0142
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0143 : Poly :=
[
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 14. -/
def ep_Q2_008_partial_14_0143 : Poly :=
[
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 14. -/
theorem ep_Q2_008_partial_14_0143_valid :
    mulPoly ep_Q2_008_coefficient_14_0143
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0144 : Poly :=
[
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 144 for generator 14. -/
def ep_Q2_008_partial_14_0144 : Poly :=
[
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 14. -/
theorem ep_Q2_008_partial_14_0144_valid :
    mulPoly ep_Q2_008_coefficient_14_0144
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0145 : Poly :=
[
  term ((4624670165699233431 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 145 for generator 14. -/
def ep_Q2_008_partial_14_0145 : Poly :=
[
  term ((9249340331398466862 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 14. -/
theorem ep_Q2_008_partial_14_0145_valid :
    mulPoly ep_Q2_008_coefficient_14_0145
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0146 : Poly :=
[
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 146 for generator 14. -/
def ep_Q2_008_partial_14_0146 : Poly :=
[
  term ((-36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 14. -/
theorem ep_Q2_008_partial_14_0146_valid :
    mulPoly ep_Q2_008_coefficient_14_0146
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0147 : Poly :=
[
  term ((231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 147 for generator 14. -/
def ep_Q2_008_partial_14_0147 : Poly :=
[
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 14. -/
theorem ep_Q2_008_partial_14_0147_valid :
    mulPoly ep_Q2_008_coefficient_14_0147
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0148 : Poly :=
[
  term ((149422541345374872278056843964253600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 148 for generator 14. -/
def ep_Q2_008_partial_14_0148 : Poly :=
[
  term ((298845082690749744556113687928507200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((298845082690749744556113687928507200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-149422541345374872278056843964253600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-149422541345374872278056843964253600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 14. -/
theorem ep_Q2_008_partial_14_0148_valid :
    mulPoly ep_Q2_008_coefficient_14_0148
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0149 : Poly :=
[
  term ((-9148009761726501624078082280745600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 14. -/
def ep_Q2_008_partial_14_0149 : Poly :=
[
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((9148009761726501624078082280745600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((9148009761726501624078082280745600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 14. -/
theorem ep_Q2_008_partial_14_0149_valid :
    mulPoly ep_Q2_008_coefficient_14_0149
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0150 : Poly :=
[
  term ((-767382717319220886788006902137600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 150 for generator 14. -/
def ep_Q2_008_partial_14_0150 : Poly :=
[
  term ((-1534765434638441773576013804275200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1534765434638441773576013804275200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((767382717319220886788006902137600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((767382717319220886788006902137600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 14. -/
theorem ep_Q2_008_partial_14_0150_valid :
    mulPoly ep_Q2_008_coefficient_14_0150
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0151 : Poly :=
[
  term ((-424892742580940454295825321650016800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 151 for generator 14. -/
def ep_Q2_008_partial_14_0151 : Poly :=
[
  term ((-849785485161880908591650643300033600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-849785485161880908591650643300033600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((424892742580940454295825321650016800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((424892742580940454295825321650016800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 14. -/
theorem ep_Q2_008_partial_14_0151_valid :
    mulPoly ep_Q2_008_coefficient_14_0151
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0152 : Poly :=
[
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 14. -/
def ep_Q2_008_partial_14_0152 : Poly :=
[
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 14. -/
theorem ep_Q2_008_partial_14_0152_valid :
    mulPoly ep_Q2_008_coefficient_14_0152
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0153 : Poly :=
[
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 153 for generator 14. -/
def ep_Q2_008_partial_14_0153 : Poly :=
[
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 14. -/
theorem ep_Q2_008_partial_14_0153_valid :
    mulPoly ep_Q2_008_coefficient_14_0153
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0154 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 154 for generator 14. -/
def ep_Q2_008_partial_14_0154 : Poly :=
[
  term ((13891959801170136000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(5, 1), (6, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 14. -/
theorem ep_Q2_008_partial_14_0154_valid :
    mulPoly ep_Q2_008_coefficient_14_0154
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0155 : Poly :=
[
  term ((80393285886401250 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 155 for generator 14. -/
def ep_Q2_008_partial_14_0155 : Poly :=
[
  term ((160786571772802500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-80393285886401250 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-80393285886401250 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 14. -/
theorem ep_Q2_008_partial_14_0155_valid :
    mulPoly ep_Q2_008_coefficient_14_0155
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0156 : Poly :=
[
  term ((651449898675654799017452339064291840000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 156 for generator 14. -/
def ep_Q2_008_partial_14_0156 : Poly :=
[
  term ((1302899797351309598034904678128583680000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1302899797351309598034904678128583680000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-651449898675654799017452339064291840000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-651449898675654799017452339064291840000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 14. -/
theorem ep_Q2_008_partial_14_0156_valid :
    mulPoly ep_Q2_008_coefficient_14_0156
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0157 : Poly :=
[
  term ((-27749316280348855071 : Rat) / 1385912907228352718) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 157 for generator 14. -/
def ep_Q2_008_partial_14_0157 : Poly :=
[
  term ((-27749316280348855071 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-27749316280348855071 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((27749316280348855071 : Rat) / 1385912907228352718) [(6, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((27749316280348855071 : Rat) / 1385912907228352718) [(6, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 14. -/
theorem ep_Q2_008_partial_14_0157_valid :
    mulPoly ep_Q2_008_coefficient_14_0157
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0158 : Poly :=
[
  term ((10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 14. -/
def ep_Q2_008_partial_14_0158 : Poly :=
[
  term ((21558147229296800814651749709232192358400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((21558147229296800814651749709232192358400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 14. -/
theorem ep_Q2_008_partial_14_0158_valid :
    mulPoly ep_Q2_008_coefficient_14_0158
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0159 : Poly :=
[
  term ((-1123528436283935257980747756394748713368621 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 159 for generator 14. -/
def ep_Q2_008_partial_14_0159 : Poly :=
[
  term ((-1123528436283935257980747756394748713368621 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1123528436283935257980747756394748713368621 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1123528436283935257980747756394748713368621 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1123528436283935257980747756394748713368621 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 14. -/
theorem ep_Q2_008_partial_14_0159_valid :
    mulPoly ep_Q2_008_coefficient_14_0159
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0160 : Poly :=
[
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 14. -/
def ep_Q2_008_partial_14_0160 : Poly :=
[
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 14. -/
theorem ep_Q2_008_partial_14_0160_valid :
    mulPoly ep_Q2_008_coefficient_14_0160
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0161 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 2), (16, 1)]
]

/-- Partial product 161 for generator 14. -/
def ep_Q2_008_partial_14_0161 : Poly :=
[
  term ((28587322282435344000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 2), (13, 3), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (12, 2), (13, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 14. -/
theorem ep_Q2_008_partial_14_0161_valid :
    mulPoly ep_Q2_008_coefficient_14_0161
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0162 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 14. -/
def ep_Q2_008_partial_14_0162 : Poly :=
[
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (11, 2), (13, 4), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 14. -/
theorem ep_Q2_008_partial_14_0162_valid :
    mulPoly ep_Q2_008_coefficient_14_0162
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0163 : Poly :=
[
  term ((3830163888954054375 : Rat) / 1385912907228352718) [(6, 1), (11, 2), (16, 1)]
]

/-- Partial product 163 for generator 14. -/
def ep_Q2_008_partial_14_0163 : Poly :=
[
  term ((3830163888954054375 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 2), (12, 1), (16, 1)],
  term ((3830163888954054375 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 2), (13, 1), (16, 1)],
  term ((-3830163888954054375 : Rat) / 1385912907228352718) [(6, 1), (11, 2), (12, 2), (16, 1)],
  term ((-3830163888954054375 : Rat) / 1385912907228352718) [(6, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 14. -/
theorem ep_Q2_008_partial_14_0163_valid :
    mulPoly ep_Q2_008_coefficient_14_0163
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0164 : Poly :=
[
  term ((23985511571295349047 : Rat) / 2771825814456705436) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 14. -/
def ep_Q2_008_partial_14_0164 : Poly :=
[
  term ((23985511571295349047 : Rat) / 1385912907228352718) [(4, 1), (6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((23985511571295349047 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-23985511571295349047 : Rat) / 2771825814456705436) [(6, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-23985511571295349047 : Rat) / 2771825814456705436) [(6, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 14. -/
theorem ep_Q2_008_partial_14_0164_valid :
    mulPoly ep_Q2_008_coefficient_14_0164
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0165 : Poly :=
[
  term ((-3435233678578325465784110552734491249023163 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 165 for generator 14. -/
def ep_Q2_008_partial_14_0165 : Poly :=
[
  term ((-3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3435233678578325465784110552734491249023163 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((3435233678578325465784110552734491249023163 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 14. -/
theorem ep_Q2_008_partial_14_0165_valid :
    mulPoly ep_Q2_008_coefficient_14_0165
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0166 : Poly :=
[
  term ((-24846833819741685755172694631744020516529721 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 14. -/
def ep_Q2_008_partial_14_0166 : Poly :=
[
  term ((-24846833819741685755172694631744020516529721 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24846833819741685755172694631744020516529721 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((24846833819741685755172694631744020516529721 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((24846833819741685755172694631744020516529721 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 14. -/
theorem ep_Q2_008_partial_14_0166_valid :
    mulPoly ep_Q2_008_coefficient_14_0166
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0167 : Poly :=
[
  term ((23985511571295349047 : Rat) / 5543651628913410872) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 167 for generator 14. -/
def ep_Q2_008_partial_14_0167 : Poly :=
[
  term ((23985511571295349047 : Rat) / 2771825814456705436) [(4, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((23985511571295349047 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (13, 3), (16, 1)],
  term ((-23985511571295349047 : Rat) / 5543651628913410872) [(6, 1), (12, 2), (13, 2), (16, 1)],
  term ((-23985511571295349047 : Rat) / 5543651628913410872) [(6, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 14. -/
theorem ep_Q2_008_partial_14_0167_valid :
    mulPoly ep_Q2_008_coefficient_14_0167
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0168 : Poly :=
[
  term ((12537687741124122429604655922450966042059331 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 168 for generator 14. -/
def ep_Q2_008_partial_14_0168 : Poly :=
[
  term ((12537687741124122429604655922450966042059331 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((12537687741124122429604655922450966042059331 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12537687741124122429604655922450966042059331 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-12537687741124122429604655922450966042059331 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 14. -/
theorem ep_Q2_008_partial_14_0168_valid :
    mulPoly ep_Q2_008_coefficient_14_0168
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0169 : Poly :=
[
  term ((6491767364065373557 : Rat) / 1385912907228352718) [(6, 1), (16, 1)]
]

/-- Partial product 169 for generator 14. -/
def ep_Q2_008_partial_14_0169 : Poly :=
[
  term ((6491767364065373557 : Rat) / 692956453614176359) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((6491767364065373557 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-6491767364065373557 : Rat) / 1385912907228352718) [(6, 1), (12, 2), (16, 1)],
  term ((-6491767364065373557 : Rat) / 1385912907228352718) [(6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 14. -/
theorem ep_Q2_008_partial_14_0169_valid :
    mulPoly ep_Q2_008_coefficient_14_0169
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0170 : Poly :=
[
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 14. -/
def ep_Q2_008_partial_14_0170 : Poly :=
[
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 14. -/
theorem ep_Q2_008_partial_14_0170_valid :
    mulPoly ep_Q2_008_coefficient_14_0170
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0171 : Poly :=
[
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 14. -/
def ep_Q2_008_partial_14_0171 : Poly :=
[
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 14. -/
theorem ep_Q2_008_partial_14_0171_valid :
    mulPoly ep_Q2_008_coefficient_14_0171
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0172 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 172 for generator 14. -/
def ep_Q2_008_partial_14_0172 : Poly :=
[
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(4, 1), (7, 1), (10, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 14. -/
theorem ep_Q2_008_partial_14_0172_valid :
    mulPoly ep_Q2_008_coefficient_14_0172
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0173 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 173 for generator 14. -/
def ep_Q2_008_partial_14_0173 : Poly :=
[
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (10, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 14. -/
theorem ep_Q2_008_partial_14_0173_valid :
    mulPoly ep_Q2_008_coefficient_14_0173
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0174 : Poly :=
[
  term ((-3830163888954054375 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 174 for generator 14. -/
def ep_Q2_008_partial_14_0174 : Poly :=
[
  term ((-3830163888954054375 : Rat) / 692956453614176359) [(4, 1), (7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3830163888954054375 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3830163888954054375 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((3830163888954054375 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 14. -/
theorem ep_Q2_008_partial_14_0174_valid :
    mulPoly ep_Q2_008_coefficient_14_0174
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0175 : Poly :=
[
  term ((-651449898675654799017452339064291840000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 175 for generator 14. -/
def ep_Q2_008_partial_14_0175 : Poly :=
[
  term ((-1302899797351309598034904678128583680000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1302899797351309598034904678128583680000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((651449898675654799017452339064291840000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((651449898675654799017452339064291840000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 14. -/
theorem ep_Q2_008_partial_14_0175_valid :
    mulPoly ep_Q2_008_coefficient_14_0175
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0176 : Poly :=
[
  term ((959645157456388149 : Rat) / 47790100249253542) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 176 for generator 14. -/
def ep_Q2_008_partial_14_0176 : Poly :=
[
  term ((959645157456388149 : Rat) / 23895050124626771) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((959645157456388149 : Rat) / 23895050124626771) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((-959645157456388149 : Rat) / 47790100249253542) [(7, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-959645157456388149 : Rat) / 47790100249253542) [(7, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 14. -/
theorem ep_Q2_008_partial_14_0176_valid :
    mulPoly ep_Q2_008_coefficient_14_0176
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0177 : Poly :=
[
  term ((-10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 177 for generator 14. -/
def ep_Q2_008_partial_14_0177 : Poly :=
[
  term ((-21558147229296800814651749709232192358400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21558147229296800814651749709232192358400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 14. -/
theorem ep_Q2_008_partial_14_0177_valid :
    mulPoly ep_Q2_008_coefficient_14_0177
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0178 : Poly :=
[
  term ((1051762241666102759812986055633265271626121 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 178 for generator 14. -/
def ep_Q2_008_partial_14_0178 : Poly :=
[
  term ((1051762241666102759812986055633265271626121 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1051762241666102759812986055633265271626121 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1051762241666102759812986055633265271626121 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1051762241666102759812986055633265271626121 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 14. -/
theorem ep_Q2_008_partial_14_0178_valid :
    mulPoly ep_Q2_008_coefficient_14_0178
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0179 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 179 for generator 14. -/
def ep_Q2_008_partial_14_0179 : Poly :=
[
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(4, 1), (7, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 2), (13, 2), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (12, 2), (13, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 14. -/
theorem ep_Q2_008_partial_14_0179_valid :
    mulPoly ep_Q2_008_coefficient_14_0179
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0180 : Poly :=
[
  term ((26797761962133750 : Rat) / 692956453614176359) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 180 for generator 14. -/
def ep_Q2_008_partial_14_0180 : Poly :=
[
  term ((53595523924267500 : Rat) / 692956453614176359) [(4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-26797761962133750 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-26797761962133750 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 14. -/
theorem ep_Q2_008_partial_14_0180_valid :
    mulPoly ep_Q2_008_coefficient_14_0180
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0181 : Poly :=
[
  term ((1991279057172075562219967743669000800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 181 for generator 14. -/
def ep_Q2_008_partial_14_0181 : Poly :=
[
  term ((3982558114344151124439935487338001600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((3982558114344151124439935487338001600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1991279057172075562219967743669000800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1991279057172075562219967743669000800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 14. -/
theorem ep_Q2_008_partial_14_0181_valid :
    mulPoly ep_Q2_008_coefficient_14_0181
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0182 : Poly :=
[
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 182 for generator 14. -/
def ep_Q2_008_partial_14_0182 : Poly :=
[
  term ((-2919511882115052984 : Rat) / 692956453614176359) [(4, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2919511882115052984 : Rat) / 692956453614176359) [(5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (12, 1), (13, 3), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 14. -/
theorem ep_Q2_008_partial_14_0182_valid :
    mulPoly ep_Q2_008_coefficient_14_0182
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0183 : Poly :=
[
  term ((-2002507330977353752026261238338550510594635 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 183 for generator 14. -/
def ep_Q2_008_partial_14_0183 : Poly :=
[
  term ((-2002507330977353752026261238338550510594635 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-2002507330977353752026261238338550510594635 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((2002507330977353752026261238338550510594635 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((2002507330977353752026261238338550510594635 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 14. -/
theorem ep_Q2_008_partial_14_0183_valid :
    mulPoly ep_Q2_008_coefficient_14_0183
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0184 : Poly :=
[
  term ((-82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 184 for generator 14. -/
def ep_Q2_008_partial_14_0184 : Poly :=
[
  term ((-165903094913906876638785592196740320000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((-165903094913906876638785592196740320000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 5), (15, 2), (16, 1)],
  term ((82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 3), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 14. -/
theorem ep_Q2_008_partial_14_0184_valid :
    mulPoly ep_Q2_008_coefficient_14_0184
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0185 : Poly :=
[
  term ((-1419093801081715622302940843950870205032677 : Rat) / 1349660814810636123005926626071864437583984) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 185 for generator 14. -/
def ep_Q2_008_partial_14_0185 : Poly :=
[
  term ((-1419093801081715622302940843950870205032677 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1419093801081715622302940843950870205032677 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1419093801081715622302940843950870205032677 : Rat) / 1349660814810636123005926626071864437583984) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1419093801081715622302940843950870205032677 : Rat) / 1349660814810636123005926626071864437583984) [(7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 14. -/
theorem ep_Q2_008_partial_14_0185_valid :
    mulPoly ep_Q2_008_coefficient_14_0185
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0186 : Poly :=
[
  term ((144439602253308615598716299145768000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 186 for generator 14. -/
def ep_Q2_008_partial_14_0186 : Poly :=
[
  term ((288879204506617231197432598291536000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((288879204506617231197432598291536000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-144439602253308615598716299145768000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-144439602253308615598716299145768000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 14. -/
theorem ep_Q2_008_partial_14_0186_valid :
    mulPoly ep_Q2_008_coefficient_14_0186
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0187 : Poly :=
[
  term ((-44408279975975875667462399060797294966503 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 187 for generator 14. -/
def ep_Q2_008_partial_14_0187 : Poly :=
[
  term ((-88816559951951751334924798121594589933006 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-88816559951951751334924798121594589933006 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((44408279975975875667462399060797294966503 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((44408279975975875667462399060797294966503 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 14. -/
theorem ep_Q2_008_partial_14_0187_valid :
    mulPoly ep_Q2_008_coefficient_14_0187
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0188 : Poly :=
[
  term ((108469927998105212979 : Rat) / 22174606515653643488) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 188 for generator 14. -/
def ep_Q2_008_partial_14_0188 : Poly :=
[
  term ((108469927998105212979 : Rat) / 11087303257826821744) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((108469927998105212979 : Rat) / 11087303257826821744) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-108469927998105212979 : Rat) / 22174606515653643488) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-108469927998105212979 : Rat) / 22174606515653643488) [(7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 14. -/
theorem ep_Q2_008_partial_14_0188_valid :
    mulPoly ep_Q2_008_coefficient_14_0188
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0189 : Poly :=
[
  term ((7155708536115337877539054628979219225936183 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 189 for generator 14. -/
def ep_Q2_008_partial_14_0189 : Poly :=
[
  term ((7155708536115337877539054628979219225936183 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((7155708536115337877539054628979219225936183 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-7155708536115337877539054628979219225936183 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-7155708536115337877539054628979219225936183 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 14. -/
theorem ep_Q2_008_partial_14_0189_valid :
    mulPoly ep_Q2_008_coefficient_14_0189
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0190 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 190 for generator 14. -/
def ep_Q2_008_partial_14_0190 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 2), (15, 3), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 14. -/
theorem ep_Q2_008_partial_14_0190_valid :
    mulPoly ep_Q2_008_coefficient_14_0190
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0191 : Poly :=
[
  term ((148391101561883372993580446353751064000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 191 for generator 14. -/
def ep_Q2_008_partial_14_0191 : Poly :=
[
  term ((296782203123766745987160892707502128000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((296782203123766745987160892707502128000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((-148391101561883372993580446353751064000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((-148391101561883372993580446353751064000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 5), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 14. -/
theorem ep_Q2_008_partial_14_0191_valid :
    mulPoly ep_Q2_008_coefficient_14_0191
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0192 : Poly :=
[
  term ((-16422254336897173035 : Rat) / 5543651628913410872) [(7, 1), (13, 3), (16, 1)]
]

/-- Partial product 192 for generator 14. -/
def ep_Q2_008_partial_14_0192 : Poly :=
[
  term ((-16422254336897173035 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (12, 1), (13, 3), (16, 1)],
  term ((-16422254336897173035 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (13, 4), (16, 1)],
  term ((16422254336897173035 : Rat) / 5543651628913410872) [(7, 1), (12, 2), (13, 3), (16, 1)],
  term ((16422254336897173035 : Rat) / 5543651628913410872) [(7, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 14. -/
theorem ep_Q2_008_partial_14_0192_valid :
    mulPoly ep_Q2_008_coefficient_14_0192
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0193 : Poly :=
[
  term ((-41475773728476719159696398049185080000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 193 for generator 14. -/
def ep_Q2_008_partial_14_0193 : Poly :=
[
  term ((-82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 5), (15, 1), (16, 1)],
  term ((41475773728476719159696398049185080000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((41475773728476719159696398049185080000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 6), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 14. -/
theorem ep_Q2_008_partial_14_0193_valid :
    mulPoly ep_Q2_008_coefficient_14_0193
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0194 : Poly :=
[
  term ((-2472937131491765565807098890099066012684059 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 194 for generator 14. -/
def ep_Q2_008_partial_14_0194 : Poly :=
[
  term ((-2472937131491765565807098890099066012684059 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2472937131491765565807098890099066012684059 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((2472937131491765565807098890099066012684059 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((2472937131491765565807098890099066012684059 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 14. -/
theorem ep_Q2_008_partial_14_0194_valid :
    mulPoly ep_Q2_008_coefficient_14_0194
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0195 : Poly :=
[
  term ((-288784403571509812827646652994415200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 195 for generator 14. -/
def ep_Q2_008_partial_14_0195 : Poly :=
[
  term ((-577568807143019625655293305988830400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-577568807143019625655293305988830400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((288784403571509812827646652994415200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (15, 3), (16, 1)],
  term ((288784403571509812827646652994415200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 14. -/
theorem ep_Q2_008_partial_14_0195_valid :
    mulPoly ep_Q2_008_coefficient_14_0195
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0196 : Poly :=
[
  term ((90470383515529199284480813725696000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 196 for generator 14. -/
def ep_Q2_008_partial_14_0196 : Poly :=
[
  term ((180940767031058398568961627451392000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((180940767031058398568961627451392000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-90470383515529199284480813725696000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-90470383515529199284480813725696000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 14. -/
theorem ep_Q2_008_partial_14_0196_valid :
    mulPoly ep_Q2_008_coefficient_14_0196
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0197 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 197 for generator 14. -/
def ep_Q2_008_partial_14_0197 : Poly :=
[
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(4, 1), (7, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(5, 1), (7, 2), (10, 1), (13, 3), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 14. -/
theorem ep_Q2_008_partial_14_0197_valid :
    mulPoly ep_Q2_008_coefficient_14_0197
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0198 : Poly :=
[
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 198 for generator 14. -/
def ep_Q2_008_partial_14_0198 : Poly :=
[
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (10, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 14. -/
theorem ep_Q2_008_partial_14_0198_valid :
    mulPoly ep_Q2_008_coefficient_14_0198
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0199 : Poly :=
[
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 199 for generator 14. -/
def ep_Q2_008_partial_14_0199 : Poly :=
[
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 14. -/
theorem ep_Q2_008_partial_14_0199_valid :
    mulPoly ep_Q2_008_coefficient_14_0199
        ep_Q2_008_generator_14_0100_0199 =
      ep_Q2_008_partial_14_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_14_0100_0199 : List Poly :=
[
  ep_Q2_008_partial_14_0100,
  ep_Q2_008_partial_14_0101,
  ep_Q2_008_partial_14_0102,
  ep_Q2_008_partial_14_0103,
  ep_Q2_008_partial_14_0104,
  ep_Q2_008_partial_14_0105,
  ep_Q2_008_partial_14_0106,
  ep_Q2_008_partial_14_0107,
  ep_Q2_008_partial_14_0108,
  ep_Q2_008_partial_14_0109,
  ep_Q2_008_partial_14_0110,
  ep_Q2_008_partial_14_0111,
  ep_Q2_008_partial_14_0112,
  ep_Q2_008_partial_14_0113,
  ep_Q2_008_partial_14_0114,
  ep_Q2_008_partial_14_0115,
  ep_Q2_008_partial_14_0116,
  ep_Q2_008_partial_14_0117,
  ep_Q2_008_partial_14_0118,
  ep_Q2_008_partial_14_0119,
  ep_Q2_008_partial_14_0120,
  ep_Q2_008_partial_14_0121,
  ep_Q2_008_partial_14_0122,
  ep_Q2_008_partial_14_0123,
  ep_Q2_008_partial_14_0124,
  ep_Q2_008_partial_14_0125,
  ep_Q2_008_partial_14_0126,
  ep_Q2_008_partial_14_0127,
  ep_Q2_008_partial_14_0128,
  ep_Q2_008_partial_14_0129,
  ep_Q2_008_partial_14_0130,
  ep_Q2_008_partial_14_0131,
  ep_Q2_008_partial_14_0132,
  ep_Q2_008_partial_14_0133,
  ep_Q2_008_partial_14_0134,
  ep_Q2_008_partial_14_0135,
  ep_Q2_008_partial_14_0136,
  ep_Q2_008_partial_14_0137,
  ep_Q2_008_partial_14_0138,
  ep_Q2_008_partial_14_0139,
  ep_Q2_008_partial_14_0140,
  ep_Q2_008_partial_14_0141,
  ep_Q2_008_partial_14_0142,
  ep_Q2_008_partial_14_0143,
  ep_Q2_008_partial_14_0144,
  ep_Q2_008_partial_14_0145,
  ep_Q2_008_partial_14_0146,
  ep_Q2_008_partial_14_0147,
  ep_Q2_008_partial_14_0148,
  ep_Q2_008_partial_14_0149,
  ep_Q2_008_partial_14_0150,
  ep_Q2_008_partial_14_0151,
  ep_Q2_008_partial_14_0152,
  ep_Q2_008_partial_14_0153,
  ep_Q2_008_partial_14_0154,
  ep_Q2_008_partial_14_0155,
  ep_Q2_008_partial_14_0156,
  ep_Q2_008_partial_14_0157,
  ep_Q2_008_partial_14_0158,
  ep_Q2_008_partial_14_0159,
  ep_Q2_008_partial_14_0160,
  ep_Q2_008_partial_14_0161,
  ep_Q2_008_partial_14_0162,
  ep_Q2_008_partial_14_0163,
  ep_Q2_008_partial_14_0164,
  ep_Q2_008_partial_14_0165,
  ep_Q2_008_partial_14_0166,
  ep_Q2_008_partial_14_0167,
  ep_Q2_008_partial_14_0168,
  ep_Q2_008_partial_14_0169,
  ep_Q2_008_partial_14_0170,
  ep_Q2_008_partial_14_0171,
  ep_Q2_008_partial_14_0172,
  ep_Q2_008_partial_14_0173,
  ep_Q2_008_partial_14_0174,
  ep_Q2_008_partial_14_0175,
  ep_Q2_008_partial_14_0176,
  ep_Q2_008_partial_14_0177,
  ep_Q2_008_partial_14_0178,
  ep_Q2_008_partial_14_0179,
  ep_Q2_008_partial_14_0180,
  ep_Q2_008_partial_14_0181,
  ep_Q2_008_partial_14_0182,
  ep_Q2_008_partial_14_0183,
  ep_Q2_008_partial_14_0184,
  ep_Q2_008_partial_14_0185,
  ep_Q2_008_partial_14_0186,
  ep_Q2_008_partial_14_0187,
  ep_Q2_008_partial_14_0188,
  ep_Q2_008_partial_14_0189,
  ep_Q2_008_partial_14_0190,
  ep_Q2_008_partial_14_0191,
  ep_Q2_008_partial_14_0192,
  ep_Q2_008_partial_14_0193,
  ep_Q2_008_partial_14_0194,
  ep_Q2_008_partial_14_0195,
  ep_Q2_008_partial_14_0196,
  ep_Q2_008_partial_14_0197,
  ep_Q2_008_partial_14_0198,
  ep_Q2_008_partial_14_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_14_0100_0199 : Poly :=
[
  term ((2326813434013398766894293511759220831371200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-8337968999043642000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-690257192653383487362989827910649561600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((26395544874479014125 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((443839766060421359398517658361442697600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-15566498222321469819 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-15967728181314946226225405468132471980800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13721890041759525469219392208514778304509 : Rat) / 23270014048459243500102183208135593751448) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14387033619570246422503196079893263564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((26395544874479014125 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((2326813434013398766894293511759220831371200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-8337968999043642000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 3), (16, 1)],
  term ((-690257192653383487362989827910649561600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-14387033619570246422503196079893263564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13721890041759525469219392208514778304509 : Rat) / 23270014048459243500102183208135593751448) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((443839766060421359398517658361442697600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-15566498222321469819 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-15967728181314946226225405468132471980800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1163406717006699383447146755879610415685600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((4168984499521821000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((345128596326691743681494913955324780800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-26395544874479014125 : Rat) / 11087303257826821744) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-26395544874479014125 : Rat) / 11087303257826821744) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1163406717006699383447146755879610415685600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((4168984499521821000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 4), (16, 1)],
  term ((345128596326691743681494913955324780800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 5), (15, 1), (16, 1)],
  term ((7193516809785123211251598039946631782400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-221919883030210679699258829180721348800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((15566498222321469819 : Rat) / 22174606515653643488) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term ((7983864090657473113112702734066235990400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((13721890041759525469219392208514778304509 : Rat) / 46540028096918487000204366416271187502896) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((7193516809785123211251598039946631782400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 3), (15, 1), (16, 1)],
  term ((13721890041759525469219392208514778304509 : Rat) / 46540028096918487000204366416271187502896) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-221919883030210679699258829180721348800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (13, 3), (15, 2), (16, 1)],
  term ((15566498222321469819 : Rat) / 22174606515653643488) [(3, 1), (13, 3), (16, 1)],
  term ((7983864090657473113112702734066235990400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 4), (15, 1), (16, 1)],
  term ((863269656038284001922505986804115200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((3608410364367474450 : Rat) / 692956453614176359) [(3, 2), (4, 1), (12, 1), (16, 1)],
  term ((863269656038284001922505986804115200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((3608410364367474450 : Rat) / 692956453614176359) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (12, 2), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (13, 2), (16, 1)],
  term ((-1804205182183737225 : Rat) / 692956453614176359) [(3, 2), (12, 2), (16, 1)],
  term ((-1804205182183737225 : Rat) / 692956453614176359) [(3, 2), (13, 2), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(4, 1), (5, 1), (7, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1071569187608153103042947638108617600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-5195544493327750297659074730740985600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((50303956548478400762866452453283200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2904341642232903893101346122774464000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-77828762961796770991604700022060800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 2), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2882672536161715073547 : Rat) / 11087303257826821744) [(4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-866499766809614501907 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((242189375816351879415 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 3), (16, 1)],
  term ((17912901500807099039872241275243417596477279 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((172223556136072447584 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((484378751632703758830 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-127095637984555912203 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((17984823394286703351 : Rat) / 2771825814456705436) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-180940767031058398568961627451392000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((298845082690749744556113687928507200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1534765434638441773576013804275200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-849785485161880908591650643300033600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1302899797351309598034904678128583680000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-27749316280348855071 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((21558147229296800814651749709232192358400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1123528436283935257980747756394748713368621 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((3830163888954054375 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-24846833819741685755172694631744020516529721 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((23985511571295349047 : Rat) / 2771825814456705436) [(4, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((12537687741124122429604655922450966042059331 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((6491767364065373557 : Rat) / 692956453614176359) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((23985511571295349047 : Rat) / 1385912907228352718) [(4, 1), (6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(4, 1), (7, 1), (10, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (10, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3830163888954054375 : Rat) / 692956453614176359) [(4, 1), (7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1302899797351309598034904678128583680000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((959645157456388149 : Rat) / 23895050124626771) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-21558147229296800814651749709232192358400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1051762241666102759812986055633265271626121 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(4, 1), (7, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-88816559951951751334924798121594589933006 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((108469927998105212979 : Rat) / 11087303257826821744) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((7155708536115337877539054628979219225936183 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((296782203123766745987160892707502128000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-16422254336897173035 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (12, 1), (13, 3), (16, 1)],
  term ((-82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-2472937131491765565807098890099066012684059 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-577568807143019625655293305988830400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((3982558114344151124439935487338001600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2919511882115052984 : Rat) / 692956453614176359) [(4, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2002507330977353752026261238338550510594635 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-165903094913906876638785592196740320000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((-1419094681875520848490788163574792405915877 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((288879204506617231197432598291536000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((180940767031058398568961627451392000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(4, 1), (7, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (10, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-17984823394286703351 : Rat) / 5543651628913410872) [(4, 1), (12, 2), (16, 1)],
  term ((-17984823394286703351 : Rat) / 5543651628913410872) [(4, 1), (13, 2), (16, 1)],
  term ((7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((17984823394286703351 : Rat) / 2771825814456705436) [(4, 2), (12, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-224600804790115123759374020146694400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 3), (16, 1)],
  term ((44628070862672887622756337402167347200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1534765434638441773576013804275200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-849785485161880908591650643300033600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((298845082690749744556113687928507200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(5, 1), (6, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1123528436283935257980747756394748713368621 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1302899797351309598034904678128583680000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-137539422766350757941 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((21558147229296800814651749709232192358400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 4), (16, 1)],
  term ((3830163888954054375 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 2), (13, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 2), (13, 3), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (11, 2), (13, 4), (15, 1), (16, 1)],
  term ((-3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((23985511571295349047 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((12537687741124122429604655922450966042059331 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((6491767364065373557 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-24846833819741685755172694631744020516529721 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((23985511571295349047 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (13, 3), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3830163888954054375 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((1051762241666102759812986055633265271626121 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1302899797351309598034904678128583680000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((137860995909896362941 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((-21558147229296800814651749709232192358400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 4), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 2), (13, 2), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1419093801081715622302940843950870205032677 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((288879204506617231197432598291536000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((4021472495825049509935737837349032000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2919511882115052984 : Rat) / 692956453614176359) [(5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2002537277966731442413070105551905340623435 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-167355265735023328585336265258127552000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((535784593804076551521473819054308800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((2597772246663875148829537365370492800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-726085410558225973275336530693616000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-25151978274239200381433226226641600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 3), (13, 2), (15, 2), (16, 1)],
  term ((38914381480898385495802350011030400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 3), (15, 2), (16, 1)],
  term ((-2472937131491765565807098890099066012684059 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-577568807143019625655293305988830400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-88817289359321704271735859685155162539406 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((108469927998105212979 : Rat) / 11087303257826821744) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((7155770687128219150419031119942229525756983 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-14876023620890962540918779134055782400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((299379975370430621135990430072872620800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((-16422254336897173035 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (13, 4), (16, 1)],
  term ((-83677632867511664292668132629063776000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 5), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((224600804790115123759374020146694400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(5, 1), (7, 2), (10, 1), (13, 3), (16, 1)],
  term ((-44628070862672887622756337402167347200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((127095637984555912203 : Rat) / 11087303257826821744) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 3), (16, 1)],
  term ((-242189375816351879415 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((2882672536161715073547 : Rat) / 22174606515653643488) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((866499766809614501907 : Rat) / 1385912907228352718) [(5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-242189375816351879415 : Rat) / 1385912907228352718) [(5, 1), (12, 2), (13, 3), (16, 1)],
  term ((-17912901500807099039872241275243417596477279 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (12, 3), (13, 1), (16, 1)],
  term ((-242189375816351879415 : Rat) / 692956453614176359) [(5, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((127095637984555912203 : Rat) / 11087303257826821744) [(5, 1), (12, 3), (15, 1), (16, 1)],
  term ((-17912901500807099039872241275243417596477279 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (13, 3), (15, 2), (16, 1)],
  term ((2882672536161715073547 : Rat) / 22174606515653643488) [(5, 1), (13, 3), (16, 1)],
  term ((866499766809614501907 : Rat) / 1385912907228352718) [(5, 1), (13, 4), (15, 1), (16, 1)],
  term ((-242189375816351879415 : Rat) / 1385912907228352718) [(5, 1), (13, 5), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(5, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(5, 2), (6, 1), (11, 1), (13, 3), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(5, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(5, 2), (7, 1), (10, 1), (13, 3), (16, 1)],
  term ((-77828762961796770991604700022060800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((2904341642232903893101346122774464000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((50303956548478400762866452453283200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1071569187608153103042947638108617600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-5195544493327750297659074730740985600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-127095637984555912203 : Rat) / 5543651628913410872) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((172223556136072447584 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 2), (16, 1)],
  term ((484378751632703758830 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((17912901500807099039872241275243417596477279 : Rat) / 1349660814810636123005926626071864437583984) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2882672536161715073547 : Rat) / 11087303257826821744) [(5, 2), (13, 2), (16, 1)],
  term ((-866499766809614501907 : Rat) / 692956453614176359) [(5, 2), (13, 3), (15, 1), (16, 1)],
  term ((242189375816351879415 : Rat) / 692956453614176359) [(5, 2), (13, 4), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((90470383515529199284480813725696000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((90470383515529199284480813725696000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 4), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 5), (15, 1), (16, 1)],
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-149422541345374872278056843964253600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((9148009761726501624078082280745600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((767382717319220886788006902137600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((424892742580940454295825321650016800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 3), (15, 3), (16, 1)],
  term ((767382717319220886788006902137600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((424892742580940454295825321650016800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-149422541345374872278056843964253600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((9148009761726501624078082280745600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-80393285886401250 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-651449898675654799017452339064291840000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((27749316280348855071 : Rat) / 1385912907228352718) [(6, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((1123528436283935257980747756394748713368621 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-80393285886401250 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((1123528436283935257980747756394748713368621 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-651449898675654799017452339064291840000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((27749316280348855071 : Rat) / 1385912907228352718) [(6, 1), (11, 1), (13, 3), (16, 1)],
  term ((-10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (12, 2), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-3830163888954054375 : Rat) / 1385912907228352718) [(6, 1), (11, 2), (12, 2), (16, 1)],
  term ((-3830163888954054375 : Rat) / 1385912907228352718) [(6, 1), (11, 2), (13, 2), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 4), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (13, 5), (15, 1), (16, 1)],
  term ((3435233678578325465784110552734491249023163 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-23985511571295349047 : Rat) / 2771825814456705436) [(6, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((24846833819741685755172694631744020516529721 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23985511571295349047 : Rat) / 5543651628913410872) [(6, 1), (12, 2), (13, 2), (16, 1)],
  term ((-12537687741124122429604655922450966042059331 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-6491767364065373557 : Rat) / 1385912907228352718) [(6, 1), (12, 2), (16, 1)],
  term ((-23985511571295349047 : Rat) / 2771825814456705436) [(6, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((3435233678578325465784110552734491249023163 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 3), (15, 2), (16, 1)],
  term ((-12537687741124122429604655922450966042059331 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-6491767364065373557 : Rat) / 1385912907228352718) [(6, 1), (13, 2), (16, 1)],
  term ((24846833819741685755172694631744020516529721 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-23985511571295349047 : Rat) / 5543651628913410872) [(6, 1), (13, 4), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((3830163888954054375 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((3830163888954054375 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 4), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (13, 5), (15, 1), (16, 1)],
  term ((651449898675654799017452339064291840000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-959645157456388149 : Rat) / 47790100249253542) [(7, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1051762241666102759812986055633265271626121 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1051762241666102759812986055633265271626121 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((651449898675654799017452339064291840000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-959645157456388149 : Rat) / 47790100249253542) [(7, 1), (10, 1), (13, 3), (16, 1)],
  term ((10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (12, 2), (13, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (13, 3), (16, 1)],
  term ((-26797761962133750 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-26797761962133750 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((1419093801081715622302940843950870205032677 : Rat) / 1349660814810636123005926626071864437583984) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-144439602253308615598716299145768000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1991279057172075562219967743669000800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (12, 1), (13, 3), (16, 1)],
  term ((2002507330977353752026261238338550510594635 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 5), (15, 2), (16, 1)],
  term ((44408279975975875667462399060797294966503 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-108469927998105212979 : Rat) / 22174606515653643488) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-7155708536115337877539054628979219225936183 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 2), (15, 3), (16, 1)],
  term ((-148391101561883372993580446353751064000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((16422254336897173035 : Rat) / 5543651628913410872) [(7, 1), (12, 2), (13, 3), (16, 1)],
  term ((41475773728476719159696398049185080000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((2472937131491765565807098890099066012684059 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((288784403571509812827646652994415200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (15, 3), (16, 1)],
  term ((-1991279057172075562219967743669000800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (12, 3), (13, 1), (16, 1)],
  term ((2002507330977353752026261238338550510594635 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 3), (13, 3), (15, 2), (16, 1)],
  term ((1419093801081715622302940843950870205032677 : Rat) / 1349660814810636123005926626071864437583984) [(7, 1), (12, 3), (15, 1), (16, 1)],
  term ((-144439602253308615598716299145768000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 3), (15, 3), (16, 1)],
  term ((2472937131491765565807098890099066012684059 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((288784403571509812827646652994415200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((44408279975975875667462399060797294966503 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-108469927998105212979 : Rat) / 22174606515653643488) [(7, 1), (13, 3), (16, 1)],
  term ((-7155708536115337877539054628979219225936183 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (13, 4), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (15, 3), (16, 1)],
  term ((-148391101561883372993580446353751064000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 5), (15, 2), (16, 1)],
  term ((16422254336897173035 : Rat) / 5543651628913410872) [(7, 1), (13, 5), (16, 1)],
  term ((41475773728476719159696398049185080000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 6), (15, 1), (16, 1)],
  term ((-90470383515529199284480813725696000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-90470383515529199284480813725696000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 4), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 100 through 199. -/
theorem ep_Q2_008_block_14_0100_0199_valid :
    checkProductSumEq ep_Q2_008_partials_14_0100_0199
      ep_Q2_008_block_14_0100_0199 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
