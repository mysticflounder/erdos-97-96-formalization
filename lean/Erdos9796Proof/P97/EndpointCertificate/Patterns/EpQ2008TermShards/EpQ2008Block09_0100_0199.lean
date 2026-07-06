/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 9:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_09_0100_0199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0100 : Poly :=
[
  term ((-8131564232645779221402739805107200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 9. -/
def ep_Q2_008_partial_09_0100 : Poly :=
[
  term ((8131564232645779221402739805107200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16263128465291558442805479610214400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 9. -/
theorem ep_Q2_008_partial_09_0100_valid :
    mulPoly ep_Q2_008_coefficient_09_0100
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0101 : Poly :=
[
  term ((2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 101 for generator 9. -/
def ep_Q2_008_partial_09_0101 : Poly :=
[
  term ((-2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((4569158253174918890648801096780352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 9. -/
theorem ep_Q2_008_partial_09_0101_valid :
    mulPoly ep_Q2_008_coefficient_09_0101
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0102 : Poly :=
[
  term ((71346398428652826132158641717161600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 102 for generator 9. -/
def ep_Q2_008_partial_09_0102 : Poly :=
[
  term ((-71346398428652826132158641717161600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((142692796857305652264317283434323200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 9. -/
theorem ep_Q2_008_partial_09_0102_valid :
    mulPoly ep_Q2_008_coefficient_09_0102
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0103 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 9. -/
def ep_Q2_008_partial_09_0103 : Poly :=
[
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 9. -/
theorem ep_Q2_008_partial_09_0103_valid :
    mulPoly ep_Q2_008_coefficient_09_0103
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0104 : Poly :=
[
  term ((19300686560134180875 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 9. -/
def ep_Q2_008_partial_09_0104 : Poly :=
[
  term ((-19300686560134180875 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((38601373120268361750 : Rat) / 692956453614176359) [(2, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 9. -/
theorem ep_Q2_008_partial_09_0104_valid :
    mulPoly ep_Q2_008_coefficient_09_0104
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0105 : Poly :=
[
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 105 for generator 9. -/
def ep_Q2_008_partial_09_0105 : Poly :=
[
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 9. -/
theorem ep_Q2_008_partial_09_0105_valid :
    mulPoly ep_Q2_008_coefficient_09_0105
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0106 : Poly :=
[
  term ((-29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 106 for generator 9. -/
def ep_Q2_008_partial_09_0106 : Poly :=
[
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 9. -/
theorem ep_Q2_008_partial_09_0106_valid :
    mulPoly ep_Q2_008_coefficient_09_0106
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0107 : Poly :=
[
  term ((578831658382089000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (16, 1)]
]

/-- Partial product 107 for generator 9. -/
def ep_Q2_008_partial_09_0107 : Poly :=
[
  term ((-578831658382089000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((1157663316764178000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 9. -/
theorem ep_Q2_008_partial_09_0107_valid :
    mulPoly ep_Q2_008_coefficient_09_0107
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0108 : Poly :=
[
  term ((6360365645918091527675642643791575857600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 108 for generator 9. -/
def ep_Q2_008_partial_09_0108 : Poly :=
[
  term ((-6360365645918091527675642643791575857600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((12720731291836183055351285287583151715200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 9. -/
theorem ep_Q2_008_partial_09_0108_valid :
    mulPoly ep_Q2_008_coefficient_09_0108
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0109 : Poly :=
[
  term ((53601229279566270000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 9. -/
def ep_Q2_008_partial_09_0109 : Poly :=
[
  term ((-53601229279566270000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((107202458559132540000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 9. -/
theorem ep_Q2_008_partial_09_0109_valid :
    mulPoly ep_Q2_008_coefficient_09_0109
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0110 : Poly :=
[
  term ((4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 110 for generator 9. -/
def ep_Q2_008_partial_09_0110 : Poly :=
[
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 9. -/
theorem ep_Q2_008_partial_09_0110_valid :
    mulPoly ep_Q2_008_coefficient_09_0110
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0111 : Poly :=
[
  term ((-587490295841031375 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 9. -/
def ep_Q2_008_partial_09_0111 : Poly :=
[
  term ((587490295841031375 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-587490295841031375 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 9. -/
theorem ep_Q2_008_partial_09_0111_valid :
    mulPoly ep_Q2_008_coefficient_09_0111
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0112 : Poly :=
[
  term ((-255899923086091082367 : Rat) / 11087303257826821744) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 9. -/
def ep_Q2_008_partial_09_0112 : Poly :=
[
  term ((255899923086091082367 : Rat) / 11087303257826821744) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-255899923086091082367 : Rat) / 5543651628913410872) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 9. -/
theorem ep_Q2_008_partial_09_0112_valid :
    mulPoly ep_Q2_008_coefficient_09_0112
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0113 : Poly :=
[
  term ((-2723816650104925212153710468043271209600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 113 for generator 9. -/
def ep_Q2_008_partial_09_0113 : Poly :=
[
  term ((2723816650104925212153710468043271209600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 9. -/
theorem ep_Q2_008_partial_09_0113_valid :
    mulPoly ep_Q2_008_coefficient_09_0113
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0114 : Poly :=
[
  term ((78283337177484022003889761992886409030400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 114 for generator 9. -/
def ep_Q2_008_partial_09_0114 : Poly :=
[
  term ((-78283337177484022003889761992886409030400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((156566674354968044007779523985772818060800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 9. -/
theorem ep_Q2_008_partial_09_0114_valid :
    mulPoly ep_Q2_008_coefficient_09_0114
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0115 : Poly :=
[
  term ((-4575683185875846999318579672081767816453869 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (15, 2), (16, 1)]
]

/-- Partial product 115 for generator 9. -/
def ep_Q2_008_partial_09_0115 : Poly :=
[
  term ((4575683185875846999318579672081767816453869 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-4575683185875846999318579672081767816453869 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 9. -/
theorem ep_Q2_008_partial_09_0115_valid :
    mulPoly ep_Q2_008_coefficient_09_0115
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0116 : Poly :=
[
  term ((5412615546551211675 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (16, 1)]
]

/-- Partial product 116 for generator 9. -/
def ep_Q2_008_partial_09_0116 : Poly :=
[
  term ((-5412615546551211675 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (16, 1)],
  term ((5412615546551211675 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 9. -/
theorem ep_Q2_008_partial_09_0116_valid :
    mulPoly ep_Q2_008_coefficient_09_0116
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0117 : Poly :=
[
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 9. -/
def ep_Q2_008_partial_09_0117 : Poly :=
[
  term ((-12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 9. -/
theorem ep_Q2_008_partial_09_0117_valid :
    mulPoly ep_Q2_008_coefficient_09_0117
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0118 : Poly :=
[
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 118 for generator 9. -/
def ep_Q2_008_partial_09_0118 : Poly :=
[
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 9. -/
theorem ep_Q2_008_partial_09_0118_valid :
    mulPoly ep_Q2_008_coefficient_09_0118
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0119 : Poly :=
[
  term ((-9148009761726501624078082280745600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 9. -/
def ep_Q2_008_partial_09_0119 : Poly :=
[
  term ((9148009761726501624078082280745600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 9. -/
theorem ep_Q2_008_partial_09_0119_valid :
    mulPoly ep_Q2_008_coefficient_09_0119
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0120 : Poly :=
[
  term ((-193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 120 for generator 9. -/
def ep_Q2_008_partial_09_0120 : Poly :=
[
  term ((193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 9. -/
theorem ep_Q2_008_partial_09_0120_valid :
    mulPoly ep_Q2_008_coefficient_09_0120
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0121 : Poly :=
[
  term ((53819861292522639870 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 121 for generator 9. -/
def ep_Q2_008_partial_09_0121 : Poly :=
[
  term ((-53819861292522639870 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((107639722585045279740 : Rat) / 692956453614176359) [(2, 2), (5, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 9. -/
theorem ep_Q2_008_partial_09_0121_valid :
    mulPoly ep_Q2_008_coefficient_09_0121
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0122 : Poly :=
[
  term ((95631705432235450292767693481959200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 122 for generator 9. -/
def ep_Q2_008_partial_09_0122 : Poly :=
[
  term ((-95631705432235450292767693481959200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((191263410864470900585535386963918400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 9. -/
theorem ep_Q2_008_partial_09_0122_valid :
    mulPoly ep_Q2_008_coefficient_09_0122
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0123 : Poly :=
[
  term ((5014213127946281709 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 123 for generator 9. -/
def ep_Q2_008_partial_09_0123 : Poly :=
[
  term ((-5014213127946281709 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((5014213127946281709 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (6, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 9. -/
theorem ep_Q2_008_partial_09_0123_valid :
    mulPoly ep_Q2_008_coefficient_09_0123
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0124 : Poly :=
[
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 9. -/
def ep_Q2_008_partial_09_0124 : Poly :=
[
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 9. -/
theorem ep_Q2_008_partial_09_0124_valid :
    mulPoly ep_Q2_008_coefficient_09_0124
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0125 : Poly :=
[
  term ((5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 9. -/
def ep_Q2_008_partial_09_0125 : Poly :=
[
  term ((-5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 9. -/
theorem ep_Q2_008_partial_09_0125_valid :
    mulPoly ep_Q2_008_coefficient_09_0125
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0126 : Poly :=
[
  term ((-53595523924267500 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 126 for generator 9. -/
def ep_Q2_008_partial_09_0126 : Poly :=
[
  term ((53595523924267500 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 9. -/
theorem ep_Q2_008_partial_09_0126_valid :
    mulPoly ep_Q2_008_coefficient_09_0126
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0127 : Poly :=
[
  term ((40196642943200625 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 127 for generator 9. -/
def ep_Q2_008_partial_09_0127 : Poly :=
[
  term ((-40196642943200625 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((80393285886401250 : Rat) / 692956453614176359) [(2, 2), (5, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 9. -/
theorem ep_Q2_008_partial_09_0127_valid :
    mulPoly ep_Q2_008_coefficient_09_0127
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0128 : Poly :=
[
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 128 for generator 9. -/
def ep_Q2_008_partial_09_0128 : Poly :=
[
  term ((7995170523765116349 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7995170523765116349 : Rat) / 692956453614176359) [(2, 2), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 9. -/
theorem ep_Q2_008_partial_09_0128_valid :
    mulPoly ep_Q2_008_coefficient_09_0128
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0129 : Poly :=
[
  term ((1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 9. -/
def ep_Q2_008_partial_09_0129 : Poly :=
[
  term ((-1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((1145077892859441821928036850911497083007721 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 9. -/
theorem ep_Q2_008_partial_09_0129_valid :
    mulPoly ep_Q2_008_coefficient_09_0129
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0130 : Poly :=
[
  term ((23985511571295349047 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 130 for generator 9. -/
def ep_Q2_008_partial_09_0130 : Poly :=
[
  term ((-23985511571295349047 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((23985511571295349047 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 9. -/
theorem ep_Q2_008_partial_09_0130_valid :
    mulPoly ep_Q2_008_coefficient_09_0130
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0131 : Poly :=
[
  term ((-32291916775513583922 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 9. -/
def ep_Q2_008_partial_09_0131 : Poly :=
[
  term ((32291916775513583922 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(2, 2), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 9. -/
theorem ep_Q2_008_partial_09_0131_valid :
    mulPoly ep_Q2_008_coefficient_09_0131
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0132 : Poly :=
[
  term ((-8963977023847688398368832575587980488273697 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 9. -/
def ep_Q2_008_partial_09_0132 : Poly :=
[
  term ((8963977023847688398368832575587980488273697 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-8963977023847688398368832575587980488273697 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 9. -/
theorem ep_Q2_008_partial_09_0132_valid :
    mulPoly ep_Q2_008_coefficient_09_0132
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0133 : Poly :=
[
  term ((-92050785676708875 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 133 for generator 9. -/
def ep_Q2_008_partial_09_0133 : Poly :=
[
  term ((92050785676708875 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-184101571353417750 : Rat) / 692956453614176359) [(2, 2), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 9. -/
theorem ep_Q2_008_partial_09_0133_valid :
    mulPoly ep_Q2_008_coefficient_09_0133
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0134 : Poly :=
[
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 9. -/
def ep_Q2_008_partial_09_0134 : Poly :=
[
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 9. -/
theorem ep_Q2_008_partial_09_0134_valid :
    mulPoly ep_Q2_008_coefficient_09_0134
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0135 : Poly :=
[
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 9. -/
def ep_Q2_008_partial_09_0135 : Poly :=
[
  term ((-29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 9. -/
theorem ep_Q2_008_partial_09_0135_valid :
    mulPoly ep_Q2_008_coefficient_09_0135
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0136 : Poly :=
[
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (11, 2), (16, 1)]
]

/-- Partial product 136 for generator 9. -/
def ep_Q2_008_partial_09_0136 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-166741629986610000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 9. -/
theorem ep_Q2_008_partial_09_0136_valid :
    mulPoly ep_Q2_008_coefficient_09_0136
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0137 : Poly :=
[
  term ((1251254543439386635862909587601688000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 9. -/
def ep_Q2_008_partial_09_0137 : Poly :=
[
  term ((-1251254543439386635862909587601688000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2502509086878773271725819175203376000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 9. -/
theorem ep_Q2_008_partial_09_0137_valid :
    mulPoly ep_Q2_008_coefficient_09_0137
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0138 : Poly :=
[
  term ((839032029978394458007055546579289600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 138 for generator 9. -/
def ep_Q2_008_partial_09_0138 : Poly :=
[
  term ((-839032029978394458007055546579289600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((1678064059956788916014111093158579200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 9. -/
theorem ep_Q2_008_partial_09_0138_valid :
    mulPoly ep_Q2_008_coefficient_09_0138
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0139 : Poly :=
[
  term ((-37581804255052387551 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 139 for generator 9. -/
def ep_Q2_008_partial_09_0139 : Poly :=
[
  term ((37581804255052387551 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-37581804255052387551 : Rat) / 692956453614176359) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 9. -/
theorem ep_Q2_008_partial_09_0139_valid :
    mulPoly ep_Q2_008_coefficient_09_0139
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0140 : Poly :=
[
  term ((55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 9. -/
def ep_Q2_008_partial_09_0140 : Poly :=
[
  term ((-55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 9. -/
theorem ep_Q2_008_partial_09_0140_valid :
    mulPoly ep_Q2_008_coefficient_09_0140
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0141 : Poly :=
[
  term ((38348941583926328000274344925244800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 141 for generator 9. -/
def ep_Q2_008_partial_09_0141 : Poly :=
[
  term ((-38348941583926328000274344925244800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((76697883167852656000548689850489600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 9. -/
theorem ep_Q2_008_partial_09_0141_valid :
    mulPoly ep_Q2_008_coefficient_09_0141
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0142 : Poly :=
[
  term ((-34854140819368365243 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 142 for generator 9. -/
def ep_Q2_008_partial_09_0142 : Poly :=
[
  term ((34854140819368365243 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-34854140819368365243 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 9. -/
theorem ep_Q2_008_partial_09_0142_valid :
    mulPoly ep_Q2_008_coefficient_09_0142
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0143 : Poly :=
[
  term ((-4209402769886052260210451515381611593782525 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 9. -/
def ep_Q2_008_partial_09_0143 : Poly :=
[
  term ((4209402769886052260210451515381611593782525 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4209402769886052260210451515381611593782525 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 9. -/
theorem ep_Q2_008_partial_09_0143_valid :
    mulPoly ep_Q2_008_coefficient_09_0143
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0144 : Poly :=
[
  term ((-153166897805978526824336044309113600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 144 for generator 9. -/
def ep_Q2_008_partial_09_0144 : Poly :=
[
  term ((153166897805978526824336044309113600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-306333795611957053648672088618227200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 9. -/
theorem ep_Q2_008_partial_09_0144_valid :
    mulPoly ep_Q2_008_coefficient_09_0144
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0145 : Poly :=
[
  term ((26206034311795812499000427336195541207385080 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 145 for generator 9. -/
def ep_Q2_008_partial_09_0145 : Poly :=
[
  term ((-26206034311795812499000427336195541207385080 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((52412068623591624998000854672391082414770160 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 9. -/
theorem ep_Q2_008_partial_09_0145_valid :
    mulPoly ep_Q2_008_coefficient_09_0145
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0146 : Poly :=
[
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 2), (15, 4), (16, 1)]
]

/-- Partial product 146 for generator 9. -/
def ep_Q2_008_partial_09_0146 : Poly :=
[
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 9. -/
theorem ep_Q2_008_partial_09_0146_valid :
    mulPoly ep_Q2_008_coefficient_09_0146
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0147 : Poly :=
[
  term ((258439287200141737761 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 147 for generator 9. -/
def ep_Q2_008_partial_09_0147 : Poly :=
[
  term ((-258439287200141737761 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((258439287200141737761 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 9. -/
theorem ep_Q2_008_partial_09_0147_valid :
    mulPoly ep_Q2_008_coefficient_09_0147
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0148 : Poly :=
[
  term ((-52535980056070510935615437528967768000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 9. -/
def ep_Q2_008_partial_09_0148 : Poly :=
[
  term ((52535980056070510935615437528967768000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-105071960112141021871230875057935536000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 9. -/
theorem ep_Q2_008_partial_09_0148_valid :
    mulPoly ep_Q2_008_coefficient_09_0148
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0149 : Poly :=
[
  term ((1357505594412951295407473941904559327374563 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 149 for generator 9. -/
def ep_Q2_008_partial_09_0149 : Poly :=
[
  term ((-1357505594412951295407473941904559327374563 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((1357505594412951295407473941904559327374563 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 9. -/
theorem ep_Q2_008_partial_09_0149_valid :
    mulPoly ep_Q2_008_coefficient_09_0149
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0150 : Poly :=
[
  term ((194619027395906265603639083812300800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (15, 4), (16, 1)]
]

/-- Partial product 150 for generator 9. -/
def ep_Q2_008_partial_09_0150 : Poly :=
[
  term ((-194619027395906265603639083812300800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (15, 4), (16, 1)],
  term ((389238054791812531207278167624601600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 9. -/
theorem ep_Q2_008_partial_09_0150_valid :
    mulPoly ep_Q2_008_coefficient_09_0150
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0151 : Poly :=
[
  term ((-201004355692739825111 : Rat) / 22174606515653643488) [(2, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 151 for generator 9. -/
def ep_Q2_008_partial_09_0151 : Poly :=
[
  term ((201004355692739825111 : Rat) / 22174606515653643488) [(2, 1), (5, 1), (7, 1), (16, 1)],
  term ((-201004355692739825111 : Rat) / 11087303257826821744) [(2, 2), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 9. -/
theorem ep_Q2_008_partial_09_0151_valid :
    mulPoly ep_Q2_008_coefficient_09_0151
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0152 : Poly :=
[
  term ((1393970900292399457189540537914585600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 9. -/
def ep_Q2_008_partial_09_0152 : Poly :=
[
  term ((-1393970900292399457189540537914585600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((2787941800584798914379081075829171200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 9. -/
theorem ep_Q2_008_partial_09_0152_valid :
    mulPoly ep_Q2_008_coefficient_09_0152
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0153 : Poly :=
[
  term ((-14378328808718033457712129324262400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 153 for generator 9. -/
def ep_Q2_008_partial_09_0153 : Poly :=
[
  term ((14378328808718033457712129324262400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-28756657617436066915424258648524800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 9. -/
theorem ep_Q2_008_partial_09_0153_valid :
    mulPoly ep_Q2_008_coefficient_09_0153
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0154 : Poly :=
[
  term ((282248748571885366517729205321312000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 154 for generator 9. -/
def ep_Q2_008_partial_09_0154 : Poly :=
[
  term ((-282248748571885366517729205321312000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((564497497143770733035458410642624000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 9. -/
theorem ep_Q2_008_partial_09_0154_valid :
    mulPoly ep_Q2_008_coefficient_09_0154
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0155 : Poly :=
[
  term ((-13103054322585442735394856149888062197343740 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 155 for generator 9. -/
def ep_Q2_008_partial_09_0155 : Poly :=
[
  term ((13103054322585442735394856149888062197343740 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-26206108645170885470789712299776124394687480 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 9. -/
theorem ep_Q2_008_partial_09_0155_valid :
    mulPoly ep_Q2_008_coefficient_09_0155
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0156 : Poly :=
[
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 156 for generator 9. -/
def ep_Q2_008_partial_09_0156 : Poly :=
[
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((2581637015318136793867863220243968000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 9. -/
theorem ep_Q2_008_partial_09_0156_valid :
    mulPoly ep_Q2_008_coefficient_09_0156
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0157 : Poly :=
[
  term ((-610381754232706174199530511066292546028749 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 157 for generator 9. -/
def ep_Q2_008_partial_09_0157 : Poly :=
[
  term ((610381754232706174199530511066292546028749 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-610381754232706174199530511066292546028749 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 9. -/
theorem ep_Q2_008_partial_09_0157_valid :
    mulPoly ep_Q2_008_coefficient_09_0157
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0158 : Poly :=
[
  term ((-183229452328326250336574981370048000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (15, 3), (16, 1)]
]

/-- Partial product 158 for generator 9. -/
def ep_Q2_008_partial_09_0158 : Poly :=
[
  term ((183229452328326250336574981370048000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (15, 3), (16, 1)],
  term ((-366458904656652500673149962740096000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 9. -/
theorem ep_Q2_008_partial_09_0158_valid :
    mulPoly ep_Q2_008_coefficient_09_0158
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0159 : Poly :=
[
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 3), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 159 for generator 9. -/
def ep_Q2_008_partial_09_0159 : Poly :=
[
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 9. -/
theorem ep_Q2_008_partial_09_0159_valid :
    mulPoly ep_Q2_008_coefficient_09_0159
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0160 : Poly :=
[
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 3), (15, 2), (16, 1)]
]

/-- Partial product 160 for generator 9. -/
def ep_Q2_008_partial_09_0160 : Poly :=
[
  term ((11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 3), (15, 2), (16, 1)],
  term ((-22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 9. -/
theorem ep_Q2_008_partial_09_0160_valid :
    mulPoly ep_Q2_008_coefficient_09_0160
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0161 : Poly :=
[
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 161 for generator 9. -/
def ep_Q2_008_partial_09_0161 : Poly :=
[
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 9. -/
theorem ep_Q2_008_partial_09_0161_valid :
    mulPoly ep_Q2_008_coefficient_09_0161
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0162 : Poly :=
[
  term ((70324786932212700 : Rat) / 692956453614176359) [(2, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 162 for generator 9. -/
def ep_Q2_008_partial_09_0162 : Poly :=
[
  term ((-70324786932212700 : Rat) / 692956453614176359) [(2, 1), (5, 1), (9, 1), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(2, 2), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 9. -/
theorem ep_Q2_008_partial_09_0162_valid :
    mulPoly ep_Q2_008_coefficient_09_0162
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0163 : Poly :=
[
  term ((59550582138075000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 163 for generator 9. -/
def ep_Q2_008_partial_09_0163 : Poly :=
[
  term ((-59550582138075000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((119101164276150000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 9. -/
theorem ep_Q2_008_partial_09_0163_valid :
    mulPoly ep_Q2_008_coefficient_09_0163
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0164 : Poly :=
[
  term ((12734296484405958000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 164 for generator 9. -/
def ep_Q2_008_partial_09_0164 : Poly :=
[
  term ((-12734296484405958000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((25468592968811916000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 9. -/
theorem ep_Q2_008_partial_09_0164_valid :
    mulPoly ep_Q2_008_coefficient_09_0164
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0165 : Poly :=
[
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 165 for generator 9. -/
def ep_Q2_008_partial_09_0165 : Poly :=
[
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 9. -/
theorem ep_Q2_008_partial_09_0165_valid :
    mulPoly ep_Q2_008_coefficient_09_0165
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0166 : Poly :=
[
  term ((-25463440102759104375 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 166 for generator 9. -/
def ep_Q2_008_partial_09_0166 : Poly :=
[
  term ((25463440102759104375 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-25463440102759104375 : Rat) / 692956453614176359) [(2, 2), (5, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 9. -/
theorem ep_Q2_008_partial_09_0166_valid :
    mulPoly ep_Q2_008_coefficient_09_0166
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0167 : Poly :=
[
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 167 for generator 9. -/
def ep_Q2_008_partial_09_0167 : Poly :=
[
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 9. -/
theorem ep_Q2_008_partial_09_0167_valid :
    mulPoly ep_Q2_008_coefficient_09_0167
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0168 : Poly :=
[
  term ((-94803927494946305917646790538616889000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 168 for generator 9. -/
def ep_Q2_008_partial_09_0168 : Poly :=
[
  term ((94803927494946305917646790538616889000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-189607854989892611835293581077233778000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 9. -/
theorem ep_Q2_008_partial_09_0168_valid :
    mulPoly ep_Q2_008_coefficient_09_0168
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0169 : Poly :=
[
  term ((6146668391273786840691067001519035075200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 169 for generator 9. -/
def ep_Q2_008_partial_09_0169 : Poly :=
[
  term ((-6146668391273786840691067001519035075200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((12293336782547573681382134003038070150400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 9. -/
theorem ep_Q2_008_partial_09_0169_valid :
    mulPoly ep_Q2_008_coefficient_09_0169
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0170 : Poly :=
[
  term ((35734152853044180000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 170 for generator 9. -/
def ep_Q2_008_partial_09_0170 : Poly :=
[
  term ((-35734152853044180000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((71468305706088360000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 9. -/
theorem ep_Q2_008_partial_09_0170_valid :
    mulPoly ep_Q2_008_coefficient_09_0170
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0171 : Poly :=
[
  term ((2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 9. -/
def ep_Q2_008_partial_09_0171 : Poly :=
[
  term ((-2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 9. -/
theorem ep_Q2_008_partial_09_0171_valid :
    mulPoly ep_Q2_008_coefficient_09_0171
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0172 : Poly :=
[
  term ((1401694617601348875 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 172 for generator 9. -/
def ep_Q2_008_partial_09_0172 : Poly :=
[
  term ((-1401694617601348875 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((1401694617601348875 : Rat) / 1385912907228352718) [(2, 2), (5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 9. -/
theorem ep_Q2_008_partial_09_0172_valid :
    mulPoly ep_Q2_008_coefficient_09_0172
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0173 : Poly :=
[
  term ((6301125276424931977002244890890659420875 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 173 for generator 9. -/
def ep_Q2_008_partial_09_0173 : Poly :=
[
  term ((-6301125276424931977002244890890659420875 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((12602250552849863954004489781781318841750 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 9. -/
theorem ep_Q2_008_partial_09_0173_valid :
    mulPoly ep_Q2_008_coefficient_09_0173
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0174 : Poly :=
[
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 174 for generator 9. -/
def ep_Q2_008_partial_09_0174 : Poly :=
[
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 9. -/
theorem ep_Q2_008_partial_09_0174_valid :
    mulPoly ep_Q2_008_coefficient_09_0174
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0175 : Poly :=
[
  term ((-33947445210391971000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 175 for generator 9. -/
def ep_Q2_008_partial_09_0175 : Poly :=
[
  term ((33947445210391971000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-67894890420783942000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 9. -/
theorem ep_Q2_008_partial_09_0175_valid :
    mulPoly ep_Q2_008_coefficient_09_0175
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0176 : Poly :=
[
  term ((-2810332855803061341406458585064787500800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 176 for generator 9. -/
def ep_Q2_008_partial_09_0176 : Poly :=
[
  term ((2810332855803061341406458585064787500800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-5620665711606122682812917170129575001600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 9. -/
theorem ep_Q2_008_partial_09_0176_valid :
    mulPoly ep_Q2_008_coefficient_09_0176
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0177 : Poly :=
[
  term ((-29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 177 for generator 9. -/
def ep_Q2_008_partial_09_0177 : Poly :=
[
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 9. -/
theorem ep_Q2_008_partial_09_0177_valid :
    mulPoly ep_Q2_008_coefficient_09_0177
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0178 : Poly :=
[
  term ((-1719403304289616125 : Rat) / 11087303257826821744) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 178 for generator 9. -/
def ep_Q2_008_partial_09_0178 : Poly :=
[
  term ((1719403304289616125 : Rat) / 11087303257826821744) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term ((-1719403304289616125 : Rat) / 5543651628913410872) [(2, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 9. -/
theorem ep_Q2_008_partial_09_0178_valid :
    mulPoly ep_Q2_008_coefficient_09_0178
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0179 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 179 for generator 9. -/
def ep_Q2_008_partial_09_0179 : Poly :=
[
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 9. -/
theorem ep_Q2_008_partial_09_0179_valid :
    mulPoly ep_Q2_008_coefficient_09_0179
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0180 : Poly :=
[
  term ((-1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 180 for generator 9. -/
def ep_Q2_008_partial_09_0180 : Poly :=
[
  term ((1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3479750557115580829767541744942693516800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 9. -/
theorem ep_Q2_008_partial_09_0180_valid :
    mulPoly ep_Q2_008_coefficient_09_0180
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0181 : Poly :=
[
  term ((105559530093286220235 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 181 for generator 9. -/
def ep_Q2_008_partial_09_0181 : Poly :=
[
  term ((-105559530093286220235 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((105559530093286220235 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 9. -/
theorem ep_Q2_008_partial_09_0181_valid :
    mulPoly ep_Q2_008_coefficient_09_0181
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0182 : Poly :=
[
  term ((17085342331647223438431898904402898658665582 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 182 for generator 9. -/
def ep_Q2_008_partial_09_0182 : Poly :=
[
  term ((-17085342331647223438431898904402898658665582 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((34170684663294446876863797808805797317331164 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 9. -/
theorem ep_Q2_008_partial_09_0182_valid :
    mulPoly ep_Q2_008_coefficient_09_0182
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0183 : Poly :=
[
  term ((-1043499519869123319617845160831885366490277 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 183 for generator 9. -/
def ep_Q2_008_partial_09_0183 : Poly :=
[
  term ((1043499519869123319617845160831885366490277 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1043499519869123319617845160831885366490277 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 9. -/
theorem ep_Q2_008_partial_09_0183_valid :
    mulPoly ep_Q2_008_coefficient_09_0183
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0184 : Poly :=
[
  term ((9447149221773586859194863807453565160171381 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 184 for generator 9. -/
def ep_Q2_008_partial_09_0184 : Poly :=
[
  term ((-9447149221773586859194863807453565160171381 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((9447149221773586859194863807453565160171381 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 9. -/
theorem ep_Q2_008_partial_09_0184_valid :
    mulPoly ep_Q2_008_coefficient_09_0184
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0185 : Poly :=
[
  term ((-111888112174696860885 : Rat) / 22174606515653643488) [(2, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 185 for generator 9. -/
def ep_Q2_008_partial_09_0185 : Poly :=
[
  term ((111888112174696860885 : Rat) / 22174606515653643488) [(2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-111888112174696860885 : Rat) / 11087303257826821744) [(2, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 9. -/
theorem ep_Q2_008_partial_09_0185_valid :
    mulPoly ep_Q2_008_coefficient_09_0185
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0186 : Poly :=
[
  term ((-364954524554145349619193763568935211905482 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 9. -/
def ep_Q2_008_partial_09_0186 : Poly :=
[
  term ((364954524554145349619193763568935211905482 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-729909049108290699238387527137870423810964 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 9. -/
theorem ep_Q2_008_partial_09_0186_valid :
    mulPoly ep_Q2_008_coefficient_09_0186
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0187 : Poly :=
[
  term ((-107639722585045279740 : Rat) / 692956453614176359) [(2, 1), (5, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 187 for generator 9. -/
def ep_Q2_008_partial_09_0187 : Poly :=
[
  term ((107639722585045279740 : Rat) / 692956453614176359) [(2, 1), (5, 1), (13, 2), (15, 3), (16, 1)],
  term ((-215279445170090559480 : Rat) / 692956453614176359) [(2, 2), (5, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 9. -/
theorem ep_Q2_008_partial_09_0187_valid :
    mulPoly ep_Q2_008_coefficient_09_0187
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0188 : Poly :=
[
  term ((967816845394189629189797033982065649059219 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 188 for generator 9. -/
def ep_Q2_008_partial_09_0188 : Poly :=
[
  term ((-967816845394189629189797033982065649059219 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((967816845394189629189797033982065649059219 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 9. -/
theorem ep_Q2_008_partial_09_0188_valid :
    mulPoly ep_Q2_008_coefficient_09_0188
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0189 : Poly :=
[
  term ((-2104639235181182094975540307520976395808377 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (15, 3), (16, 1)]
]

/-- Partial product 189 for generator 9. -/
def ep_Q2_008_partial_09_0189 : Poly :=
[
  term ((2104639235181182094975540307520976395808377 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((-2104639235181182094975540307520976395808377 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 9. -/
theorem ep_Q2_008_partial_09_0189_valid :
    mulPoly ep_Q2_008_coefficient_09_0189
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0190 : Poly :=
[
  term ((-968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 190 for generator 9. -/
def ep_Q2_008_partial_09_0190 : Poly :=
[
  term ((968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 9. -/
theorem ep_Q2_008_partial_09_0190_valid :
    mulPoly ep_Q2_008_coefficient_09_0190
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0191 : Poly :=
[
  term ((-17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 191 for generator 9. -/
def ep_Q2_008_partial_09_0191 : Poly :=
[
  term ((17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 9. -/
theorem ep_Q2_008_partial_09_0191_valid :
    mulPoly ep_Q2_008_coefficient_09_0191
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0192 : Poly :=
[
  term ((919708186707086232815426272211913600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 192 for generator 9. -/
def ep_Q2_008_partial_09_0192 : Poly :=
[
  term ((-919708186707086232815426272211913600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((1839416373414172465630852544423827200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 9. -/
theorem ep_Q2_008_partial_09_0192_valid :
    mulPoly ep_Q2_008_coefficient_09_0192
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0193 : Poly :=
[
  term ((3321959394710837786227029878990400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 193 for generator 9. -/
def ep_Q2_008_partial_09_0193 : Poly :=
[
  term ((-3321959394710837786227029878990400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((6643918789421675572454059757980800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 9. -/
theorem ep_Q2_008_partial_09_0193_valid :
    mulPoly ep_Q2_008_coefficient_09_0193
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0194 : Poly :=
[
  term ((-161459583877567919610 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 194 for generator 9. -/
def ep_Q2_008_partial_09_0194 : Poly :=
[
  term ((161459583877567919610 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 1), (13, 2), (16, 1)],
  term ((-322919167755135839220 : Rat) / 692956453614176359) [(2, 2), (5, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 9. -/
theorem ep_Q2_008_partial_09_0194_valid :
    mulPoly ep_Q2_008_coefficient_09_0194
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0195 : Poly :=
[
  term ((-15042639383838845127 : Rat) / 5543651628913410872) [(2, 1), (5, 2), (12, 1), (16, 1)]
]

/-- Partial product 195 for generator 9. -/
def ep_Q2_008_partial_09_0195 : Poly :=
[
  term ((15042639383838845127 : Rat) / 5543651628913410872) [(2, 1), (5, 2), (12, 1), (16, 1)],
  term ((-15042639383838845127 : Rat) / 2771825814456705436) [(2, 2), (5, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 9. -/
theorem ep_Q2_008_partial_09_0195_valid :
    mulPoly ep_Q2_008_coefficient_09_0195
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0196 : Poly :=
[
  term ((306773209367379047259 : Rat) / 1385912907228352718) [(2, 1), (5, 2), (13, 2), (16, 1)]
]

/-- Partial product 196 for generator 9. -/
def ep_Q2_008_partial_09_0196 : Poly :=
[
  term ((-306773209367379047259 : Rat) / 1385912907228352718) [(2, 1), (5, 2), (13, 2), (16, 1)],
  term ((306773209367379047259 : Rat) / 692956453614176359) [(2, 2), (5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 9. -/
theorem ep_Q2_008_partial_09_0196_valid :
    mulPoly ep_Q2_008_coefficient_09_0196
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0197 : Poly :=
[
  term ((-222572403645285591399 : Rat) / 22174606515653643488) [(2, 1), (5, 2), (16, 1)]
]

/-- Partial product 197 for generator 9. -/
def ep_Q2_008_partial_09_0197 : Poly :=
[
  term ((222572403645285591399 : Rat) / 22174606515653643488) [(2, 1), (5, 2), (16, 1)],
  term ((-222572403645285591399 : Rat) / 11087303257826821744) [(2, 2), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 9. -/
theorem ep_Q2_008_partial_09_0197_valid :
    mulPoly ep_Q2_008_coefficient_09_0197
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0198 : Poly :=
[
  term ((-4244765494801986000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 198 for generator 9. -/
def ep_Q2_008_partial_09_0198 : Poly :=
[
  term ((4244765494801986000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 9. -/
theorem ep_Q2_008_partial_09_0198_valid :
    mulPoly ep_Q2_008_coefficient_09_0198
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0199 : Poly :=
[
  term ((-2048889463757928946897022333839678358400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 199 for generator 9. -/
def ep_Q2_008_partial_09_0199 : Poly :=
[
  term ((2048889463757928946897022333839678358400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 9. -/
theorem ep_Q2_008_partial_09_0199_valid :
    mulPoly ep_Q2_008_coefficient_09_0199
        ep_Q2_008_generator_09_0100_0199 =
      ep_Q2_008_partial_09_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_09_0100_0199 : List Poly :=
[
  ep_Q2_008_partial_09_0100,
  ep_Q2_008_partial_09_0101,
  ep_Q2_008_partial_09_0102,
  ep_Q2_008_partial_09_0103,
  ep_Q2_008_partial_09_0104,
  ep_Q2_008_partial_09_0105,
  ep_Q2_008_partial_09_0106,
  ep_Q2_008_partial_09_0107,
  ep_Q2_008_partial_09_0108,
  ep_Q2_008_partial_09_0109,
  ep_Q2_008_partial_09_0110,
  ep_Q2_008_partial_09_0111,
  ep_Q2_008_partial_09_0112,
  ep_Q2_008_partial_09_0113,
  ep_Q2_008_partial_09_0114,
  ep_Q2_008_partial_09_0115,
  ep_Q2_008_partial_09_0116,
  ep_Q2_008_partial_09_0117,
  ep_Q2_008_partial_09_0118,
  ep_Q2_008_partial_09_0119,
  ep_Q2_008_partial_09_0120,
  ep_Q2_008_partial_09_0121,
  ep_Q2_008_partial_09_0122,
  ep_Q2_008_partial_09_0123,
  ep_Q2_008_partial_09_0124,
  ep_Q2_008_partial_09_0125,
  ep_Q2_008_partial_09_0126,
  ep_Q2_008_partial_09_0127,
  ep_Q2_008_partial_09_0128,
  ep_Q2_008_partial_09_0129,
  ep_Q2_008_partial_09_0130,
  ep_Q2_008_partial_09_0131,
  ep_Q2_008_partial_09_0132,
  ep_Q2_008_partial_09_0133,
  ep_Q2_008_partial_09_0134,
  ep_Q2_008_partial_09_0135,
  ep_Q2_008_partial_09_0136,
  ep_Q2_008_partial_09_0137,
  ep_Q2_008_partial_09_0138,
  ep_Q2_008_partial_09_0139,
  ep_Q2_008_partial_09_0140,
  ep_Q2_008_partial_09_0141,
  ep_Q2_008_partial_09_0142,
  ep_Q2_008_partial_09_0143,
  ep_Q2_008_partial_09_0144,
  ep_Q2_008_partial_09_0145,
  ep_Q2_008_partial_09_0146,
  ep_Q2_008_partial_09_0147,
  ep_Q2_008_partial_09_0148,
  ep_Q2_008_partial_09_0149,
  ep_Q2_008_partial_09_0150,
  ep_Q2_008_partial_09_0151,
  ep_Q2_008_partial_09_0152,
  ep_Q2_008_partial_09_0153,
  ep_Q2_008_partial_09_0154,
  ep_Q2_008_partial_09_0155,
  ep_Q2_008_partial_09_0156,
  ep_Q2_008_partial_09_0157,
  ep_Q2_008_partial_09_0158,
  ep_Q2_008_partial_09_0159,
  ep_Q2_008_partial_09_0160,
  ep_Q2_008_partial_09_0161,
  ep_Q2_008_partial_09_0162,
  ep_Q2_008_partial_09_0163,
  ep_Q2_008_partial_09_0164,
  ep_Q2_008_partial_09_0165,
  ep_Q2_008_partial_09_0166,
  ep_Q2_008_partial_09_0167,
  ep_Q2_008_partial_09_0168,
  ep_Q2_008_partial_09_0169,
  ep_Q2_008_partial_09_0170,
  ep_Q2_008_partial_09_0171,
  ep_Q2_008_partial_09_0172,
  ep_Q2_008_partial_09_0173,
  ep_Q2_008_partial_09_0174,
  ep_Q2_008_partial_09_0175,
  ep_Q2_008_partial_09_0176,
  ep_Q2_008_partial_09_0177,
  ep_Q2_008_partial_09_0178,
  ep_Q2_008_partial_09_0179,
  ep_Q2_008_partial_09_0180,
  ep_Q2_008_partial_09_0181,
  ep_Q2_008_partial_09_0182,
  ep_Q2_008_partial_09_0183,
  ep_Q2_008_partial_09_0184,
  ep_Q2_008_partial_09_0185,
  ep_Q2_008_partial_09_0186,
  ep_Q2_008_partial_09_0187,
  ep_Q2_008_partial_09_0188,
  ep_Q2_008_partial_09_0189,
  ep_Q2_008_partial_09_0190,
  ep_Q2_008_partial_09_0191,
  ep_Q2_008_partial_09_0192,
  ep_Q2_008_partial_09_0193,
  ep_Q2_008_partial_09_0194,
  ep_Q2_008_partial_09_0195,
  ep_Q2_008_partial_09_0196,
  ep_Q2_008_partial_09_0197,
  ep_Q2_008_partial_09_0198,
  ep_Q2_008_partial_09_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_09_0100_0199 : Poly :=
[
  term ((8131564232645779221402739805107200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-71346398428652826132158641717161600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-19300686560134180875 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-578831658382089000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((-6360365645918091527675642643791575857600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-53601229279566270000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((587490295841031375 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((255899923086091082367 : Rat) / 11087303257826821744) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((2723816650104925212153710468043271209600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-78283337177484022003889761992886409030400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((4575683185875846999318579672081767816453869 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-5412615546551211675 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (16, 1)],
  term ((-12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((9148009761726501624078082280745600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-53819861292522639870 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((-95631705432235450292767693481959200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-5014213127946281709 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-40196642943200625 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-23985511571295349047 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((32291916775513583922 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((8963977023847688398368832575587980488273697 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((92050785676708875 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-1251254543439386635862909587601688000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-839032029978394458007055546579289600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((37581804255052387551 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-38348941583926328000274344925244800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((34854140819368365243 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((4209402769886052260210451515381611593782525 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((153166897805978526824336044309113600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-26206034311795812499000427336195541207385080 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((-258439287200141737761 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((52535980056070510935615437528967768000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1357505594412951295407473941904559327374563 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-194619027395906265603639083812300800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (15, 4), (16, 1)],
  term ((201004355692739825111 : Rat) / 22174606515653643488) [(2, 1), (5, 1), (7, 1), (16, 1)],
  term ((-1393970900292399457189540537914585600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((14378328808718033457712129324262400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-282248748571885366517729205321312000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((13103054322585442735394856149888062197343740 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((610381754232706174199530511066292546028749 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((183229452328326250336574981370048000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (15, 3), (16, 1)],
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 3), (15, 2), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(2, 1), (5, 1), (9, 1), (16, 1)],
  term ((-59550582138075000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-12734296484405958000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((25463440102759104375 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((94803927494946305917646790538616889000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6146668391273786840691067001519035075200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35734152853044180000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1401694617601348875 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-6301125276424931977002244890890659420875 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((33947445210391971000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((2810332855803061341406458585064787500800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((1719403304289616125 : Rat) / 11087303257826821744) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-105559530093286220235 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-17085342331647223438431898904402898658665582 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1043499519869123319617845160831885366490277 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9447149221773586859194863807453565160171381 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((111888112174696860885 : Rat) / 22174606515653643488) [(2, 1), (5, 1), (13, 1), (16, 1)],
  term ((364954524554145349619193763568935211905482 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((107639722585045279740 : Rat) / 692956453614176359) [(2, 1), (5, 1), (13, 2), (15, 3), (16, 1)],
  term ((-967816845394189629189797033982065649059219 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((2104639235181182094975540307520976395808377 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-919708186707086232815426272211913600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3321959394710837786227029878990400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((161459583877567919610 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 1), (13, 2), (16, 1)],
  term ((15042639383838845127 : Rat) / 5543651628913410872) [(2, 1), (5, 2), (12, 1), (16, 1)],
  term ((-306773209367379047259 : Rat) / 1385912907228352718) [(2, 1), (5, 2), (13, 2), (16, 1)],
  term ((222572403645285591399 : Rat) / 22174606515653643488) [(2, 1), (5, 2), (16, 1)],
  term ((4244765494801986000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((2048889463757928946897022333839678358400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16263128465291558442805479610214400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((4569158253174918890648801096780352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((142692796857305652264317283434323200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((38601373120268361750 : Rat) / 692956453614176359) [(2, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((1157663316764178000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (10, 1), (16, 1)],
  term ((12720731291836183055351285287583151715200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((107202458559132540000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-587490295841031375 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-255899923086091082367 : Rat) / 5543651628913410872) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((156566674354968044007779523985772818060800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4575683185875846999318579672081767816453869 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((5412615546551211675 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (16, 1)],
  term ((24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((107639722585045279740 : Rat) / 692956453614176359) [(2, 2), (5, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((191263410864470900585535386963918400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((5014213127946281709 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((80393285886401250 : Rat) / 692956453614176359) [(2, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-7995170523765116349 : Rat) / 692956453614176359) [(2, 2), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((1145077892859441821928036850911497083007721 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((23985511571295349047 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(2, 2), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-8963977023847688398368832575587980488273697 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-184101571353417750 : Rat) / 692956453614176359) [(2, 2), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-166741629986610000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((2502509086878773271725819175203376000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1678064059956788916014111093158579200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-37581804255052387551 : Rat) / 692956453614176359) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((76697883167852656000548689850489600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-34854140819368365243 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-4209402769886052260210451515381611593782525 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-306333795611957053648672088618227200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((52412068623591624998000854672391082414770160 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((258439287200141737761 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-105071960112141021871230875057935536000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((1357505594412951295407473941904559327374563 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((389238054791812531207278167624601600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (15, 4), (16, 1)],
  term ((-201004355692739825111 : Rat) / 11087303257826821744) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((2787941800584798914379081075829171200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-28756657617436066915424258648524800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((564497497143770733035458410642624000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-26206108645170885470789712299776124394687480 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((2581637015318136793867863220243968000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((-610381754232706174199530511066292546028749 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-366458904656652500673149962740096000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (15, 3), (16, 1)],
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((-22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 3), (15, 2), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((119101164276150000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((25468592968811916000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25463440102759104375 : Rat) / 692956453614176359) [(2, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-189607854989892611835293581077233778000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((12293336782547573681382134003038070150400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((71468305706088360000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1401694617601348875 : Rat) / 1385912907228352718) [(2, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((12602250552849863954004489781781318841750 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-67894890420783942000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-5620665711606122682812917170129575001600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1719403304289616125 : Rat) / 5543651628913410872) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(2, 2), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3479750557115580829767541744942693516800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((105559530093286220235 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((34170684663294446876863797808805797317331164 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1043499519869123319617845160831885366490277 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((9447149221773586859194863807453565160171381 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-111888112174696860885 : Rat) / 11087303257826821744) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((-729909049108290699238387527137870423810964 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-215279445170090559480 : Rat) / 692956453614176359) [(2, 2), (5, 1), (13, 2), (15, 3), (16, 1)],
  term ((967816845394189629189797033982065649059219 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-2104639235181182094975540307520976395808377 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (5, 1), (15, 3), (16, 1)],
  term ((-1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1839416373414172465630852544423827200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((6643918789421675572454059757980800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-322919167755135839220 : Rat) / 692956453614176359) [(2, 2), (5, 2), (12, 1), (13, 2), (16, 1)],
  term ((-15042639383838845127 : Rat) / 2771825814456705436) [(2, 2), (5, 2), (12, 1), (16, 1)],
  term ((306773209367379047259 : Rat) / 692956453614176359) [(2, 2), (5, 2), (13, 2), (16, 1)],
  term ((-222572403645285591399 : Rat) / 11087303257826821744) [(2, 2), (5, 2), (16, 1)],
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 100 through 199. -/
theorem ep_Q2_008_block_09_0100_0199_valid :
    checkProductSumEq ep_Q2_008_partials_09_0100_0199
      ep_Q2_008_block_09_0100_0199 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
