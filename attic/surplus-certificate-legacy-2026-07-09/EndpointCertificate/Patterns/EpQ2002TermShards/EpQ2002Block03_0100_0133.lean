/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 3:100-133

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 3 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_03_0100_0133 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0100 : Poly :=
[
  term ((127319069587687190805276093172027235067936 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 100 for generator 3. -/
def ep_Q2_002_partial_03_0100 : Poly :=
[
  term ((127319069587687190805276093172027235067936 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((127319069587687190805276093172027235067936 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((-127319069587687190805276093172027235067936 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-127319069587687190805276093172027235067936 : Rat) / 269363643504064505317229453910785233499) [(8, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 3. -/
theorem ep_Q2_002_partial_03_0100_valid :
    mulPoly ep_Q2_002_coefficient_03_0100
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0101 : Poly :=
[
  term ((7145891948 : Rat) / 1480263449) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 3. -/
def ep_Q2_002_partial_03_0101 : Poly :=
[
  term ((7145891948 : Rat) / 1480263449) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((7145891948 : Rat) / 1480263449) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7145891948 : Rat) / 1480263449) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7145891948 : Rat) / 1480263449) [(8, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 3. -/
theorem ep_Q2_002_partial_03_0101_valid :
    mulPoly ep_Q2_002_coefficient_03_0101
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0102 : Poly :=
[
  term ((-29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2)]
]

/-- Partial product 102 for generator 3. -/
def ep_Q2_002_partial_03_0102 : Poly :=
[
  term ((-29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (11, 2)],
  term ((-29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 2)],
  term ((29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 2), (11, 2)],
  term ((29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(8, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 3. -/
theorem ep_Q2_002_partial_03_0102_valid :
    mulPoly ep_Q2_002_coefficient_03_0102
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0103 : Poly :=
[
  term ((24922508136269286777255607523514274193328 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 103 for generator 3. -/
def ep_Q2_002_partial_03_0103 : Poly :=
[
  term ((24922508136269286777255607523514274193328 : Rat) / 122438019774574775144195206323084197045) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((24922508136269286777255607523514274193328 : Rat) / 122438019774574775144195206323084197045) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((-24922508136269286777255607523514274193328 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-24922508136269286777255607523514274193328 : Rat) / 122438019774574775144195206323084197045) [(8, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 3. -/
theorem ep_Q2_002_partial_03_0103_valid :
    mulPoly ep_Q2_002_coefficient_03_0103
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0104 : Poly :=
[
  term ((-58969412756 : Rat) / 7401317245) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 3. -/
def ep_Q2_002_partial_03_0104 : Poly :=
[
  term ((-58969412756 : Rat) / 7401317245) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-58969412756 : Rat) / 7401317245) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((58969412756 : Rat) / 7401317245) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((58969412756 : Rat) / 7401317245) [(8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 3. -/
theorem ep_Q2_002_partial_03_0104_valid :
    mulPoly ep_Q2_002_coefficient_03_0104
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0105 : Poly :=
[
  term ((-17795695076701778679378992163072 : Rat) / 115799135485108289802725034287) [(8, 1), (13, 2)]
]

/-- Partial product 105 for generator 3. -/
def ep_Q2_002_partial_03_0105 : Poly :=
[
  term ((-17795695076701778679378992163072 : Rat) / 115799135485108289802725034287) [(2, 2), (8, 1), (13, 2)],
  term ((-17795695076701778679378992163072 : Rat) / 115799135485108289802725034287) [(3, 2), (8, 1), (13, 2)],
  term ((17795695076701778679378992163072 : Rat) / 115799135485108289802725034287) [(8, 1), (9, 2), (13, 2)],
  term ((17795695076701778679378992163072 : Rat) / 115799135485108289802725034287) [(8, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 3. -/
theorem ep_Q2_002_partial_03_0105_valid :
    mulPoly ep_Q2_002_coefficient_03_0105
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0106 : Poly :=
[
  term ((52366952738150563624612115580000 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1)]
]

/-- Partial product 106 for generator 3. -/
def ep_Q2_002_partial_03_0106 : Poly :=
[
  term ((52366952738150563624612115580000 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1)],
  term ((52366952738150563624612115580000 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1)],
  term ((-52366952738150563624612115580000 : Rat) / 1273790490336191187829975377157) [(8, 2), (9, 1), (11, 1)],
  term ((-52366952738150563624612115580000 : Rat) / 1273790490336191187829975377157) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 3. -/
theorem ep_Q2_002_partial_03_0106_valid :
    mulPoly ep_Q2_002_coefficient_03_0106
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0107 : Poly :=
[
  term ((-9449774508977797455931185930816 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 107 for generator 3. -/
def ep_Q2_002_partial_03_0107 : Poly :=
[
  term ((-9449774508977797455931185930816 : Rat) / 115799135485108289802725034287) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((-9449774508977797455931185930816 : Rat) / 115799135485108289802725034287) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((9449774508977797455931185930816 : Rat) / 115799135485108289802725034287) [(8, 2), (9, 1), (11, 1), (12, 1)],
  term ((9449774508977797455931185930816 : Rat) / 115799135485108289802725034287) [(9, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 3. -/
theorem ep_Q2_002_partial_03_0107_valid :
    mulPoly ep_Q2_002_coefficient_03_0107
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0108 : Poly :=
[
  term ((15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 108 for generator 3. -/
def ep_Q2_002_partial_03_0108 : Poly :=
[
  term ((15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((-15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((-15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(9, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 3. -/
theorem ep_Q2_002_partial_03_0108_valid :
    mulPoly ep_Q2_002_coefficient_03_0108
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0109 : Poly :=
[
  term ((17795695076701778679378992163072 : Rat) / 115799135485108289802725034287) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 109 for generator 3. -/
def ep_Q2_002_partial_03_0109 : Poly :=
[
  term ((17795695076701778679378992163072 : Rat) / 115799135485108289802725034287) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((17795695076701778679378992163072 : Rat) / 115799135485108289802725034287) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((-17795695076701778679378992163072 : Rat) / 115799135485108289802725034287) [(8, 2), (9, 1), (12, 1), (13, 1)],
  term ((-17795695076701778679378992163072 : Rat) / 115799135485108289802725034287) [(9, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 3. -/
theorem ep_Q2_002_partial_03_0109_valid :
    mulPoly ep_Q2_002_coefficient_03_0109
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0110 : Poly :=
[
  term ((-24922508136269286777255607523514274193328 : Rat) / 122438019774574775144195206323084197045) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 110 for generator 3. -/
def ep_Q2_002_partial_03_0110 : Poly :=
[
  term ((-24922508136269286777255607523514274193328 : Rat) / 122438019774574775144195206323084197045) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-24922508136269286777255607523514274193328 : Rat) / 122438019774574775144195206323084197045) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((24922508136269286777255607523514274193328 : Rat) / 122438019774574775144195206323084197045) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((24922508136269286777255607523514274193328 : Rat) / 122438019774574775144195206323084197045) [(9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 3. -/
theorem ep_Q2_002_partial_03_0110_valid :
    mulPoly ep_Q2_002_coefficient_03_0110
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0111 : Poly :=
[
  term ((58969412756 : Rat) / 7401317245) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 3. -/
def ep_Q2_002_partial_03_0111 : Poly :=
[
  term ((58969412756 : Rat) / 7401317245) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((58969412756 : Rat) / 7401317245) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-58969412756 : Rat) / 7401317245) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-58969412756 : Rat) / 7401317245) [(9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 3. -/
theorem ep_Q2_002_partial_03_0111_valid :
    mulPoly ep_Q2_002_coefficient_03_0111
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0112 : Poly :=
[
  term ((-98616778859518737406876773360000 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1)]
]

/-- Partial product 112 for generator 3. -/
def ep_Q2_002_partial_03_0112 : Poly :=
[
  term ((-98616778859518737406876773360000 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (13, 1)],
  term ((-98616778859518737406876773360000 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (13, 1)],
  term ((98616778859518737406876773360000 : Rat) / 1273790490336191187829975377157) [(8, 2), (9, 1), (13, 1)],
  term ((98616778859518737406876773360000 : Rat) / 1273790490336191187829975377157) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 3. -/
theorem ep_Q2_002_partial_03_0112_valid :
    mulPoly ep_Q2_002_coefficient_03_0112
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0113 : Poly :=
[
  term ((-29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 113 for generator 3. -/
def ep_Q2_002_partial_03_0113 : Poly :=
[
  term ((-29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((-29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(9, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 3. -/
theorem ep_Q2_002_partial_03_0113_valid :
    mulPoly ep_Q2_002_coefficient_03_0113
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0114 : Poly :=
[
  term ((856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 114 for generator 3. -/
def ep_Q2_002_partial_03_0114 : Poly :=
[
  term ((856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((-856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((-856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(9, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 3. -/
theorem ep_Q2_002_partial_03_0114_valid :
    mulPoly ep_Q2_002_coefficient_03_0114
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0115 : Poly :=
[
  term ((13300676832 : Rat) / 7401317245) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 3. -/
def ep_Q2_002_partial_03_0115 : Poly :=
[
  term ((13300676832 : Rat) / 7401317245) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((13300676832 : Rat) / 7401317245) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13300676832 : Rat) / 7401317245) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13300676832 : Rat) / 7401317245) [(9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 3. -/
theorem ep_Q2_002_partial_03_0115_valid :
    mulPoly ep_Q2_002_coefficient_03_0115
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0116 : Poly :=
[
  term ((219977679288756050606466213463730624144724 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (15, 1)]
]

/-- Partial product 116 for generator 3. -/
def ep_Q2_002_partial_03_0116 : Poly :=
[
  term ((219977679288756050606466213463730624144724 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (9, 1), (15, 1)],
  term ((219977679288756050606466213463730624144724 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (9, 1), (15, 1)],
  term ((-219977679288756050606466213463730624144724 : Rat) / 269363643504064505317229453910785233499) [(8, 2), (9, 1), (15, 1)],
  term ((-219977679288756050606466213463730624144724 : Rat) / 269363643504064505317229453910785233499) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 3. -/
theorem ep_Q2_002_partial_03_0116_valid :
    mulPoly ep_Q2_002_coefficient_03_0116
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0117 : Poly :=
[
  term ((-658246963 : Rat) / 1480263449) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 3. -/
def ep_Q2_002_partial_03_0117 : Poly :=
[
  term ((-658246963 : Rat) / 1480263449) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-658246963 : Rat) / 1480263449) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((658246963 : Rat) / 1480263449) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((658246963 : Rat) / 1480263449) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 3. -/
theorem ep_Q2_002_partial_03_0117_valid :
    mulPoly ep_Q2_002_coefficient_03_0117
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0118 : Poly :=
[
  term ((-33452431820229845993943648086784 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 118 for generator 3. -/
def ep_Q2_002_partial_03_0118 : Poly :=
[
  term ((-33452431820229845993943648086784 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((-33452431820229845993943648086784 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((33452431820229845993943648086784 : Rat) / 1273790490336191187829975377157) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((33452431820229845993943648086784 : Rat) / 1273790490336191187829975377157) [(9, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 3. -/
theorem ep_Q2_002_partial_03_0118_valid :
    mulPoly ep_Q2_002_coefficient_03_0118
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0119 : Poly :=
[
  term ((178409875346977008579200262423114187113972 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 119 for generator 3. -/
def ep_Q2_002_partial_03_0119 : Poly :=
[
  term ((178409875346977008579200262423114187113972 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((178409875346977008579200262423114187113972 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-178409875346977008579200262423114187113972 : Rat) / 1346818217520322526586147269553926167495) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-178409875346977008579200262423114187113972 : Rat) / 1346818217520322526586147269553926167495) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 3. -/
theorem ep_Q2_002_partial_03_0119_valid :
    mulPoly ep_Q2_002_coefficient_03_0119
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0120 : Poly :=
[
  term ((-8987039524 : Rat) / 7401317245) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 3. -/
def ep_Q2_002_partial_03_0120 : Poly :=
[
  term ((-8987039524 : Rat) / 7401317245) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8987039524 : Rat) / 7401317245) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8987039524 : Rat) / 7401317245) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8987039524 : Rat) / 7401317245) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 3. -/
theorem ep_Q2_002_partial_03_0120_valid :
    mulPoly ep_Q2_002_coefficient_03_0120
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0121 : Poly :=
[
  term ((69923487583643910539406225705234 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1)]
]

/-- Partial product 121 for generator 3. -/
def ep_Q2_002_partial_03_0121 : Poly :=
[
  term ((69923487583643910539406225705234 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (13, 1)],
  term ((69923487583643910539406225705234 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (13, 1)],
  term ((-69923487583643910539406225705234 : Rat) / 1273790490336191187829975377157) [(8, 2), (11, 1), (13, 1)],
  term ((-69923487583643910539406225705234 : Rat) / 1273790490336191187829975377157) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 3. -/
theorem ep_Q2_002_partial_03_0121_valid :
    mulPoly ep_Q2_002_coefficient_03_0121
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0122 : Poly :=
[
  term ((88981389435249490089927540271362177290868 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (15, 1)]
]

/-- Partial product 122 for generator 3. -/
def ep_Q2_002_partial_03_0122 : Poly :=
[
  term ((88981389435249490089927540271362177290868 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (11, 1), (15, 1)],
  term ((88981389435249490089927540271362177290868 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (11, 1), (15, 1)],
  term ((-88981389435249490089927540271362177290868 : Rat) / 1346818217520322526586147269553926167495) [(8, 2), (11, 1), (15, 1)],
  term ((-88981389435249490089927540271362177290868 : Rat) / 1346818217520322526586147269553926167495) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 3. -/
theorem ep_Q2_002_partial_03_0122_valid :
    mulPoly ep_Q2_002_coefficient_03_0122
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0123 : Poly :=
[
  term ((18109694439 : Rat) / 7401317245) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 3. -/
def ep_Q2_002_partial_03_0123 : Poly :=
[
  term ((18109694439 : Rat) / 7401317245) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((18109694439 : Rat) / 7401317245) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-18109694439 : Rat) / 7401317245) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-18109694439 : Rat) / 7401317245) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 3. -/
theorem ep_Q2_002_partial_03_0123_valid :
    mulPoly ep_Q2_002_coefficient_03_0123
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0124 : Poly :=
[
  term ((-22163849896522399481486580202476 : Rat) / 1273790490336191187829975377157) [(11, 2)]
]

/-- Partial product 124 for generator 3. -/
def ep_Q2_002_partial_03_0124 : Poly :=
[
  term ((-22163849896522399481486580202476 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 2)],
  term ((-22163849896522399481486580202476 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 2)],
  term ((22163849896522399481486580202476 : Rat) / 1273790490336191187829975377157) [(8, 2), (11, 2)],
  term ((22163849896522399481486580202476 : Rat) / 1273790490336191187829975377157) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 3. -/
theorem ep_Q2_002_partial_03_0124_valid :
    mulPoly ep_Q2_002_coefficient_03_0124
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0125 : Poly :=
[
  term ((17763730841398213926788598735552 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1)]
]

/-- Partial product 125 for generator 3. -/
def ep_Q2_002_partial_03_0125 : Poly :=
[
  term ((17763730841398213926788598735552 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 2), (12, 1)],
  term ((17763730841398213926788598735552 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 2), (12, 1)],
  term ((-17763730841398213926788598735552 : Rat) / 1273790490336191187829975377157) [(8, 2), (11, 2), (12, 1)],
  term ((-17763730841398213926788598735552 : Rat) / 1273790490336191187829975377157) [(9, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 3. -/
theorem ep_Q2_002_partial_03_0125_valid :
    mulPoly ep_Q2_002_coefficient_03_0125
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0126 : Poly :=
[
  term ((-9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 126 for generator 3. -/
def ep_Q2_002_partial_03_0126 : Poly :=
[
  term ((-9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 3. -/
theorem ep_Q2_002_partial_03_0126_valid :
    mulPoly ep_Q2_002_coefficient_03_0126
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0127 : Poly :=
[
  term ((30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(12, 1), (15, 2)]
]

/-- Partial product 127 for generator 3. -/
def ep_Q2_002_partial_03_0127 : Poly :=
[
  term ((30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(2, 2), (12, 1), (15, 2)],
  term ((30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(3, 2), (12, 1), (15, 2)],
  term ((-30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(8, 2), (12, 1), (15, 2)],
  term ((-30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 3. -/
theorem ep_Q2_002_partial_03_0127_valid :
    mulPoly ep_Q2_002_coefficient_03_0127
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0128 : Poly :=
[
  term ((-4452383839 : Rat) / 1057331035) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 128 for generator 3. -/
def ep_Q2_002_partial_03_0128 : Poly :=
[
  term ((-4452383839 : Rat) / 1057331035) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-4452383839 : Rat) / 1057331035) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((4452383839 : Rat) / 1057331035) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((4452383839 : Rat) / 1057331035) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 3. -/
theorem ep_Q2_002_partial_03_0128_valid :
    mulPoly ep_Q2_002_coefficient_03_0128
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0129 : Poly :=
[
  term ((-410164438108210276749671977228329818832 : Rat) / 916826560599266525926580850615334355) [(13, 1), (15, 1)]
]

/-- Partial product 129 for generator 3. -/
def ep_Q2_002_partial_03_0129 : Poly :=
[
  term ((-410164438108210276749671977228329818832 : Rat) / 916826560599266525926580850615334355) [(2, 2), (13, 1), (15, 1)],
  term ((-410164438108210276749671977228329818832 : Rat) / 916826560599266525926580850615334355) [(3, 2), (13, 1), (15, 1)],
  term ((410164438108210276749671977228329818832 : Rat) / 916826560599266525926580850615334355) [(8, 2), (13, 1), (15, 1)],
  term ((410164438108210276749671977228329818832 : Rat) / 916826560599266525926580850615334355) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 3. -/
theorem ep_Q2_002_partial_03_0129_valid :
    mulPoly ep_Q2_002_coefficient_03_0129
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0130 : Poly :=
[
  term ((-10520607029 : Rat) / 2114662070) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 3. -/
def ep_Q2_002_partial_03_0130 : Poly :=
[
  term ((-10520607029 : Rat) / 2114662070) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10520607029 : Rat) / 2114662070) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((10520607029 : Rat) / 2114662070) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((10520607029 : Rat) / 2114662070) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 3. -/
theorem ep_Q2_002_partial_03_0130_valid :
    mulPoly ep_Q2_002_coefficient_03_0130
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0131 : Poly :=
[
  term ((-53077270863440547139895095574664 : Rat) / 1273790490336191187829975377157) [(13, 2)]
]

/-- Partial product 131 for generator 3. -/
def ep_Q2_002_partial_03_0131 : Poly :=
[
  term ((-53077270863440547139895095574664 : Rat) / 1273790490336191187829975377157) [(2, 2), (13, 2)],
  term ((-53077270863440547139895095574664 : Rat) / 1273790490336191187829975377157) [(3, 2), (13, 2)],
  term ((53077270863440547139895095574664 : Rat) / 1273790490336191187829975377157) [(8, 2), (13, 2)],
  term ((53077270863440547139895095574664 : Rat) / 1273790490336191187829975377157) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 3. -/
theorem ep_Q2_002_partial_03_0131_valid :
    mulPoly ep_Q2_002_coefficient_03_0131
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0132 : Poly :=
[
  term ((-491569292166408685915812190126116615219876 : Rat) / 1346818217520322526586147269553926167495) [(15, 2)]
]

/-- Partial product 132 for generator 3. -/
def ep_Q2_002_partial_03_0132 : Poly :=
[
  term ((-491569292166408685915812190126116615219876 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (15, 2)],
  term ((-491569292166408685915812190126116615219876 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (15, 2)],
  term ((491569292166408685915812190126116615219876 : Rat) / 1346818217520322526586147269553926167495) [(8, 2), (15, 2)],
  term ((491569292166408685915812190126116615219876 : Rat) / 1346818217520322526586147269553926167495) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 3. -/
theorem ep_Q2_002_partial_03_0132_valid :
    mulPoly ep_Q2_002_coefficient_03_0132
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0133 : Poly :=
[
  term ((2988391476 : Rat) / 1057331035) [(15, 2), (16, 1)]
]

/-- Partial product 133 for generator 3. -/
def ep_Q2_002_partial_03_0133 : Poly :=
[
  term ((2988391476 : Rat) / 1057331035) [(2, 2), (15, 2), (16, 1)],
  term ((2988391476 : Rat) / 1057331035) [(3, 2), (15, 2), (16, 1)],
  term ((-2988391476 : Rat) / 1057331035) [(8, 2), (15, 2), (16, 1)],
  term ((-2988391476 : Rat) / 1057331035) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 3. -/
theorem ep_Q2_002_partial_03_0133_valid :
    mulPoly ep_Q2_002_coefficient_03_0133
        ep_Q2_002_generator_03_0100_0133 =
      ep_Q2_002_partial_03_0133 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_03_0100_0133 : List Poly :=
[
  ep_Q2_002_partial_03_0100,
  ep_Q2_002_partial_03_0101,
  ep_Q2_002_partial_03_0102,
  ep_Q2_002_partial_03_0103,
  ep_Q2_002_partial_03_0104,
  ep_Q2_002_partial_03_0105,
  ep_Q2_002_partial_03_0106,
  ep_Q2_002_partial_03_0107,
  ep_Q2_002_partial_03_0108,
  ep_Q2_002_partial_03_0109,
  ep_Q2_002_partial_03_0110,
  ep_Q2_002_partial_03_0111,
  ep_Q2_002_partial_03_0112,
  ep_Q2_002_partial_03_0113,
  ep_Q2_002_partial_03_0114,
  ep_Q2_002_partial_03_0115,
  ep_Q2_002_partial_03_0116,
  ep_Q2_002_partial_03_0117,
  ep_Q2_002_partial_03_0118,
  ep_Q2_002_partial_03_0119,
  ep_Q2_002_partial_03_0120,
  ep_Q2_002_partial_03_0121,
  ep_Q2_002_partial_03_0122,
  ep_Q2_002_partial_03_0123,
  ep_Q2_002_partial_03_0124,
  ep_Q2_002_partial_03_0125,
  ep_Q2_002_partial_03_0126,
  ep_Q2_002_partial_03_0127,
  ep_Q2_002_partial_03_0128,
  ep_Q2_002_partial_03_0129,
  ep_Q2_002_partial_03_0130,
  ep_Q2_002_partial_03_0131,
  ep_Q2_002_partial_03_0132,
  ep_Q2_002_partial_03_0133
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_03_0100_0133 : Poly :=
[
  term ((127319069587687190805276093172027235067936 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((7145891948 : Rat) / 1480263449) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (11, 2)],
  term ((24922508136269286777255607523514274193328 : Rat) / 122438019774574775144195206323084197045) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((-58969412756 : Rat) / 7401317245) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17795695076701778679378992163072 : Rat) / 115799135485108289802725034287) [(2, 2), (8, 1), (13, 2)],
  term ((52366952738150563624612115580000 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1)],
  term ((-9449774508977797455931185930816 : Rat) / 115799135485108289802725034287) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((17795695076701778679378992163072 : Rat) / 115799135485108289802725034287) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((-24922508136269286777255607523514274193328 : Rat) / 122438019774574775144195206323084197045) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((58969412756 : Rat) / 7401317245) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-98616778859518737406876773360000 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (13, 1)],
  term ((-29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((13300676832 : Rat) / 7401317245) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((219977679288756050606466213463730624144724 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (9, 1), (15, 1)],
  term ((-658246963 : Rat) / 1480263449) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-33452431820229845993943648086784 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((178409875346977008579200262423114187113972 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-8987039524 : Rat) / 7401317245) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((69923487583643910539406225705234 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (13, 1)],
  term ((88981389435249490089927540271362177290868 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (11, 1), (15, 1)],
  term ((18109694439 : Rat) / 7401317245) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22163849896522399481486580202476 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 2)],
  term ((17763730841398213926788598735552 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 2), (12, 1)],
  term ((-9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(2, 2), (12, 1), (15, 2)],
  term ((-4452383839 : Rat) / 1057331035) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-410164438108210276749671977228329818832 : Rat) / 916826560599266525926580850615334355) [(2, 2), (13, 1), (15, 1)],
  term ((-10520607029 : Rat) / 2114662070) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-53077270863440547139895095574664 : Rat) / 1273790490336191187829975377157) [(2, 2), (13, 2)],
  term ((-491569292166408685915812190126116615219876 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (15, 2)],
  term ((2988391476 : Rat) / 1057331035) [(2, 2), (15, 2), (16, 1)],
  term ((127319069587687190805276093172027235067936 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((7145891948 : Rat) / 1480263449) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 2)],
  term ((24922508136269286777255607523514274193328 : Rat) / 122438019774574775144195206323084197045) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((-58969412756 : Rat) / 7401317245) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17795695076701778679378992163072 : Rat) / 115799135485108289802725034287) [(3, 2), (8, 1), (13, 2)],
  term ((52366952738150563624612115580000 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1)],
  term ((-9449774508977797455931185930816 : Rat) / 115799135485108289802725034287) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((17795695076701778679378992163072 : Rat) / 115799135485108289802725034287) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((-24922508136269286777255607523514274193328 : Rat) / 122438019774574775144195206323084197045) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((58969412756 : Rat) / 7401317245) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-98616778859518737406876773360000 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (13, 1)],
  term ((-29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((13300676832 : Rat) / 7401317245) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((219977679288756050606466213463730624144724 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (9, 1), (15, 1)],
  term ((-658246963 : Rat) / 1480263449) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-33452431820229845993943648086784 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((178409875346977008579200262423114187113972 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-8987039524 : Rat) / 7401317245) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((69923487583643910539406225705234 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (13, 1)],
  term ((88981389435249490089927540271362177290868 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (11, 1), (15, 1)],
  term ((18109694439 : Rat) / 7401317245) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22163849896522399481486580202476 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 2)],
  term ((17763730841398213926788598735552 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 2), (12, 1)],
  term ((-9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(3, 2), (12, 1), (15, 2)],
  term ((-4452383839 : Rat) / 1057331035) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-410164438108210276749671977228329818832 : Rat) / 916826560599266525926580850615334355) [(3, 2), (13, 1), (15, 1)],
  term ((-10520607029 : Rat) / 2114662070) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-53077270863440547139895095574664 : Rat) / 1273790490336191187829975377157) [(3, 2), (13, 2)],
  term ((-491569292166408685915812190126116615219876 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (15, 2)],
  term ((2988391476 : Rat) / 1057331035) [(3, 2), (15, 2), (16, 1)],
  term ((-127319069587687190805276093172027235067936 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-7145891948 : Rat) / 1480263449) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 2), (11, 2)],
  term ((-24922508136269286777255607523514274193328 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((58969412756 : Rat) / 7401317245) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((17795695076701778679378992163072 : Rat) / 115799135485108289802725034287) [(8, 1), (9, 2), (13, 2)],
  term ((-52366952738150563624612115580000 : Rat) / 1273790490336191187829975377157) [(8, 2), (9, 1), (11, 1)],
  term ((9449774508977797455931185930816 : Rat) / 115799135485108289802725034287) [(8, 2), (9, 1), (11, 1), (12, 1)],
  term ((-15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((-17795695076701778679378992163072 : Rat) / 115799135485108289802725034287) [(8, 2), (9, 1), (12, 1), (13, 1)],
  term ((24922508136269286777255607523514274193328 : Rat) / 122438019774574775144195206323084197045) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-58969412756 : Rat) / 7401317245) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((98616778859518737406876773360000 : Rat) / 1273790490336191187829975377157) [(8, 2), (9, 1), (13, 1)],
  term ((29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((-856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((-13300676832 : Rat) / 7401317245) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-219977679288756050606466213463730624144724 : Rat) / 269363643504064505317229453910785233499) [(8, 2), (9, 1), (15, 1)],
  term ((658246963 : Rat) / 1480263449) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((33452431820229845993943648086784 : Rat) / 1273790490336191187829975377157) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-178409875346977008579200262423114187113972 : Rat) / 1346818217520322526586147269553926167495) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((8987039524 : Rat) / 7401317245) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-69923487583643910539406225705234 : Rat) / 1273790490336191187829975377157) [(8, 2), (11, 1), (13, 1)],
  term ((-88981389435249490089927540271362177290868 : Rat) / 1346818217520322526586147269553926167495) [(8, 2), (11, 1), (15, 1)],
  term ((-18109694439 : Rat) / 7401317245) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((22163849896522399481486580202476 : Rat) / 1273790490336191187829975377157) [(8, 2), (11, 2)],
  term ((-17763730841398213926788598735552 : Rat) / 1273790490336191187829975377157) [(8, 2), (11, 2), (12, 1)],
  term ((9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(8, 2), (12, 1), (15, 2)],
  term ((4452383839 : Rat) / 1057331035) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((410164438108210276749671977228329818832 : Rat) / 916826560599266525926580850615334355) [(8, 2), (13, 1), (15, 1)],
  term ((10520607029 : Rat) / 2114662070) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((53077270863440547139895095574664 : Rat) / 1273790490336191187829975377157) [(8, 2), (13, 2)],
  term ((491569292166408685915812190126116615219876 : Rat) / 1346818217520322526586147269553926167495) [(8, 2), (15, 2)],
  term ((-2988391476 : Rat) / 1057331035) [(8, 2), (15, 2), (16, 1)],
  term ((-127319069587687190805276093172027235067936 : Rat) / 269363643504064505317229453910785233499) [(8, 3), (11, 1), (15, 1)],
  term ((-7145891948 : Rat) / 1480263449) [(8, 3), (11, 1), (15, 1), (16, 1)],
  term ((29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(8, 3), (11, 2)],
  term ((-24922508136269286777255607523514274193328 : Rat) / 122438019774574775144195206323084197045) [(8, 3), (13, 1), (15, 1)],
  term ((58969412756 : Rat) / 7401317245) [(8, 3), (13, 1), (15, 1), (16, 1)],
  term ((17795695076701778679378992163072 : Rat) / 115799135485108289802725034287) [(8, 3), (13, 2)],
  term ((33452431820229845993943648086784 : Rat) / 1273790490336191187829975377157) [(9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-178409875346977008579200262423114187113972 : Rat) / 1346818217520322526586147269553926167495) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((8987039524 : Rat) / 7401317245) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-69923487583643910539406225705234 : Rat) / 1273790490336191187829975377157) [(9, 2), (11, 1), (13, 1)],
  term ((-88981389435249490089927540271362177290868 : Rat) / 1346818217520322526586147269553926167495) [(9, 2), (11, 1), (15, 1)],
  term ((-18109694439 : Rat) / 7401317245) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((22163849896522399481486580202476 : Rat) / 1273790490336191187829975377157) [(9, 2), (11, 2)],
  term ((-17763730841398213926788598735552 : Rat) / 1273790490336191187829975377157) [(9, 2), (11, 2), (12, 1)],
  term ((9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(9, 2), (12, 1), (15, 2)],
  term ((4452383839 : Rat) / 1057331035) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((410164438108210276749671977228329818832 : Rat) / 916826560599266525926580850615334355) [(9, 2), (13, 1), (15, 1)],
  term ((10520607029 : Rat) / 2114662070) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((53077270863440547139895095574664 : Rat) / 1273790490336191187829975377157) [(9, 2), (13, 2)],
  term ((491569292166408685915812190126116615219876 : Rat) / 1346818217520322526586147269553926167495) [(9, 2), (15, 2)],
  term ((-2988391476 : Rat) / 1057331035) [(9, 2), (15, 2), (16, 1)],
  term ((-52366952738150563624612115580000 : Rat) / 1273790490336191187829975377157) [(9, 3), (11, 1)],
  term ((9449774508977797455931185930816 : Rat) / 115799135485108289802725034287) [(9, 3), (11, 1), (12, 1)],
  term ((-15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(9, 3), (11, 1), (14, 1)],
  term ((-17795695076701778679378992163072 : Rat) / 115799135485108289802725034287) [(9, 3), (12, 1), (13, 1)],
  term ((24922508136269286777255607523514274193328 : Rat) / 122438019774574775144195206323084197045) [(9, 3), (12, 1), (15, 1)],
  term ((-58969412756 : Rat) / 7401317245) [(9, 3), (12, 1), (15, 1), (16, 1)],
  term ((98616778859518737406876773360000 : Rat) / 1273790490336191187829975377157) [(9, 3), (13, 1)],
  term ((29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(9, 3), (13, 1), (14, 1)],
  term ((-856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(9, 3), (14, 1), (15, 1)],
  term ((-13300676832 : Rat) / 7401317245) [(9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-219977679288756050606466213463730624144724 : Rat) / 269363643504064505317229453910785233499) [(9, 3), (15, 1)],
  term ((658246963 : Rat) / 1480263449) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 100 through 133. -/
theorem ep_Q2_002_block_03_0100_0133_valid :
    checkProductSumEq ep_Q2_002_partials_03_0100_0133
      ep_Q2_002_block_03_0100_0133 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
