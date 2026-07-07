/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 3:100-125

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 3 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_03_0100_0125 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(8, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0100 : Poly :=
[
  term ((-9280700033883520 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (16, 1)]
]

/-- Partial product 100 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0100 : Poly :=
[
  term ((-9280700033883520 : Rat) / 17966088315235317) [(5, 2), (6, 1), (7, 2), (9, 2), (16, 1)],
  term ((-18561400067767040 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((9280700033883520 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 2), (9, 2), (16, 1)],
  term ((9280700033883520 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 4), (16, 1)],
  term ((18561400067767040 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 2), (16, 1)],
  term ((-9280700033883520 : Rat) / 17966088315235317) [(5, 2), (6, 3), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0100_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0100
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0101 : Poly :=
[
  term ((-632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (16, 1)]
]

/-- Partial product 101 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0101 : Poly :=
[
  term ((-632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (7, 2), (16, 1)],
  term ((-1264683745934976008 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 2), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (16, 1)],
  term ((1264683745934976008 : Rat) / 53898264945705951) [(5, 2), (6, 2), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0101_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0101
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0102 : Poly :=
[
  term ((9280700033883520 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 102 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0102 : Poly :=
[
  term ((-18561400067767040 : Rat) / 17966088315235317) [(5, 2), (6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((9280700033883520 : Rat) / 17966088315235317) [(5, 2), (6, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-9280700033883520 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 1), (9, 3), (16, 1)],
  term ((18561400067767040 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 2), (9, 1), (16, 1)],
  term ((-9280700033883520 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 3), (9, 1), (16, 1)],
  term ((9280700033883520 : Rat) / 17966088315235317) [(5, 2), (7, 3), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0102_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0102
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0103 : Poly :=
[
  term ((-41763150152475840 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 103 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0103 : Poly :=
[
  term ((83526300304951680 : Rat) / 5988696105078439) [(5, 2), (6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-41763150152475840 : Rat) / 5988696105078439) [(5, 2), (6, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-83526300304951680 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((41763150152475840 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((41763150152475840 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 3), (10, 1), (16, 1)],
  term ((-41763150152475840 : Rat) / 5988696105078439) [(5, 2), (7, 3), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0103_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0103
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0104 : Poly :=
[
  term ((-85846475313422560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 104 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0104 : Poly :=
[
  term ((171692950626845120 : Rat) / 17966088315235317) [(5, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-85846475313422560 : Rat) / 17966088315235317) [(5, 2), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-171692950626845120 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((85846475313422560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 2), (9, 1), (16, 1)],
  term ((85846475313422560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (16, 1)],
  term ((-85846475313422560 : Rat) / 17966088315235317) [(5, 2), (7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0104_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0104
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0105 : Poly :=
[
  term ((3315553035831858176 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 105 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0105 : Poly :=
[
  term ((-6631106071663716352 : Rat) / 269491324728529755) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((3315553035831858176 : Rat) / 269491324728529755) [(5, 2), (6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((3315553035831858176 : Rat) / 269491324728529755) [(5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3315553035831858176 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 3), (11, 1), (16, 1)],
  term ((6631106071663716352 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-3315553035831858176 : Rat) / 269491324728529755) [(5, 2), (8, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0105_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0105
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0106 : Poly :=
[
  term ((-5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 106 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0106 : Poly :=
[
  term ((10975477289790720256 : Rat) / 89830441576176585) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (6, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (7, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 3), (13, 1), (16, 1)],
  term ((-10975477289790720256 : Rat) / 89830441576176585) [(5, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (8, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0106_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0106
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0107 : Poly :=
[
  term ((5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0107 : Poly :=
[
  term ((-10975477289790720256 : Rat) / 89830441576176585) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((10975477289790720256 : Rat) / 89830441576176585) [(5, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (8, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0107_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0107
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0108 : Poly :=
[
  term ((-1793305900789760 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 108 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0108 : Poly :=
[
  term ((3586611801579520 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(5, 2), (6, 2), (8, 1), (9, 2), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(5, 2), (7, 2), (8, 1), (9, 2), (16, 1)],
  term ((1793305900789760 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 4), (16, 1)],
  term ((-3586611801579520 : Rat) / 53898264945705951) [(5, 2), (8, 2), (9, 2), (16, 1)],
  term ((1793305900789760 : Rat) / 53898264945705951) [(5, 2), (8, 3), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0108_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0108
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0109 : Poly :=
[
  term ((-5368203664041180424 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (16, 1)]
]

/-- Partial product 109 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0109 : Poly :=
[
  term ((10736407328082360848 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((-5368203664041180424 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (8, 1), (16, 1)],
  term ((-5368203664041180424 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (8, 1), (16, 1)],
  term ((5368203664041180424 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-10736407328082360848 : Rat) / 1347456623642648775) [(5, 2), (8, 2), (16, 1)],
  term ((5368203664041180424 : Rat) / 1347456623642648775) [(5, 2), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0109_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0109
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0110 : Poly :=
[
  term ((36898230534054400 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 110 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0110 : Poly :=
[
  term ((-73796461068108800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((36898230534054400 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((36898230534054400 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((73796461068108800 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-36898230534054400 : Rat) / 53898264945705951) [(5, 2), (8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-36898230534054400 : Rat) / 53898264945705951) [(5, 2), (9, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0110_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0110
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0111 : Poly :=
[
  term ((974074520191826944 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 111 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0111 : Poly :=
[
  term ((-1948149040383653888 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((974074520191826944 : Rat) / 89830441576176585) [(5, 2), (6, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((974074520191826944 : Rat) / 89830441576176585) [(5, 2), (7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((1948149040383653888 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-974074520191826944 : Rat) / 89830441576176585) [(5, 2), (8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-974074520191826944 : Rat) / 89830441576176585) [(5, 2), (9, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0111_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0111
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0112 : Poly :=
[
  term ((-72458848675759744 : Rat) / 17966088315235317) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0112 : Poly :=
[
  term ((144917697351519488 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-72458848675759744 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-72458848675759744 : Rat) / 17966088315235317) [(5, 2), (7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-144917697351519488 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((72458848675759744 : Rat) / 17966088315235317) [(5, 2), (8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((72458848675759744 : Rat) / 17966088315235317) [(5, 2), (9, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0112_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0112
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0113 : Poly :=
[
  term ((-925683306859862336 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 113 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0113 : Poly :=
[
  term ((1851366613719724672 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-925683306859862336 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-925683306859862336 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1851366613719724672 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((925683306859862336 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((925683306859862336 : Rat) / 269491324728529755) [(5, 2), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0113_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0113
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0114 : Poly :=
[
  term ((11349021129378815168 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 114 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0114 : Poly :=
[
  term ((-22698042258757630336 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((11349021129378815168 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((11349021129378815168 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((22698042258757630336 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-11349021129378815168 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-11349021129378815168 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0114_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0114
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0115 : Poly :=
[
  term ((55129092911554816 : Rat) / 89830441576176585) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0115 : Poly :=
[
  term ((-110258185823109632 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((55129092911554816 : Rat) / 89830441576176585) [(5, 2), (6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((55129092911554816 : Rat) / 89830441576176585) [(5, 2), (7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((110258185823109632 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(5, 2), (8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(5, 2), (9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0115_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0115
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0116 : Poly :=
[
  term ((-14699492618433702464 : Rat) / 269491324728529755) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0116 : Poly :=
[
  term ((29398985236867404928 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-14699492618433702464 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-14699492618433702464 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-29398985236867404928 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((14699492618433702464 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((14699492618433702464 : Rat) / 269491324728529755) [(5, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0116_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0116
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0117 : Poly :=
[
  term ((-3730250121335358976 : Rat) / 269491324728529755) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 117 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0117 : Poly :=
[
  term ((7460500242670717952 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((-3730250121335358976 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 2), (10, 1), (16, 1)],
  term ((-3730250121335358976 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((-7460500242670717952 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((3730250121335358976 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 2), (10, 1), (16, 1)],
  term ((3730250121335358976 : Rat) / 269491324728529755) [(5, 2), (9, 4), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0117_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0117
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0118 : Poly :=
[
  term ((1317021422778880 : Rat) / 5988696105078439) [(5, 2), (9, 2), (16, 1)]
]

/-- Partial product 118 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0118 : Poly :=
[
  term ((-2634042845557760 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (16, 1)],
  term ((1317021422778880 : Rat) / 5988696105078439) [(5, 2), (6, 2), (9, 2), (16, 1)],
  term ((1317021422778880 : Rat) / 5988696105078439) [(5, 2), (7, 2), (9, 2), (16, 1)],
  term ((2634042845557760 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-1317021422778880 : Rat) / 5988696105078439) [(5, 2), (8, 2), (9, 2), (16, 1)],
  term ((-1317021422778880 : Rat) / 5988696105078439) [(5, 2), (9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0118_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0118
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0119 : Poly :=
[
  term ((26276096541250489904 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (16, 1)]
]

/-- Partial product 119 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0119 : Poly :=
[
  term ((-52552193082500979808 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (10, 1), (16, 1)],
  term ((26276096541250489904 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (10, 1), (16, 1)],
  term ((26276096541250489904 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (10, 1), (16, 1)],
  term ((52552193082500979808 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (10, 1), (16, 1)],
  term ((-26276096541250489904 : Rat) / 1347456623642648775) [(5, 2), (8, 2), (10, 1), (16, 1)],
  term ((-26276096541250489904 : Rat) / 1347456623642648775) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0119_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0119
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0120 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 2), (14, 1), (16, 1)]
]

/-- Partial product 120 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0120 : Poly :=
[
  term ((7588117570459953920 : Rat) / 53898264945705951) [(5, 2), (6, 1), (14, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 2), (6, 2), (14, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 2), (7, 2), (14, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(5, 2), (8, 1), (14, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 2), (8, 2), (14, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 2), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0120_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0120
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0121 : Poly :=
[
  term ((81030190209793316386 : Rat) / 1347456623642648775) [(5, 2), (16, 1)]
]

/-- Partial product 121 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0121 : Poly :=
[
  term ((-162060380419586632772 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (16, 1)],
  term ((81030190209793316386 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (16, 1)],
  term ((81030190209793316386 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (16, 1)],
  term ((162060380419586632772 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (16, 1)],
  term ((-81030190209793316386 : Rat) / 1347456623642648775) [(5, 2), (8, 2), (16, 1)],
  term ((-81030190209793316386 : Rat) / 1347456623642648775) [(5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0121_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0121
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0122 : Poly :=
[
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 122 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0122 : Poly :=
[
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (7, 2), (9, 1), (16, 1)],
  term ((-352666601287573760 : Rat) / 17966088315235317) [(5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (8, 2), (9, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (9, 3), (16, 1)],
  term ((352666601287573760 : Rat) / 17966088315235317) [(5, 3), (6, 2), (9, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0122_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0122
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0123 : Poly :=
[
  term ((7658156114314807552 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 123 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0123 : Poly :=
[
  term ((-15316312228629615104 : Rat) / 269491324728529755) [(5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((7658156114314807552 : Rat) / 269491324728529755) [(5, 3), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((7658156114314807552 : Rat) / 269491324728529755) [(5, 3), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((-7658156114314807552 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 3), (16, 1)],
  term ((15316312228629615104 : Rat) / 269491324728529755) [(5, 3), (8, 2), (9, 1), (16, 1)],
  term ((-7658156114314807552 : Rat) / 269491324728529755) [(5, 3), (8, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0123_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0123
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0124 : Poly :=
[
  term ((-7399163868509422592 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 124 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0124 : Poly :=
[
  term ((14798327737018845184 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-7399163868509422592 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((-7399163868509422592 : Rat) / 269491324728529755) [(5, 3), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((-14798327737018845184 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((7399163868509422592 : Rat) / 269491324728529755) [(5, 3), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((7399163868509422592 : Rat) / 269491324728529755) [(5, 3), (9, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0124_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0124
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0125 : Poly :=
[
  term ((3154804842265748672 : Rat) / 269491324728529755) [(5, 3), (9, 1), (16, 1)]
]

/-- Partial product 125 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0125 : Poly :=
[
  term ((-6309609684531497344 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (16, 1)],
  term ((3154804842265748672 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (16, 1)],
  term ((3154804842265748672 : Rat) / 269491324728529755) [(5, 3), (7, 2), (9, 1), (16, 1)],
  term ((6309609684531497344 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (16, 1)],
  term ((-3154804842265748672 : Rat) / 269491324728529755) [(5, 3), (8, 2), (9, 1), (16, 1)],
  term ((-3154804842265748672 : Rat) / 269491324728529755) [(5, 3), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0125_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0125
        rs_R010_ueqv_R010YNN_generator_03_0100_0125 =
      rs_R010_ueqv_R010YNN_partial_03_0125 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_03_0100_0125 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_03_0100,
  rs_R010_ueqv_R010YNN_partial_03_0101,
  rs_R010_ueqv_R010YNN_partial_03_0102,
  rs_R010_ueqv_R010YNN_partial_03_0103,
  rs_R010_ueqv_R010YNN_partial_03_0104,
  rs_R010_ueqv_R010YNN_partial_03_0105,
  rs_R010_ueqv_R010YNN_partial_03_0106,
  rs_R010_ueqv_R010YNN_partial_03_0107,
  rs_R010_ueqv_R010YNN_partial_03_0108,
  rs_R010_ueqv_R010YNN_partial_03_0109,
  rs_R010_ueqv_R010YNN_partial_03_0110,
  rs_R010_ueqv_R010YNN_partial_03_0111,
  rs_R010_ueqv_R010YNN_partial_03_0112,
  rs_R010_ueqv_R010YNN_partial_03_0113,
  rs_R010_ueqv_R010YNN_partial_03_0114,
  rs_R010_ueqv_R010YNN_partial_03_0115,
  rs_R010_ueqv_R010YNN_partial_03_0116,
  rs_R010_ueqv_R010YNN_partial_03_0117,
  rs_R010_ueqv_R010YNN_partial_03_0118,
  rs_R010_ueqv_R010YNN_partial_03_0119,
  rs_R010_ueqv_R010YNN_partial_03_0120,
  rs_R010_ueqv_R010YNN_partial_03_0121,
  rs_R010_ueqv_R010YNN_partial_03_0122,
  rs_R010_ueqv_R010YNN_partial_03_0123,
  rs_R010_ueqv_R010YNN_partial_03_0124,
  rs_R010_ueqv_R010YNN_partial_03_0125
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_03_0100_0125 : Poly :=
[
  term ((-18561400067767040 : Rat) / 17966088315235317) [(5, 2), (6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((83526300304951680 : Rat) / 5988696105078439) [(5, 2), (6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((171692950626845120 : Rat) / 17966088315235317) [(5, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-9280700033883520 : Rat) / 17966088315235317) [(5, 2), (6, 1), (7, 2), (9, 2), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (7, 2), (16, 1)],
  term ((-6631106071663716352 : Rat) / 269491324728529755) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((10975477289790720256 : Rat) / 89830441576176585) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-10975477289790720256 : Rat) / 89830441576176585) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-52097588401721600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((-6960228773430679784 : Rat) / 449152207880882925) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((9280700033883520 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 2), (9, 2), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 2), (16, 1)],
  term ((-73796461068108800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1948149040383653888 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((144917697351519488 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1851366613719724672 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-22698042258757630336 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-110258185823109632 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((29398985236867404928 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((7460500242670717952 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((608635487357468164 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (16, 1)],
  term ((9280700033883520 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 4), (16, 1)],
  term ((-52552193082500979808 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (10, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(5, 2), (6, 1), (14, 1), (16, 1)],
  term ((-162060380419586632772 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (16, 1)],
  term ((9280700033883520 : Rat) / 17966088315235317) [(5, 2), (6, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-41763150152475840 : Rat) / 5988696105078439) [(5, 2), (6, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-85846475313422560 : Rat) / 17966088315235317) [(5, 2), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((3315553035831858176 : Rat) / 269491324728529755) [(5, 2), (6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (6, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(5, 2), (6, 2), (8, 1), (9, 2), (16, 1)],
  term ((-5368203664041180424 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (8, 1), (16, 1)],
  term ((36898230534054400 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((974074520191826944 : Rat) / 89830441576176585) [(5, 2), (6, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-72458848675759744 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-925683306859862336 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((11349021129378815168 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((55129092911554816 : Rat) / 89830441576176585) [(5, 2), (6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14699492618433702464 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3730250121335358976 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 2), (10, 1), (16, 1)],
  term ((22512464336103680 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 2), (16, 1)],
  term ((26276096541250489904 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (10, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 2), (6, 2), (14, 1), (16, 1)],
  term ((37549094619389238862 : Rat) / 449152207880882925) [(5, 2), (6, 2), (16, 1)],
  term ((-9280700033883520 : Rat) / 17966088315235317) [(5, 2), (6, 3), (9, 2), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 3), (16, 1)],
  term ((-83526300304951680 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-171692950626845120 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-9280700033883520 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 1), (9, 3), (16, 1)],
  term ((41763150152475840 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((34802625127063200 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 2), (9, 1), (16, 1)],
  term ((-9280700033883520 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 3), (9, 1), (16, 1)],
  term ((41763150152475840 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 3), (10, 1), (16, 1)],
  term ((85846475313422560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (16, 1)],
  term ((3315553035831858176 : Rat) / 269491324728529755) [(5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (7, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(5, 2), (7, 2), (8, 1), (9, 2), (16, 1)],
  term ((-5368203664041180424 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (8, 1), (16, 1)],
  term ((36898230534054400 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((974074520191826944 : Rat) / 89830441576176585) [(5, 2), (7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-72458848675759744 : Rat) / 17966088315235317) [(5, 2), (7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-925683306859862336 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((11349021129378815168 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((55129092911554816 : Rat) / 89830441576176585) [(5, 2), (7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14699492618433702464 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3730250121335358976 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((1317021422778880 : Rat) / 5988696105078439) [(5, 2), (7, 2), (9, 2), (16, 1)],
  term ((26276096541250489904 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (10, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 2), (7, 2), (14, 1), (16, 1)],
  term ((81030190209793316386 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (16, 1)],
  term ((9280700033883520 : Rat) / 17966088315235317) [(5, 2), (7, 3), (8, 1), (9, 1), (16, 1)],
  term ((-41763150152475840 : Rat) / 5988696105078439) [(5, 2), (7, 3), (9, 1), (10, 1), (16, 1)],
  term ((-85846475313422560 : Rat) / 17966088315235317) [(5, 2), (7, 3), (9, 1), (16, 1)],
  term ((73796461068108800 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((1948149040383653888 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-144917697351519488 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1851366613719724672 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((22698042258757630336 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((110258185823109632 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-29398985236867404928 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-7460500242670717952 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((5960863304291676424 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-3315553035831858176 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 3), (11, 1), (16, 1)],
  term ((5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 3), (13, 1), (16, 1)],
  term ((-5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((1793305900789760 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 4), (16, 1)],
  term ((52552193082500979808 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (10, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(5, 2), (8, 1), (14, 1), (16, 1)],
  term ((162060380419586632772 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (16, 1)],
  term ((-36898230534054400 : Rat) / 53898264945705951) [(5, 2), (8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-974074520191826944 : Rat) / 89830441576176585) [(5, 2), (8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((72458848675759744 : Rat) / 17966088315235317) [(5, 2), (8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((839643264280397632 : Rat) / 29943480525392195) [(5, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-44275452998750975936 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(5, 2), (8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((47625924487805863232 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((3730250121335358976 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 2), (10, 1), (16, 1)],
  term ((-15439804606589440 : Rat) / 53898264945705951) [(5, 2), (8, 2), (9, 2), (16, 1)],
  term ((-26276096541250489904 : Rat) / 1347456623642648775) [(5, 2), (8, 2), (10, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 2), (8, 2), (14, 1), (16, 1)],
  term ((-30588865845958559078 : Rat) / 449152207880882925) [(5, 2), (8, 2), (16, 1)],
  term ((-3315553035831858176 : Rat) / 269491324728529755) [(5, 2), (8, 3), (9, 1), (11, 1), (16, 1)],
  term ((5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (8, 3), (9, 1), (13, 1), (16, 1)],
  term ((-5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (8, 3), (9, 1), (15, 1), (16, 1)],
  term ((1793305900789760 : Rat) / 53898264945705951) [(5, 2), (8, 3), (9, 2), (16, 1)],
  term ((5368203664041180424 : Rat) / 1347456623642648775) [(5, 2), (8, 3), (16, 1)],
  term ((-26276096541250489904 : Rat) / 1347456623642648775) [(5, 2), (9, 2), (10, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-81030190209793316386 : Rat) / 1347456623642648775) [(5, 2), (9, 2), (16, 1)],
  term ((-36898230534054400 : Rat) / 53898264945705951) [(5, 2), (9, 3), (10, 1), (11, 1), (16, 1)],
  term ((-974074520191826944 : Rat) / 89830441576176585) [(5, 2), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((72458848675759744 : Rat) / 17966088315235317) [(5, 2), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((925683306859862336 : Rat) / 269491324728529755) [(5, 2), (9, 3), (11, 1), (16, 1)],
  term ((-11349021129378815168 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(5, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((14699492618433702464 : Rat) / 269491324728529755) [(5, 2), (9, 3), (15, 1), (16, 1)],
  term ((3730250121335358976 : Rat) / 269491324728529755) [(5, 2), (9, 4), (10, 1), (16, 1)],
  term ((-1317021422778880 : Rat) / 5988696105078439) [(5, 2), (9, 4), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (7, 2), (9, 1), (16, 1)],
  term ((-20606311247943221504 : Rat) / 269491324728529755) [(5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (8, 2), (9, 1), (16, 1)],
  term ((14798327737018845184 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-6309609684531497344 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (9, 3), (16, 1)],
  term ((7658156114314807552 : Rat) / 269491324728529755) [(5, 3), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((-7399163868509422592 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((8444803861579355072 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 3), (9, 1), (16, 1)],
  term ((7658156114314807552 : Rat) / 269491324728529755) [(5, 3), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((-7399163868509422592 : Rat) / 269491324728529755) [(5, 3), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((3154804842265748672 : Rat) / 269491324728529755) [(5, 3), (7, 2), (9, 1), (16, 1)],
  term ((-14798327737018845184 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((6309609684531497344 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (16, 1)],
  term ((-7658156114314807552 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 3), (16, 1)],
  term ((7399163868509422592 : Rat) / 269491324728529755) [(5, 3), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((1351278598484874048 : Rat) / 29943480525392195) [(5, 3), (8, 2), (9, 1), (16, 1)],
  term ((-7658156114314807552 : Rat) / 269491324728529755) [(5, 3), (8, 3), (9, 1), (16, 1)],
  term ((7399163868509422592 : Rat) / 269491324728529755) [(5, 3), (9, 3), (10, 1), (16, 1)],
  term ((-3154804842265748672 : Rat) / 269491324728529755) [(5, 3), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 100 through 125. -/
theorem rs_R010_ueqv_R010YNN_block_03_0100_0125_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_03_0100_0125
      rs_R010_ueqv_R010YNN_block_03_0100_0125 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
