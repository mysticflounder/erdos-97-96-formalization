/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 4:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 4 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_04_0200_0299 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0200 : Poly :=
[
  term ((-9804632578437567841456653019415000496 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 200 for generator 4. -/
def ep_Q2_019_partial_04_0200 : Poly :=
[
  term ((-9804632578437567841456653019415000496 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (7, 1), (8, 1), (16, 1)],
  term ((9804632578437567841456653019415000496 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (8, 1), (10, 2), (16, 1)],
  term ((9804632578437567841456653019415000496 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (8, 1), (11, 2), (16, 1)],
  term ((-9804632578437567841456653019415000496 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 4. -/
theorem ep_Q2_019_partial_04_0200_valid :
    mulPoly ep_Q2_019_coefficient_04_0200
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0201 : Poly :=
[
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 4. -/
def ep_Q2_019_partial_04_0201 : Poly :=
[
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 4. -/
theorem ep_Q2_019_partial_04_0201_valid :
    mulPoly ep_Q2_019_coefficient_04_0201
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0202 : Poly :=
[
  term ((-573916245560474883369761083108967184 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 4. -/
def ep_Q2_019_partial_04_0202 : Poly :=
[
  term ((-573916245560474883369761083108967184 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((573916245560474883369761083108967184 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((573916245560474883369761083108967184 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((-573916245560474883369761083108967184 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 4. -/
theorem ep_Q2_019_partial_04_0202_valid :
    mulPoly ep_Q2_019_coefficient_04_0202
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0203 : Poly :=
[
  term ((9315154904289895302280973647207632 : Rat) / 894241638896928502822456059496668245) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 203 for generator 4. -/
def ep_Q2_019_partial_04_0203 : Poly :=
[
  term ((9315154904289895302280973647207632 : Rat) / 894241638896928502822456059496668245) [(2, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-9315154904289895302280973647207632 : Rat) / 894241638896928502822456059496668245) [(3, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((-9315154904289895302280973647207632 : Rat) / 894241638896928502822456059496668245) [(3, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((9315154904289895302280973647207632 : Rat) / 894241638896928502822456059496668245) [(3, 3), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 4. -/
theorem ep_Q2_019_partial_04_0203_valid :
    mulPoly ep_Q2_019_coefficient_04_0203
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0204 : Poly :=
[
  term ((28793191771474083481052951094796000248 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 204 for generator 4. -/
def ep_Q2_019_partial_04_0204 : Poly :=
[
  term ((28793191771474083481052951094796000248 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((-28793191771474083481052951094796000248 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 2), (14, 1), (16, 1)],
  term ((-28793191771474083481052951094796000248 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((28793191771474083481052951094796000248 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 4. -/
theorem ep_Q2_019_partial_04_0204_valid :
    mulPoly ep_Q2_019_coefficient_04_0204
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0205 : Poly :=
[
  term ((-1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 205 for generator 4. -/
def ep_Q2_019_partial_04_0205 : Poly :=
[
  term ((-1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 2), (15, 2), (16, 1)],
  term ((1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((-1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 4. -/
theorem ep_Q2_019_partial_04_0205_valid :
    mulPoly ep_Q2_019_coefficient_04_0205
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0206 : Poly :=
[
  term ((4860043377503485332868277937744743664 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 206 for generator 4. -/
def ep_Q2_019_partial_04_0206 : Poly :=
[
  term ((4860043377503485332868277937744743664 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((-4860043377503485332868277937744743664 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term ((-4860043377503485332868277937744743664 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((4860043377503485332868277937744743664 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 4. -/
theorem ep_Q2_019_partial_04_0206_valid :
    mulPoly ep_Q2_019_coefficient_04_0206
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0207 : Poly :=
[
  term ((1010107648084738385981821810525088208 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 207 for generator 4. -/
def ep_Q2_019_partial_04_0207 : Poly :=
[
  term ((1010107648084738385981821810525088208 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1010107648084738385981821810525088208 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-1010107648084738385981821810525088208 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((1010107648084738385981821810525088208 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 4. -/
theorem ep_Q2_019_partial_04_0207_valid :
    mulPoly ep_Q2_019_coefficient_04_0207
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0208 : Poly :=
[
  term ((-382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 4. -/
def ep_Q2_019_partial_04_0208 : Poly :=
[
  term ((-382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (8, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 4. -/
theorem ep_Q2_019_partial_04_0208_valid :
    mulPoly ep_Q2_019_coefficient_04_0208
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0209 : Poly :=
[
  term ((-18387200912138544292869573064636832455642 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 4. -/
def ep_Q2_019_partial_04_0209 : Poly :=
[
  term ((-18387200912138544292869573064636832455642 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((18387200912138544292869573064636832455642 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((18387200912138544292869573064636832455642 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-18387200912138544292869573064636832455642 : Rat) / 1708895771932030368893713529698133016195) [(3, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 4. -/
theorem ep_Q2_019_partial_04_0209_valid :
    mulPoly ep_Q2_019_coefficient_04_0209
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0210 : Poly :=
[
  term ((191305415186824961123253694369655728 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 4. -/
def ep_Q2_019_partial_04_0210 : Poly :=
[
  term ((191305415186824961123253694369655728 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-191305415186824961123253694369655728 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-191305415186824961123253694369655728 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((191305415186824961123253694369655728 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 4. -/
theorem ep_Q2_019_partial_04_0210_valid :
    mulPoly ep_Q2_019_coefficient_04_0210
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0211 : Poly :=
[
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 4. -/
def ep_Q2_019_partial_04_0211 : Poly :=
[
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 4. -/
theorem ep_Q2_019_partial_04_0211_valid :
    mulPoly ep_Q2_019_coefficient_04_0211
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0212 : Poly :=
[
  term ((466208429556846494984843489154572948872 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 212 for generator 4. -/
def ep_Q2_019_partial_04_0212 : Poly :=
[
  term ((466208429556846494984843489154572948872 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-466208429556846494984843489154572948872 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-466208429556846494984843489154572948872 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((466208429556846494984843489154572948872 : Rat) / 43817840305949496638300346915336744005) [(3, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 4. -/
theorem ep_Q2_019_partial_04_0212_valid :
    mulPoly ep_Q2_019_coefficient_04_0212
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0213 : Poly :=
[
  term ((-26705870866667547961860648240560373789704 : Rat) / 394360562753545469744703122238030696045) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 213 for generator 4. -/
def ep_Q2_019_partial_04_0213 : Poly :=
[
  term ((-26705870866667547961860648240560373789704 : Rat) / 394360562753545469744703122238030696045) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((26705870866667547961860648240560373789704 : Rat) / 394360562753545469744703122238030696045) [(3, 1), (9, 1), (10, 2), (16, 1)],
  term ((26705870866667547961860648240560373789704 : Rat) / 394360562753545469744703122238030696045) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term ((-26705870866667547961860648240560373789704 : Rat) / 394360562753545469744703122238030696045) [(3, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 4. -/
theorem ep_Q2_019_partial_04_0213_valid :
    mulPoly ep_Q2_019_coefficient_04_0213
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0214 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 214 for generator 4. -/
def ep_Q2_019_partial_04_0214 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (3, 1), (9, 2), (13, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 3), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 4. -/
theorem ep_Q2_019_partial_04_0214_valid :
    mulPoly ep_Q2_019_coefficient_04_0214
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0215 : Poly :=
[
  term ((-932416859113692989969686978309145897744 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 215 for generator 4. -/
def ep_Q2_019_partial_04_0215 : Poly :=
[
  term ((-932416859113692989969686978309145897744 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((932416859113692989969686978309145897744 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((932416859113692989969686978309145897744 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-932416859113692989969686978309145897744 : Rat) / 43817840305949496638300346915336744005) [(3, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 4. -/
theorem ep_Q2_019_partial_04_0215_valid :
    mulPoly ep_Q2_019_coefficient_04_0215
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0216 : Poly :=
[
  term ((-1000217439528594664314703441079945904 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 216 for generator 4. -/
def ep_Q2_019_partial_04_0216 : Poly :=
[
  term ((-1000217439528594664314703441079945904 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((1000217439528594664314703441079945904 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((1000217439528594664314703441079945904 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1000217439528594664314703441079945904 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 4. -/
theorem ep_Q2_019_partial_04_0216_valid :
    mulPoly ep_Q2_019_coefficient_04_0216
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0217 : Poly :=
[
  term ((-3624606428079699397067137641332393712 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 217 for generator 4. -/
def ep_Q2_019_partial_04_0217 : Poly :=
[
  term ((-3624606428079699397067137641332393712 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((3624606428079699397067137641332393712 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((3624606428079699397067137641332393712 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3624606428079699397067137641332393712 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 4. -/
theorem ep_Q2_019_partial_04_0217_valid :
    mulPoly ep_Q2_019_coefficient_04_0217
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0218 : Poly :=
[
  term ((-7824480730605323547908336959187972544 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 218 for generator 4. -/
def ep_Q2_019_partial_04_0218 : Poly :=
[
  term ((-7824480730605323547908336959187972544 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((7824480730605323547908336959187972544 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (10, 2), (13, 1), (16, 1)],
  term ((7824480730605323547908336959187972544 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (11, 2), (13, 1), (16, 1)],
  term ((-7824480730605323547908336959187972544 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 4. -/
theorem ep_Q2_019_partial_04_0218_valid :
    mulPoly ep_Q2_019_coefficient_04_0218
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0219 : Poly :=
[
  term ((729886599087188114873903445858307518194 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 4. -/
def ep_Q2_019_partial_04_0219 : Poly :=
[
  term ((729886599087188114873903445858307518194 : Rat) / 341779154386406073778742705939626603239) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-729886599087188114873903445858307518194 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-729886599087188114873903445858307518194 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((729886599087188114873903445858307518194 : Rat) / 341779154386406073778742705939626603239) [(3, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 4. -/
theorem ep_Q2_019_partial_04_0219_valid :
    mulPoly ep_Q2_019_coefficient_04_0219
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0220 : Poly :=
[
  term ((17225880709748960867832221930775874455748 : Rat) / 394360562753545469744703122238030696045) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 4. -/
def ep_Q2_019_partial_04_0220 : Poly :=
[
  term ((17225880709748960867832221930775874455748 : Rat) / 394360562753545469744703122238030696045) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-17225880709748960867832221930775874455748 : Rat) / 394360562753545469744703122238030696045) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-17225880709748960867832221930775874455748 : Rat) / 394360562753545469744703122238030696045) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((17225880709748960867832221930775874455748 : Rat) / 394360562753545469744703122238030696045) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 4. -/
theorem ep_Q2_019_partial_04_0220_valid :
    mulPoly ep_Q2_019_coefficient_04_0220
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0221 : Poly :=
[
  term ((89477526847703900422241592590863680 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (16, 1)]
]

/-- Partial product 221 for generator 4. -/
def ep_Q2_019_partial_04_0221 : Poly :=
[
  term ((89477526847703900422241592590863680 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (3, 2), (16, 1)],
  term ((-89477526847703900422241592590863680 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (10, 2), (16, 1)],
  term ((-89477526847703900422241592590863680 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (11, 2), (16, 1)],
  term ((89477526847703900422241592590863680 : Rat) / 1251938294455699903951438483295335543) [(3, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 4. -/
theorem ep_Q2_019_partial_04_0221_valid :
    mulPoly ep_Q2_019_coefficient_04_0221
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0222 : Poly :=
[
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (8, 1), (16, 1)]
]

/-- Partial product 222 for generator 4. -/
def ep_Q2_019_partial_04_0222 : Poly :=
[
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (6, 1), (8, 1), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (6, 1), (8, 1), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (8, 1), (10, 2), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 4. -/
theorem ep_Q2_019_partial_04_0222_valid :
    mulPoly ep_Q2_019_coefficient_04_0222
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0223 : Poly :=
[
  term ((-27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (12, 1), (16, 1)]
]

/-- Partial product 223 for generator 4. -/
def ep_Q2_019_partial_04_0223 : Poly :=
[
  term ((-27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (10, 2), (12, 1), (16, 1)],
  term ((27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 4. -/
theorem ep_Q2_019_partial_04_0223_valid :
    mulPoly ep_Q2_019_coefficient_04_0223
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0224 : Poly :=
[
  term ((1505270298956820803558876204370350496 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 224 for generator 4. -/
def ep_Q2_019_partial_04_0224 : Poly :=
[
  term ((1505270298956820803558876204370350496 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (4, 1), (6, 1), (16, 1)],
  term ((1505270298956820803558876204370350496 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((-1505270298956820803558876204370350496 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (6, 1), (10, 2), (16, 1)],
  term ((-1505270298956820803558876204370350496 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 4. -/
theorem ep_Q2_019_partial_04_0224_valid :
    mulPoly ep_Q2_019_coefficient_04_0224
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0225 : Poly :=
[
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 2), (16, 1)]
]

/-- Partial product 225 for generator 4. -/
def ep_Q2_019_partial_04_0225 : Poly :=
[
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (6, 2), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (6, 2), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 2), (10, 2), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 4. -/
theorem ep_Q2_019_partial_04_0225_valid :
    mulPoly ep_Q2_019_coefficient_04_0225
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0226 : Poly :=
[
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 226 for generator 4. -/
def ep_Q2_019_partial_04_0226 : Poly :=
[
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (8, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 4. -/
theorem ep_Q2_019_partial_04_0226_valid :
    mulPoly ep_Q2_019_coefficient_04_0226
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0227 : Poly :=
[
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 227 for generator 4. -/
def ep_Q2_019_partial_04_0227 : Poly :=
[
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 4. -/
theorem ep_Q2_019_partial_04_0227_valid :
    mulPoly ep_Q2_019_coefficient_04_0227
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0228 : Poly :=
[
  term ((-410264865169737733558741537211191776 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 228 for generator 4. -/
def ep_Q2_019_partial_04_0228 : Poly :=
[
  term ((-410264865169737733558741537211191776 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-410264865169737733558741537211191776 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((410264865169737733558741537211191776 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((410264865169737733558741537211191776 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 4. -/
theorem ep_Q2_019_partial_04_0228_valid :
    mulPoly ep_Q2_019_coefficient_04_0228
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0229 : Poly :=
[
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 229 for generator 4. -/
def ep_Q2_019_partial_04_0229 : Poly :=
[
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(3, 2), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(4, 1), (7, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(4, 1), (7, 1), (11, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 4. -/
theorem ep_Q2_019_partial_04_0229_valid :
    mulPoly ep_Q2_019_coefficient_04_0229
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0230 : Poly :=
[
  term ((-1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 230 for generator 4. -/
def ep_Q2_019_partial_04_0230 : Poly :=
[
  term ((-1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 4. -/
theorem ep_Q2_019_partial_04_0230_valid :
    mulPoly ep_Q2_019_coefficient_04_0230
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0231 : Poly :=
[
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 231 for generator 4. -/
def ep_Q2_019_partial_04_0231 : Poly :=
[
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 4. -/
theorem ep_Q2_019_partial_04_0231_valid :
    mulPoly ep_Q2_019_coefficient_04_0231
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0232 : Poly :=
[
  term ((-2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 232 for generator 4. -/
def ep_Q2_019_partial_04_0232 : Poly :=
[
  term ((-2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 4. -/
theorem ep_Q2_019_partial_04_0232_valid :
    mulPoly ep_Q2_019_coefficient_04_0232
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0233 : Poly :=
[
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 233 for generator 4. -/
def ep_Q2_019_partial_04_0233 : Poly :=
[
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 4. -/
theorem ep_Q2_019_partial_04_0233_valid :
    mulPoly ep_Q2_019_coefficient_04_0233
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0234 : Poly :=
[
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 234 for generator 4. -/
def ep_Q2_019_partial_04_0234 : Poly :=
[
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 4. -/
theorem ep_Q2_019_partial_04_0234_valid :
    mulPoly ep_Q2_019_coefficient_04_0234
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0235 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 235 for generator 4. -/
def ep_Q2_019_partial_04_0235 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 4. -/
theorem ep_Q2_019_partial_04_0235_valid :
    mulPoly ep_Q2_019_coefficient_04_0235
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0236 : Poly :=
[
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 236 for generator 4. -/
def ep_Q2_019_partial_04_0236 : Poly :=
[
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 4. -/
theorem ep_Q2_019_partial_04_0236_valid :
    mulPoly ep_Q2_019_coefficient_04_0236
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0237 : Poly :=
[
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 237 for generator 4. -/
def ep_Q2_019_partial_04_0237 : Poly :=
[
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(2, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(3, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(4, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 4. -/
theorem ep_Q2_019_partial_04_0237_valid :
    mulPoly ep_Q2_019_coefficient_04_0237
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0238 : Poly :=
[
  term ((-3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 238 for generator 4. -/
def ep_Q2_019_partial_04_0238 : Poly :=
[
  term ((-3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (11, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 4. -/
theorem ep_Q2_019_partial_04_0238_valid :
    mulPoly ep_Q2_019_coefficient_04_0238
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0239 : Poly :=
[
  term ((3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 239 for generator 4. -/
def ep_Q2_019_partial_04_0239 : Poly :=
[
  term ((3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 4. -/
theorem ep_Q2_019_partial_04_0239_valid :
    mulPoly ep_Q2_019_coefficient_04_0239
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0240 : Poly :=
[
  term ((-35683764814755798798023298372763203676 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 240 for generator 4. -/
def ep_Q2_019_partial_04_0240 : Poly :=
[
  term ((-35683764814755798798023298372763203676 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (12, 1), (16, 1)],
  term ((-35683764814755798798023298372763203676 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (12, 1), (16, 1)],
  term ((35683764814755798798023298372763203676 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (10, 2), (12, 1), (16, 1)],
  term ((35683764814755798798023298372763203676 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 4. -/
theorem ep_Q2_019_partial_04_0240_valid :
    mulPoly ep_Q2_019_coefficient_04_0240
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0241 : Poly :=
[
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (12, 2), (16, 1)]
]

/-- Partial product 241 for generator 4. -/
def ep_Q2_019_partial_04_0241 : Poly :=
[
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (12, 2), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (12, 2), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (10, 2), (12, 2), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 4. -/
theorem ep_Q2_019_partial_04_0241_valid :
    mulPoly ep_Q2_019_coefficient_04_0241
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0242 : Poly :=
[
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 4. -/
def ep_Q2_019_partial_04_0242 : Poly :=
[
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 4. -/
theorem ep_Q2_019_partial_04_0242_valid :
    mulPoly ep_Q2_019_coefficient_04_0242
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0243 : Poly :=
[
  term ((4376158561810535824626576396919378944 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 243 for generator 4. -/
def ep_Q2_019_partial_04_0243 : Poly :=
[
  term ((4376158561810535824626576396919378944 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((4376158561810535824626576396919378944 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-4376158561810535824626576396919378944 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (10, 2), (15, 2), (16, 1)],
  term ((-4376158561810535824626576396919378944 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 4. -/
theorem ep_Q2_019_partial_04_0243_valid :
    mulPoly ep_Q2_019_coefficient_04_0243
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0244 : Poly :=
[
  term ((2431559956289628652852185222022496352 : Rat) / 894241638896928502822456059496668245) [(5, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 244 for generator 4. -/
def ep_Q2_019_partial_04_0244 : Poly :=
[
  term ((2431559956289628652852185222022496352 : Rat) / 894241638896928502822456059496668245) [(2, 2), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((2431559956289628652852185222022496352 : Rat) / 894241638896928502822456059496668245) [(3, 2), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-2431559956289628652852185222022496352 : Rat) / 894241638896928502822456059496668245) [(5, 1), (6, 1), (7, 1), (10, 2), (16, 1)],
  term ((-2431559956289628652852185222022496352 : Rat) / 894241638896928502822456059496668245) [(5, 1), (6, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 4. -/
theorem ep_Q2_019_partial_04_0244_valid :
    mulPoly ep_Q2_019_coefficient_04_0244
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0245 : Poly :=
[
  term ((-27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 245 for generator 4. -/
def ep_Q2_019_partial_04_0245 : Poly :=
[
  term ((-27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 4. -/
theorem ep_Q2_019_partial_04_0245_valid :
    mulPoly ep_Q2_019_coefficient_04_0245
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0246 : Poly :=
[
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 246 for generator 4. -/
def ep_Q2_019_partial_04_0246 : Poly :=
[
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (10, 2), (14, 1), (16, 1)],
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 4. -/
theorem ep_Q2_019_partial_04_0246_valid :
    mulPoly ep_Q2_019_coefficient_04_0246
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0247 : Poly :=
[
  term ((-13345278347609009892278413746132389872 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 247 for generator 4. -/
def ep_Q2_019_partial_04_0247 : Poly :=
[
  term ((-13345278347609009892278413746132389872 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-13345278347609009892278413746132389872 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((13345278347609009892278413746132389872 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (8, 1), (10, 2), (16, 1)],
  term ((13345278347609009892278413746132389872 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 4. -/
theorem ep_Q2_019_partial_04_0247_valid :
    mulPoly ep_Q2_019_coefficient_04_0247
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0248 : Poly :=
[
  term ((-35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 248 for generator 4. -/
def ep_Q2_019_partial_04_0248 : Poly :=
[
  term ((-35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 4. -/
theorem ep_Q2_019_partial_04_0248_valid :
    mulPoly ep_Q2_019_coefficient_04_0248
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0249 : Poly :=
[
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 249 for generator 4. -/
def ep_Q2_019_partial_04_0249 : Poly :=
[
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 4. -/
theorem ep_Q2_019_partial_04_0249_valid :
    mulPoly ep_Q2_019_coefficient_04_0249
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0250 : Poly :=
[
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 250 for generator 4. -/
def ep_Q2_019_partial_04_0250 : Poly :=
[
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (10, 2), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 4. -/
theorem ep_Q2_019_partial_04_0250_valid :
    mulPoly ep_Q2_019_coefficient_04_0250
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0251 : Poly :=
[
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 251 for generator 4. -/
def ep_Q2_019_partial_04_0251 : Poly :=
[
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (11, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 4. -/
theorem ep_Q2_019_partial_04_0251_valid :
    mulPoly ep_Q2_019_coefficient_04_0251
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0252 : Poly :=
[
  term ((-13866204368479731692965425989669235168 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 252 for generator 4. -/
def ep_Q2_019_partial_04_0252 : Poly :=
[
  term ((-13866204368479731692965425989669235168 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-13866204368479731692965425989669235168 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((13866204368479731692965425989669235168 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((13866204368479731692965425989669235168 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 4. -/
theorem ep_Q2_019_partial_04_0252_valid :
    mulPoly ep_Q2_019_coefficient_04_0252
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0253 : Poly :=
[
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (12, 2), (16, 1)]
]

/-- Partial product 253 for generator 4. -/
def ep_Q2_019_partial_04_0253 : Poly :=
[
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (10, 2), (12, 2), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 4. -/
theorem ep_Q2_019_partial_04_0253_valid :
    mulPoly ep_Q2_019_coefficient_04_0253
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0254 : Poly :=
[
  term ((-5584818468037008101156936404628957232 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 4. -/
def ep_Q2_019_partial_04_0254 : Poly :=
[
  term ((-5584818468037008101156936404628957232 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5584818468037008101156936404628957232 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((5584818468037008101156936404628957232 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((5584818468037008101156936404628957232 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 4. -/
theorem ep_Q2_019_partial_04_0254_valid :
    mulPoly ep_Q2_019_coefficient_04_0254
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0255 : Poly :=
[
  term ((-16931866703352741568151827564096528 : Rat) / 52602449346878147224850356440980485) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 255 for generator 4. -/
def ep_Q2_019_partial_04_0255 : Poly :=
[
  term ((-16931866703352741568151827564096528 : Rat) / 52602449346878147224850356440980485) [(2, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-16931866703352741568151827564096528 : Rat) / 52602449346878147224850356440980485) [(3, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((16931866703352741568151827564096528 : Rat) / 52602449346878147224850356440980485) [(5, 1), (7, 1), (10, 2), (14, 1), (16, 1)],
  term ((16931866703352741568151827564096528 : Rat) / 52602449346878147224850356440980485) [(5, 1), (7, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 4. -/
theorem ep_Q2_019_partial_04_0255_valid :
    mulPoly ep_Q2_019_coefficient_04_0255
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0256 : Poly :=
[
  term ((9504129148707444441432133251780648576 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 256 for generator 4. -/
def ep_Q2_019_partial_04_0256 : Poly :=
[
  term ((9504129148707444441432133251780648576 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((9504129148707444441432133251780648576 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-9504129148707444441432133251780648576 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (10, 2), (16, 1)],
  term ((-9504129148707444441432133251780648576 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 4. -/
theorem ep_Q2_019_partial_04_0256_valid :
    mulPoly ep_Q2_019_coefficient_04_0256
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0257 : Poly :=
[
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 257 for generator 4. -/
def ep_Q2_019_partial_04_0257 : Poly :=
[
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(2, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(3, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(5, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(5, 1), (8, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 4. -/
theorem ep_Q2_019_partial_04_0257_valid :
    mulPoly ep_Q2_019_coefficient_04_0257
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0258 : Poly :=
[
  term ((81645705846037162800854839053525624 : Rat) / 178848327779385700564491211899333649) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 258 for generator 4. -/
def ep_Q2_019_partial_04_0258 : Poly :=
[
  term ((81645705846037162800854839053525624 : Rat) / 178848327779385700564491211899333649) [(2, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((81645705846037162800854839053525624 : Rat) / 178848327779385700564491211899333649) [(3, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-81645705846037162800854839053525624 : Rat) / 178848327779385700564491211899333649) [(5, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-81645705846037162800854839053525624 : Rat) / 178848327779385700564491211899333649) [(5, 1), (8, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 4. -/
theorem ep_Q2_019_partial_04_0258_valid :
    mulPoly ep_Q2_019_coefficient_04_0258
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0259 : Poly :=
[
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 259 for generator 4. -/
def ep_Q2_019_partial_04_0259 : Poly :=
[
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 4. -/
theorem ep_Q2_019_partial_04_0259_valid :
    mulPoly ep_Q2_019_coefficient_04_0259
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0260 : Poly :=
[
  term ((35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 260 for generator 4. -/
def ep_Q2_019_partial_04_0260 : Poly :=
[
  term ((35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 4. -/
theorem ep_Q2_019_partial_04_0260_valid :
    mulPoly ep_Q2_019_coefficient_04_0260
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0261 : Poly :=
[
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 261 for generator 4. -/
def ep_Q2_019_partial_04_0261 : Poly :=
[
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 4. -/
theorem ep_Q2_019_partial_04_0261_valid :
    mulPoly ep_Q2_019_coefficient_04_0261
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0262 : Poly :=
[
  term ((-3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 262 for generator 4. -/
def ep_Q2_019_partial_04_0262 : Poly :=
[
  term ((-3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 4. -/
theorem ep_Q2_019_partial_04_0262_valid :
    mulPoly ep_Q2_019_coefficient_04_0262
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0263 : Poly :=
[
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 263 for generator 4. -/
def ep_Q2_019_partial_04_0263 : Poly :=
[
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 4. -/
theorem ep_Q2_019_partial_04_0263_valid :
    mulPoly ep_Q2_019_coefficient_04_0263
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0264 : Poly :=
[
  term ((-3272575449074510298212798342301802616 : Rat) / 894241638896928502822456059496668245) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 264 for generator 4. -/
def ep_Q2_019_partial_04_0264 : Poly :=
[
  term ((-3272575449074510298212798342301802616 : Rat) / 894241638896928502822456059496668245) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((-3272575449074510298212798342301802616 : Rat) / 894241638896928502822456059496668245) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((3272575449074510298212798342301802616 : Rat) / 894241638896928502822456059496668245) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((3272575449074510298212798342301802616 : Rat) / 894241638896928502822456059496668245) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 4. -/
theorem ep_Q2_019_partial_04_0264_valid :
    mulPoly ep_Q2_019_coefficient_04_0264
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0265 : Poly :=
[
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 265 for generator 4. -/
def ep_Q2_019_partial_04_0265 : Poly :=
[
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 4. -/
theorem ep_Q2_019_partial_04_0265_valid :
    mulPoly ep_Q2_019_coefficient_04_0265
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0266 : Poly :=
[
  term ((251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 266 for generator 4. -/
def ep_Q2_019_partial_04_0266 : Poly :=
[
  term ((251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 4. -/
theorem ep_Q2_019_partial_04_0266_valid :
    mulPoly ep_Q2_019_coefficient_04_0266
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0267 : Poly :=
[
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 267 for generator 4. -/
def ep_Q2_019_partial_04_0267 : Poly :=
[
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 4. -/
theorem ep_Q2_019_partial_04_0267_valid :
    mulPoly ep_Q2_019_coefficient_04_0267
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0268 : Poly :=
[
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 268 for generator 4. -/
def ep_Q2_019_partial_04_0268 : Poly :=
[
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(5, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 4. -/
theorem ep_Q2_019_partial_04_0268_valid :
    mulPoly ep_Q2_019_coefficient_04_0268
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0269 : Poly :=
[
  term ((666820162704000320312077988243631383030 : Rat) / 341779154386406073778742705939626603239) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 269 for generator 4. -/
def ep_Q2_019_partial_04_0269 : Poly :=
[
  term ((666820162704000320312077988243631383030 : Rat) / 341779154386406073778742705939626603239) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((666820162704000320312077988243631383030 : Rat) / 341779154386406073778742705939626603239) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-666820162704000320312077988243631383030 : Rat) / 341779154386406073778742705939626603239) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-666820162704000320312077988243631383030 : Rat) / 341779154386406073778742705939626603239) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 4. -/
theorem ep_Q2_019_partial_04_0269_valid :
    mulPoly ep_Q2_019_coefficient_04_0269
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0270 : Poly :=
[
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(5, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 4. -/
def ep_Q2_019_partial_04_0270 : Poly :=
[
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(5, 1), (10, 2), (12, 2), (15, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(5, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 4. -/
theorem ep_Q2_019_partial_04_0270_valid :
    mulPoly ep_Q2_019_coefficient_04_0270
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0271 : Poly :=
[
  term ((-3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 271 for generator 4. -/
def ep_Q2_019_partial_04_0271 : Poly :=
[
  term ((-3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(5, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(5, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 4. -/
theorem ep_Q2_019_partial_04_0271_valid :
    mulPoly ep_Q2_019_coefficient_04_0271
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0272 : Poly :=
[
  term ((11169636936074016202313872809257914464 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 272 for generator 4. -/
def ep_Q2_019_partial_04_0272 : Poly :=
[
  term ((11169636936074016202313872809257914464 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((11169636936074016202313872809257914464 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11169636936074016202313872809257914464 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-11169636936074016202313872809257914464 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 4. -/
theorem ep_Q2_019_partial_04_0272_valid :
    mulPoly ep_Q2_019_coefficient_04_0272
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0273 : Poly :=
[
  term ((-26034115154458527748114696640307503652 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 273 for generator 4. -/
def ep_Q2_019_partial_04_0273 : Poly :=
[
  term ((-26034115154458527748114696640307503652 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((-26034115154458527748114696640307503652 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((26034115154458527748114696640307503652 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 2), (13, 1), (16, 1)],
  term ((26034115154458527748114696640307503652 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 4. -/
theorem ep_Q2_019_partial_04_0273_valid :
    mulPoly ep_Q2_019_coefficient_04_0273
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0274 : Poly :=
[
  term ((33863733406705483136303655128193056 : Rat) / 52602449346878147224850356440980485) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 274 for generator 4. -/
def ep_Q2_019_partial_04_0274 : Poly :=
[
  term ((33863733406705483136303655128193056 : Rat) / 52602449346878147224850356440980485) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((33863733406705483136303655128193056 : Rat) / 52602449346878147224850356440980485) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33863733406705483136303655128193056 : Rat) / 52602449346878147224850356440980485) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-33863733406705483136303655128193056 : Rat) / 52602449346878147224850356440980485) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 4. -/
theorem ep_Q2_019_partial_04_0274_valid :
    mulPoly ep_Q2_019_coefficient_04_0274
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0275 : Poly :=
[
  term ((-3055913095762459514936008821905020549294 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 275 for generator 4. -/
def ep_Q2_019_partial_04_0275 : Poly :=
[
  term ((-3055913095762459514936008821905020549294 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-3055913095762459514936008821905020549294 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((3055913095762459514936008821905020549294 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((3055913095762459514936008821905020549294 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 4. -/
theorem ep_Q2_019_partial_04_0275_valid :
    mulPoly ep_Q2_019_coefficient_04_0275
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0276 : Poly :=
[
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 276 for generator 4. -/
def ep_Q2_019_partial_04_0276 : Poly :=
[
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 4. -/
theorem ep_Q2_019_partial_04_0276_valid :
    mulPoly ep_Q2_019_coefficient_04_0276
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0277 : Poly :=
[
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 277 for generator 4. -/
def ep_Q2_019_partial_04_0277 : Poly :=
[
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 4. -/
theorem ep_Q2_019_partial_04_0277_valid :
    mulPoly ep_Q2_019_coefficient_04_0277
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0278 : Poly :=
[
  term ((8286329723833936974787409744219127496 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 278 for generator 4. -/
def ep_Q2_019_partial_04_0278 : Poly :=
[
  term ((8286329723833936974787409744219127496 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((8286329723833936974787409744219127496 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-8286329723833936974787409744219127496 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-8286329723833936974787409744219127496 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 4. -/
theorem ep_Q2_019_partial_04_0278_valid :
    mulPoly ep_Q2_019_coefficient_04_0278
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0279 : Poly :=
[
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 279 for generator 4. -/
def ep_Q2_019_partial_04_0279 : Poly :=
[
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (6, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (6, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 2), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 4. -/
theorem ep_Q2_019_partial_04_0279_valid :
    mulPoly ep_Q2_019_coefficient_04_0279
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0280 : Poly :=
[
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 280 for generator 4. -/
def ep_Q2_019_partial_04_0280 : Poly :=
[
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 4. -/
theorem ep_Q2_019_partial_04_0280_valid :
    mulPoly ep_Q2_019_coefficient_04_0280
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0281 : Poly :=
[
  term ((183577727288056937147808518292128101976 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 281 for generator 4. -/
def ep_Q2_019_partial_04_0281 : Poly :=
[
  term ((183577727288056937147808518292128101976 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((183577727288056937147808518292128101976 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-183577727288056937147808518292128101976 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-183577727288056937147808518292128101976 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (7, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 4. -/
theorem ep_Q2_019_partial_04_0281_valid :
    mulPoly ep_Q2_019_coefficient_04_0281
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0282 : Poly :=
[
  term ((2187775307365005895608224162638321104 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 282 for generator 4. -/
def ep_Q2_019_partial_04_0282 : Poly :=
[
  term ((2187775307365005895608224162638321104 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((2187775307365005895608224162638321104 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2187775307365005895608224162638321104 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-2187775307365005895608224162638321104 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (7, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 4. -/
theorem ep_Q2_019_partial_04_0282_valid :
    mulPoly ep_Q2_019_coefficient_04_0282
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0283 : Poly :=
[
  term ((1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 283 for generator 4. -/
def ep_Q2_019_partial_04_0283 : Poly :=
[
  term ((1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 4. -/
theorem ep_Q2_019_partial_04_0283_valid :
    mulPoly ep_Q2_019_coefficient_04_0283
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0284 : Poly :=
[
  term ((-5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (7, 2), (16, 1)]
]

/-- Partial product 284 for generator 4. -/
def ep_Q2_019_partial_04_0284 : Poly :=
[
  term ((-5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 1), (7, 2), (16, 1)],
  term ((-5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 1), (7, 2), (16, 1)],
  term ((5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (7, 2), (10, 2), (16, 1)],
  term ((5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 4. -/
theorem ep_Q2_019_partial_04_0284_valid :
    mulPoly ep_Q2_019_coefficient_04_0284
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0285 : Poly :=
[
  term ((547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(6, 1), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 285 for generator 4. -/
def ep_Q2_019_partial_04_0285 : Poly :=
[
  term ((547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(2, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(3, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(6, 1), (8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(6, 1), (8, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 4. -/
theorem ep_Q2_019_partial_04_0285_valid :
    mulPoly ep_Q2_019_coefficient_04_0285
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0286 : Poly :=
[
  term ((-3142001084340142487209293910684920576 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 286 for generator 4. -/
def ep_Q2_019_partial_04_0286 : Poly :=
[
  term ((-3142001084340142487209293910684920576 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-3142001084340142487209293910684920576 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((3142001084340142487209293910684920576 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (10, 2), (14, 1), (16, 1)],
  term ((3142001084340142487209293910684920576 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 4. -/
theorem ep_Q2_019_partial_04_0286_valid :
    mulPoly ep_Q2_019_coefficient_04_0286
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0287 : Poly :=
[
  term ((-1703096035420750184163874725452437104 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 287 for generator 4. -/
def ep_Q2_019_partial_04_0287 : Poly :=
[
  term ((-1703096035420750184163874725452437104 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 1), (8, 1), (16, 1)],
  term ((-1703096035420750184163874725452437104 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 1), (8, 1), (16, 1)],
  term ((1703096035420750184163874725452437104 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (10, 2), (16, 1)],
  term ((1703096035420750184163874725452437104 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 4. -/
theorem ep_Q2_019_partial_04_0287_valid :
    mulPoly ep_Q2_019_coefficient_04_0287
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0288 : Poly :=
[
  term ((-2135944738520162448267249476181018725131 : Rat) / 87635680611898993276600693830673488010) [(6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 288 for generator 4. -/
def ep_Q2_019_partial_04_0288 : Poly :=
[
  term ((-2135944738520162448267249476181018725131 : Rat) / 87635680611898993276600693830673488010) [(2, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2135944738520162448267249476181018725131 : Rat) / 87635680611898993276600693830673488010) [(3, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((2135944738520162448267249476181018725131 : Rat) / 87635680611898993276600693830673488010) [(6, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((2135944738520162448267249476181018725131 : Rat) / 87635680611898993276600693830673488010) [(6, 1), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 4. -/
theorem ep_Q2_019_partial_04_0288_valid :
    mulPoly ep_Q2_019_coefficient_04_0288
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0289 : Poly :=
[
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 289 for generator 4. -/
def ep_Q2_019_partial_04_0289 : Poly :=
[
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 4. -/
theorem ep_Q2_019_partial_04_0289_valid :
    mulPoly ep_Q2_019_coefficient_04_0289
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0290 : Poly :=
[
  term ((260717900636533358212624400082819289376 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 290 for generator 4. -/
def ep_Q2_019_partial_04_0290 : Poly :=
[
  term ((260717900636533358212624400082819289376 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((260717900636533358212624400082819289376 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-260717900636533358212624400082819289376 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-260717900636533358212624400082819289376 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 4. -/
theorem ep_Q2_019_partial_04_0290_valid :
    mulPoly ep_Q2_019_coefficient_04_0290
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0291 : Poly :=
[
  term ((-1618015996638025229697139339898039666344 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 291 for generator 4. -/
def ep_Q2_019_partial_04_0291 : Poly :=
[
  term ((-1618015996638025229697139339898039666344 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1618015996638025229697139339898039666344 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((1618015996638025229697139339898039666344 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((1618015996638025229697139339898039666344 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 4. -/
theorem ep_Q2_019_partial_04_0291_valid :
    mulPoly ep_Q2_019_coefficient_04_0291
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0292 : Poly :=
[
  term ((52013877603293355492349641096521956879 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 292 for generator 4. -/
def ep_Q2_019_partial_04_0292 : Poly :=
[
  term ((52013877603293355492349641096521956879 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((52013877603293355492349641096521956879 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52013877603293355492349641096521956879 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-52013877603293355492349641096521956879 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 4. -/
theorem ep_Q2_019_partial_04_0292_valid :
    mulPoly ep_Q2_019_coefficient_04_0292
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0293 : Poly :=
[
  term ((345342000402220155504745134802799636071 : Rat) / 5365449833381571016934736356980009470) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 293 for generator 4. -/
def ep_Q2_019_partial_04_0293 : Poly :=
[
  term ((345342000402220155504745134802799636071 : Rat) / 5365449833381571016934736356980009470) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((345342000402220155504745134802799636071 : Rat) / 5365449833381571016934736356980009470) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-345342000402220155504745134802799636071 : Rat) / 5365449833381571016934736356980009470) [(6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-345342000402220155504745134802799636071 : Rat) / 5365449833381571016934736356980009470) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 4. -/
theorem ep_Q2_019_partial_04_0293_valid :
    mulPoly ep_Q2_019_coefficient_04_0293
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0294 : Poly :=
[
  term ((-5454470066511689705763188420328618736 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (16, 1)]
]

/-- Partial product 294 for generator 4. -/
def ep_Q2_019_partial_04_0294 : Poly :=
[
  term ((-5454470066511689705763188420328618736 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 1), (9, 2), (16, 1)],
  term ((-5454470066511689705763188420328618736 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 1), (9, 2), (16, 1)],
  term ((5454470066511689705763188420328618736 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (10, 2), (16, 1)],
  term ((5454470066511689705763188420328618736 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 4. -/
theorem ep_Q2_019_partial_04_0294_valid :
    mulPoly ep_Q2_019_coefficient_04_0294
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0295 : Poly :=
[
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 295 for generator 4. -/
def ep_Q2_019_partial_04_0295 : Poly :=
[
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 4. -/
theorem ep_Q2_019_partial_04_0295_valid :
    mulPoly ep_Q2_019_coefficient_04_0295
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0296 : Poly :=
[
  term ((-27886754278091024083979319579186019264 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 296 for generator 4. -/
def ep_Q2_019_partial_04_0296 : Poly :=
[
  term ((-27886754278091024083979319579186019264 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-27886754278091024083979319579186019264 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((27886754278091024083979319579186019264 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((27886754278091024083979319579186019264 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (11, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 4. -/
theorem ep_Q2_019_partial_04_0296_valid :
    mulPoly ep_Q2_019_coefficient_04_0296
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0297 : Poly :=
[
  term ((971461729541482697500263302058034852492 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 297 for generator 4. -/
def ep_Q2_019_partial_04_0297 : Poly :=
[
  term ((971461729541482697500263302058034852492 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((971461729541482697500263302058034852492 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-971461729541482697500263302058034852492 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-971461729541482697500263302058034852492 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 4. -/
theorem ep_Q2_019_partial_04_0297_valid :
    mulPoly ep_Q2_019_coefficient_04_0297
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0298 : Poly :=
[
  term ((-191225226232771354442143453029095907023 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 298 for generator 4. -/
def ep_Q2_019_partial_04_0298 : Poly :=
[
  term ((-191225226232771354442143453029095907023 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-191225226232771354442143453029095907023 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((191225226232771354442143453029095907023 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((191225226232771354442143453029095907023 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 4. -/
theorem ep_Q2_019_partial_04_0298_valid :
    mulPoly ep_Q2_019_coefficient_04_0298
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0299 : Poly :=
[
  term ((-58866385348030549513978278796345428451877 : Rat) / 525814083671393959659604162984040928060) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 299 for generator 4. -/
def ep_Q2_019_partial_04_0299 : Poly :=
[
  term ((-58866385348030549513978278796345428451877 : Rat) / 525814083671393959659604162984040928060) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-58866385348030549513978278796345428451877 : Rat) / 525814083671393959659604162984040928060) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((58866385348030549513978278796345428451877 : Rat) / 525814083671393959659604162984040928060) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((58866385348030549513978278796345428451877 : Rat) / 525814083671393959659604162984040928060) [(6, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 4. -/
theorem ep_Q2_019_partial_04_0299_valid :
    mulPoly ep_Q2_019_coefficient_04_0299
        ep_Q2_019_generator_04_0200_0299 =
      ep_Q2_019_partial_04_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_04_0200_0299 : List Poly :=
[
  ep_Q2_019_partial_04_0200,
  ep_Q2_019_partial_04_0201,
  ep_Q2_019_partial_04_0202,
  ep_Q2_019_partial_04_0203,
  ep_Q2_019_partial_04_0204,
  ep_Q2_019_partial_04_0205,
  ep_Q2_019_partial_04_0206,
  ep_Q2_019_partial_04_0207,
  ep_Q2_019_partial_04_0208,
  ep_Q2_019_partial_04_0209,
  ep_Q2_019_partial_04_0210,
  ep_Q2_019_partial_04_0211,
  ep_Q2_019_partial_04_0212,
  ep_Q2_019_partial_04_0213,
  ep_Q2_019_partial_04_0214,
  ep_Q2_019_partial_04_0215,
  ep_Q2_019_partial_04_0216,
  ep_Q2_019_partial_04_0217,
  ep_Q2_019_partial_04_0218,
  ep_Q2_019_partial_04_0219,
  ep_Q2_019_partial_04_0220,
  ep_Q2_019_partial_04_0221,
  ep_Q2_019_partial_04_0222,
  ep_Q2_019_partial_04_0223,
  ep_Q2_019_partial_04_0224,
  ep_Q2_019_partial_04_0225,
  ep_Q2_019_partial_04_0226,
  ep_Q2_019_partial_04_0227,
  ep_Q2_019_partial_04_0228,
  ep_Q2_019_partial_04_0229,
  ep_Q2_019_partial_04_0230,
  ep_Q2_019_partial_04_0231,
  ep_Q2_019_partial_04_0232,
  ep_Q2_019_partial_04_0233,
  ep_Q2_019_partial_04_0234,
  ep_Q2_019_partial_04_0235,
  ep_Q2_019_partial_04_0236,
  ep_Q2_019_partial_04_0237,
  ep_Q2_019_partial_04_0238,
  ep_Q2_019_partial_04_0239,
  ep_Q2_019_partial_04_0240,
  ep_Q2_019_partial_04_0241,
  ep_Q2_019_partial_04_0242,
  ep_Q2_019_partial_04_0243,
  ep_Q2_019_partial_04_0244,
  ep_Q2_019_partial_04_0245,
  ep_Q2_019_partial_04_0246,
  ep_Q2_019_partial_04_0247,
  ep_Q2_019_partial_04_0248,
  ep_Q2_019_partial_04_0249,
  ep_Q2_019_partial_04_0250,
  ep_Q2_019_partial_04_0251,
  ep_Q2_019_partial_04_0252,
  ep_Q2_019_partial_04_0253,
  ep_Q2_019_partial_04_0254,
  ep_Q2_019_partial_04_0255,
  ep_Q2_019_partial_04_0256,
  ep_Q2_019_partial_04_0257,
  ep_Q2_019_partial_04_0258,
  ep_Q2_019_partial_04_0259,
  ep_Q2_019_partial_04_0260,
  ep_Q2_019_partial_04_0261,
  ep_Q2_019_partial_04_0262,
  ep_Q2_019_partial_04_0263,
  ep_Q2_019_partial_04_0264,
  ep_Q2_019_partial_04_0265,
  ep_Q2_019_partial_04_0266,
  ep_Q2_019_partial_04_0267,
  ep_Q2_019_partial_04_0268,
  ep_Q2_019_partial_04_0269,
  ep_Q2_019_partial_04_0270,
  ep_Q2_019_partial_04_0271,
  ep_Q2_019_partial_04_0272,
  ep_Q2_019_partial_04_0273,
  ep_Q2_019_partial_04_0274,
  ep_Q2_019_partial_04_0275,
  ep_Q2_019_partial_04_0276,
  ep_Q2_019_partial_04_0277,
  ep_Q2_019_partial_04_0278,
  ep_Q2_019_partial_04_0279,
  ep_Q2_019_partial_04_0280,
  ep_Q2_019_partial_04_0281,
  ep_Q2_019_partial_04_0282,
  ep_Q2_019_partial_04_0283,
  ep_Q2_019_partial_04_0284,
  ep_Q2_019_partial_04_0285,
  ep_Q2_019_partial_04_0286,
  ep_Q2_019_partial_04_0287,
  ep_Q2_019_partial_04_0288,
  ep_Q2_019_partial_04_0289,
  ep_Q2_019_partial_04_0290,
  ep_Q2_019_partial_04_0291,
  ep_Q2_019_partial_04_0292,
  ep_Q2_019_partial_04_0293,
  ep_Q2_019_partial_04_0294,
  ep_Q2_019_partial_04_0295,
  ep_Q2_019_partial_04_0296,
  ep_Q2_019_partial_04_0297,
  ep_Q2_019_partial_04_0298,
  ep_Q2_019_partial_04_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_04_0200_0299 : Poly :=
[
  term ((-9804632578437567841456653019415000496 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (7, 1), (8, 1), (16, 1)],
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-573916245560474883369761083108967184 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((9315154904289895302280973647207632 : Rat) / 894241638896928502822456059496668245) [(2, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((28793191771474083481052951094796000248 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((-1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((4860043377503485332868277937744743664 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((1010107648084738385981821810525088208 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((-382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18387200912138544292869573064636832455642 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((191305415186824961123253694369655728 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((466208429556846494984843489154572948872 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-26705870866667547961860648240560373789704 : Rat) / 394360562753545469744703122238030696045) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (3, 1), (9, 2), (13, 1), (16, 1)],
  term ((-932416859113692989969686978309145897744 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1000217439528594664314703441079945904 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3624606428079699397067137641332393712 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7824480730605323547908336959187972544 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((729886599087188114873903445858307518194 : Rat) / 341779154386406073778742705939626603239) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((17225880709748960867832221930775874455748 : Rat) / 394360562753545469744703122238030696045) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((89477526847703900422241592590863680 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (3, 2), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (6, 1), (8, 1), (16, 1)],
  term ((-27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((1505270298956820803558876204370350496 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (4, 1), (6, 1), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (6, 2), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-410264865169737733558741537211191776 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(2, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-35683764814755798798023298372763203676 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (12, 1), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (12, 2), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((4376158561810535824626576396919378944 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((2431559956289628652852185222022496352 : Rat) / 894241638896928502822456059496668245) [(2, 2), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-13345278347609009892278413746132389872 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-13866204368479731692965425989669235168 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-5584818468037008101156936404628957232 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16931866703352741568151827564096528 : Rat) / 52602449346878147224850356440980485) [(2, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((9504129148707444441432133251780648576 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(2, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((81645705846037162800854839053525624 : Rat) / 178848327779385700564491211899333649) [(2, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3272575449074510298212798342301802616 : Rat) / 894241638896928502822456059496668245) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((666820162704000320312077988243631383030 : Rat) / 341779154386406073778742705939626603239) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(2, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((11169636936074016202313872809257914464 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-26034115154458527748114696640307503652 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((33863733406705483136303655128193056 : Rat) / 52602449346878147224850356440980485) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3055913095762459514936008821905020549294 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((8286329723833936974787409744219127496 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (6, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((183577727288056937147808518292128101976 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((2187775307365005895608224162638321104 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 1), (7, 2), (16, 1)],
  term ((547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(2, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-3142001084340142487209293910684920576 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-1703096035420750184163874725452437104 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 1), (8, 1), (16, 1)],
  term ((-2135944738520162448267249476181018725131 : Rat) / 87635680611898993276600693830673488010) [(2, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((260717900636533358212624400082819289376 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1618015996638025229697139339898039666344 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((52013877603293355492349641096521956879 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((345342000402220155504745134802799636071 : Rat) / 5365449833381571016934736356980009470) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5454470066511689705763188420328618736 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 1), (9, 2), (16, 1)],
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-27886754278091024083979319579186019264 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((971461729541482697500263302058034852492 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-191225226232771354442143453029095907023 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-58866385348030549513978278796345428451877 : Rat) / 525814083671393959659604162984040928060) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((9804632578437567841456653019415000496 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (8, 1), (10, 2), (16, 1)],
  term ((9804632578437567841456653019415000496 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (8, 1), (11, 2), (16, 1)],
  term ((-2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((573916245560474883369761083108967184 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9315154904289895302280973647207632 : Rat) / 894241638896928502822456059496668245) [(3, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((-28793191771474083481052951094796000248 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 2), (14, 1), (16, 1)],
  term ((1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 2), (15, 2), (16, 1)],
  term ((-4860043377503485332868277937744743664 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term ((-9315154904289895302280973647207632 : Rat) / 894241638896928502822456059496668245) [(3, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((-28793191771474083481052951094796000248 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((-4860043377503485332868277937744743664 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((573916245560474883369761083108967184 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((-1010107648084738385981821810525088208 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (8, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((18387200912138544292869573064636832455642 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1010107648084738385981821810525088208 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((18387200912138544292869573064636832455642 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-191305415186824961123253694369655728 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-466208429556846494984843489154572948872 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((26705870866667547961860648240560373789704 : Rat) / 394360562753545469744703122238030696045) [(3, 1), (9, 1), (10, 2), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-466208429556846494984843489154572948872 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((26705870866667547961860648240560373789704 : Rat) / 394360562753545469744703122238030696045) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term ((-191305415186824961123253694369655728 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((932416859113692989969686978309145897744 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((932416859113692989969686978309145897744 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((1000217439528594664314703441079945904 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((3624606428079699397067137641332393712 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((7824480730605323547908336959187972544 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (10, 2), (13, 1), (16, 1)],
  term ((-729886599087188114873903445858307518194 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-17225880709748960867832221930775874455748 : Rat) / 394360562753545469744703122238030696045) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((1000217439528594664314703441079945904 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((3624606428079699397067137641332393712 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((7824480730605323547908336959187972544 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (11, 2), (13, 1), (16, 1)],
  term ((-729886599087188114873903445858307518194 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-17225880709748960867832221930775874455748 : Rat) / 394360562753545469744703122238030696045) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (6, 1), (8, 1), (16, 1)],
  term ((-27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((1505270298956820803558876204370350496 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (6, 2), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-410264865169737733558741537211191776 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(3, 2), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(3, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-35683764814755798798023298372763203676 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (12, 1), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (12, 2), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((4376158561810535824626576396919378944 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((2431559956289628652852185222022496352 : Rat) / 894241638896928502822456059496668245) [(3, 2), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-13345278347609009892278413746132389872 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-13866204368479731692965425989669235168 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-5584818468037008101156936404628957232 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16931866703352741568151827564096528 : Rat) / 52602449346878147224850356440980485) [(3, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((9504129148707444441432133251780648576 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(3, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((81645705846037162800854839053525624 : Rat) / 178848327779385700564491211899333649) [(3, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3272575449074510298212798342301802616 : Rat) / 894241638896928502822456059496668245) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((666820162704000320312077988243631383030 : Rat) / 341779154386406073778742705939626603239) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(3, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((11169636936074016202313872809257914464 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-26034115154458527748114696640307503652 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((33863733406705483136303655128193056 : Rat) / 52602449346878147224850356440980485) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3055913095762459514936008821905020549294 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((8286329723833936974787409744219127496 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (6, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((183577727288056937147808518292128101976 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((2187775307365005895608224162638321104 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 1), (7, 2), (16, 1)],
  term ((547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(3, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-3142001084340142487209293910684920576 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-1703096035420750184163874725452437104 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 1), (8, 1), (16, 1)],
  term ((-2135944738520162448267249476181018725131 : Rat) / 87635680611898993276600693830673488010) [(3, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((260717900636533358212624400082819289376 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1618015996638025229697139339898039666344 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((52013877603293355492349641096521956879 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((345342000402220155504745134802799636071 : Rat) / 5365449833381571016934736356980009470) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5454470066511689705763188420328618736 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 1), (9, 2), (16, 1)],
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-27886754278091024083979319579186019264 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((971461729541482697500263302058034852492 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-191225226232771354442143453029095907023 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-58866385348030549513978278796345428451877 : Rat) / 525814083671393959659604162984040928060) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-89477526847703900422241592590863680 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (10, 2), (16, 1)],
  term ((-89477526847703900422241592590863680 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (11, 2), (16, 1)],
  term ((-9804632578437567841456653019415000496 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (7, 1), (8, 1), (16, 1)],
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-573916245560474883369761083108967184 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((9315154904289895302280973647207632 : Rat) / 894241638896928502822456059496668245) [(3, 3), (7, 1), (12, 1), (16, 1)],
  term ((28793191771474083481052951094796000248 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (7, 1), (14, 1), (16, 1)],
  term ((-1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (7, 1), (15, 2), (16, 1)],
  term ((4860043377503485332868277937744743664 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (7, 1), (16, 1)],
  term ((1010107648084738385981821810525088208 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (8, 1), (13, 1), (16, 1)],
  term ((-382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18387200912138544292869573064636832455642 : Rat) / 1708895771932030368893713529698133016195) [(3, 3), (8, 1), (15, 1), (16, 1)],
  term ((191305415186824961123253694369655728 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((466208429556846494984843489154572948872 : Rat) / 43817840305949496638300346915336744005) [(3, 3), (9, 1), (15, 2), (16, 1)],
  term ((-26705870866667547961860648240560373789704 : Rat) / 394360562753545469744703122238030696045) [(3, 3), (9, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 3), (9, 2), (13, 1), (16, 1)],
  term ((-932416859113692989969686978309145897744 : Rat) / 43817840305949496638300346915336744005) [(3, 3), (9, 2), (15, 1), (16, 1)],
  term ((-1000217439528594664314703441079945904 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (12, 1), (13, 1), (16, 1)],
  term ((-3624606428079699397067137641332393712 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (12, 1), (15, 1), (16, 1)],
  term ((-7824480730605323547908336959187972544 : Rat) / 6259691472278499519757192416476677715) [(3, 3), (13, 1), (16, 1)],
  term ((729886599087188114873903445858307518194 : Rat) / 341779154386406073778742705939626603239) [(3, 3), (14, 1), (15, 1), (16, 1)],
  term ((17225880709748960867832221930775874455748 : Rat) / 394360562753545469744703122238030696045) [(3, 3), (15, 1), (16, 1)],
  term ((89477526847703900422241592590863680 : Rat) / 1251938294455699903951438483295335543) [(3, 4), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (8, 1), (10, 2), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (8, 1), (11, 2), (16, 1)],
  term ((27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (10, 2), (12, 1), (16, 1)],
  term ((-1505270298956820803558876204370350496 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (6, 1), (10, 2), (16, 1)],
  term ((27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-1505270298956820803558876204370350496 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 2), (10, 2), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 2), (11, 2), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((410264865169737733558741537211191776 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(4, 1), (7, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(4, 1), (7, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((410264865169737733558741537211191776 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (11, 3), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(4, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((35683764814755798798023298372763203676 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (10, 2), (12, 1), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (10, 2), (12, 2), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4376158561810535824626576396919378944 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (10, 2), (15, 2), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((35683764814755798798023298372763203676 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (11, 2), (12, 1), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (11, 2), (12, 2), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4376158561810535824626576396919378944 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (11, 2), (15, 2), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (11, 3), (15, 1), (16, 1)],
  term ((-2431559956289628652852185222022496352 : Rat) / 894241638896928502822456059496668245) [(5, 1), (6, 1), (7, 1), (10, 2), (16, 1)],
  term ((-2431559956289628652852185222022496352 : Rat) / 894241638896928502822456059496668245) [(5, 1), (6, 1), (7, 1), (11, 2), (16, 1)],
  term ((27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 1), (11, 2), (13, 1), (16, 1)],
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (10, 2), (14, 1), (16, 1)],
  term ((13345278347609009892278413746132389872 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (8, 1), (10, 2), (16, 1)],
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((13345278347609009892278413746132389872 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (8, 1), (11, 2), (16, 1)],
  term ((35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (11, 3), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (10, 2), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((13866204368479731692965425989669235168 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (10, 2), (12, 2), (16, 1)],
  term ((5584818468037008101156936404628957232 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((16931866703352741568151827564096528 : Rat) / 52602449346878147224850356440980485) [(5, 1), (7, 1), (10, 2), (14, 1), (16, 1)],
  term ((-9504129148707444441432133251780648576 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (10, 2), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((13866204368479731692965425989669235168 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (11, 2), (12, 2), (16, 1)],
  term ((5584818468037008101156936404628957232 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((16931866703352741568151827564096528 : Rat) / 52602449346878147224850356440980485) [(5, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-9504129148707444441432133251780648576 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(5, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((-81645705846037162800854839053525624 : Rat) / 178848327779385700564491211899333649) [(5, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-81645705846037162800854839053525624 : Rat) / 178848327779385700564491211899333649) [(5, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(5, 1), (8, 1), (11, 3), (16, 1)],
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((3272575449074510298212798342301802616 : Rat) / 894241638896928502822456059496668245) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((3272575449074510298212798342301802616 : Rat) / 894241638896928502822456059496668245) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(5, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-666820162704000320312077988243631383030 : Rat) / 341779154386406073778742705939626603239) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(5, 1), (10, 2), (12, 2), (15, 1), (16, 1)],
  term ((3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(5, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-11169636936074016202313872809257914464 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((26034115154458527748114696640307503652 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-33863733406705483136303655128193056 : Rat) / 52602449346878147224850356440980485) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((3055913095762459514936008821905020549294 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-666820162704000320312077988243631383030 : Rat) / 341779154386406073778742705939626603239) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(5, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(5, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-11169636936074016202313872809257914464 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((26034115154458527748114696640307503652 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 2), (13, 1), (16, 1)],
  term ((-33863733406705483136303655128193056 : Rat) / 52602449346878147224850356440980485) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((3055913095762459514936008821905020549294 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(5, 1), (11, 3), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8286329723833936974787409744219127496 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-8286329723833936974787409744219127496 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-183577727288056937147808518292128101976 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-2187775307365005895608224162638321104 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2187775307365005895608224162638321104 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-183577727288056937147808518292128101976 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (7, 1), (11, 3), (16, 1)],
  term ((5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (7, 2), (10, 2), (16, 1)],
  term ((5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (7, 2), (11, 2), (16, 1)],
  term ((-547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(6, 1), (8, 1), (10, 2), (12, 1), (16, 1)],
  term ((3142001084340142487209293910684920576 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (10, 2), (14, 1), (16, 1)],
  term ((1703096035420750184163874725452437104 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (10, 2), (16, 1)],
  term ((-547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(6, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((3142001084340142487209293910684920576 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((1703096035420750184163874725452437104 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((2135944738520162448267249476181018725131 : Rat) / 87635680611898993276600693830673488010) [(6, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-260717900636533358212624400082819289376 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((1618015996638025229697139339898039666344 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-52013877603293355492349641096521956879 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-345342000402220155504745134802799636071 : Rat) / 5365449833381571016934736356980009470) [(6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-260717900636533358212624400082819289376 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((1618015996638025229697139339898039666344 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-52013877603293355492349641096521956879 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-345342000402220155504745134802799636071 : Rat) / 5365449833381571016934736356980009470) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((2135944738520162448267249476181018725131 : Rat) / 87635680611898993276600693830673488010) [(6, 1), (9, 1), (11, 3), (16, 1)],
  term ((5454470066511689705763188420328618736 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (10, 2), (16, 1)],
  term ((5454470066511689705763188420328618736 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (11, 2), (16, 1)],
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((27886754278091024083979319579186019264 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-971461729541482697500263302058034852492 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((191225226232771354442143453029095907023 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((58866385348030549513978278796345428451877 : Rat) / 525814083671393959659604162984040928060) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((27886754278091024083979319579186019264 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (11, 3), (13, 1), (14, 1), (16, 1)],
  term ((-971461729541482697500263302058034852492 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 3), (13, 1), (16, 1)],
  term ((191225226232771354442143453029095907023 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((58866385348030549513978278796345428451877 : Rat) / 525814083671393959659604162984040928060) [(6, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 200 through 299. -/
theorem ep_Q2_019_block_04_0200_0299_valid :
    checkProductSumEq ep_Q2_019_partials_04_0200_0299
      ep_Q2_019_block_04_0200_0299 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
