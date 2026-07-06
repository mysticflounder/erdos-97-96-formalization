/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 5:200-280

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 5 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_05_0200_0280 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0200 : Poly :=
[
  term ((9915782878446100008423286602736194575279 : Rat) / 87635680611898993276600693830673488010) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 200 for generator 5. -/
def ep_Q2_019_partial_05_0200 : Poly :=
[
  term ((9915782878446100008423286602736194575279 : Rat) / 87635680611898993276600693830673488010) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term ((9915782878446100008423286602736194575279 : Rat) / 87635680611898993276600693830673488010) [(3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-9915782878446100008423286602736194575279 : Rat) / 87635680611898993276600693830673488010) [(7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-9915782878446100008423286602736194575279 : Rat) / 87635680611898993276600693830673488010) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 5. -/
theorem ep_Q2_019_partial_05_0200_valid :
    mulPoly ep_Q2_019_coefficient_05_0200
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0201 : Poly :=
[
  term ((-13752294263307734127985218974254314784 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 201 for generator 5. -/
def ep_Q2_019_partial_05_0201 : Poly :=
[
  term ((-13752294263307734127985218974254314784 : Rat) / 178848327779385700564491211899333649) [(2, 2), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-13752294263307734127985218974254314784 : Rat) / 178848327779385700564491211899333649) [(3, 2), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((13752294263307734127985218974254314784 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((13752294263307734127985218974254314784 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 5. -/
theorem ep_Q2_019_partial_05_0201_valid :
    mulPoly ep_Q2_019_coefficient_05_0201
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0202 : Poly :=
[
  term ((-460918296718660877985356527678163127272 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 5. -/
def ep_Q2_019_partial_05_0202 : Poly :=
[
  term ((-460918296718660877985356527678163127272 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-460918296718660877985356527678163127272 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((460918296718660877985356527678163127272 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((460918296718660877985356527678163127272 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 5. -/
theorem ep_Q2_019_partial_05_0202_valid :
    mulPoly ep_Q2_019_coefficient_05_0202
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0203 : Poly :=
[
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 203 for generator 5. -/
def ep_Q2_019_partial_05_0203 : Poly :=
[
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 5. -/
theorem ep_Q2_019_partial_05_0203_valid :
    mulPoly ep_Q2_019_coefficient_05_0203
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0204 : Poly :=
[
  term ((142159058145265415508733781665912160168 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 204 for generator 5. -/
def ep_Q2_019_partial_05_0204 : Poly :=
[
  term ((142159058145265415508733781665912160168 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((142159058145265415508733781665912160168 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-142159058145265415508733781665912160168 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-142159058145265415508733781665912160168 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 5. -/
theorem ep_Q2_019_partial_05_0204_valid :
    mulPoly ep_Q2_019_coefficient_05_0204
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0205 : Poly :=
[
  term ((-5172226754661521263280608587558500256 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 5. -/
def ep_Q2_019_partial_05_0205 : Poly :=
[
  term ((-5172226754661521263280608587558500256 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5172226754661521263280608587558500256 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((5172226754661521263280608587558500256 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((5172226754661521263280608587558500256 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 5. -/
theorem ep_Q2_019_partial_05_0205_valid :
    mulPoly ep_Q2_019_coefficient_05_0205
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0206 : Poly :=
[
  term ((2884006467938487483992010575942309972893 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 206 for generator 5. -/
def ep_Q2_019_partial_05_0206 : Poly :=
[
  term ((2884006467938487483992010575942309972893 : Rat) / 131453520917848489914901040746010232015) [(2, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((2884006467938487483992010575942309972893 : Rat) / 131453520917848489914901040746010232015) [(3, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2884006467938487483992010575942309972893 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2884006467938487483992010575942309972893 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 5. -/
theorem ep_Q2_019_partial_05_0206_valid :
    mulPoly ep_Q2_019_coefficient_05_0206
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0207 : Poly :=
[
  term ((5762592997122118035639076434459599904 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 207 for generator 5. -/
def ep_Q2_019_partial_05_0207 : Poly :=
[
  term ((5762592997122118035639076434459599904 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((5762592997122118035639076434459599904 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5762592997122118035639076434459599904 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-5762592997122118035639076434459599904 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 5. -/
theorem ep_Q2_019_partial_05_0207_valid :
    mulPoly ep_Q2_019_coefficient_05_0207
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0208 : Poly :=
[
  term ((-21921946681871069583689631590509069178971 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 208 for generator 5. -/
def ep_Q2_019_partial_05_0208 : Poly :=
[
  term ((-21921946681871069583689631590509069178971 : Rat) / 262907041835696979829802081492020464030) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-21921946681871069583689631590509069178971 : Rat) / 262907041835696979829802081492020464030) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((21921946681871069583689631590509069178971 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((21921946681871069583689631590509069178971 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 5. -/
theorem ep_Q2_019_partial_05_0208_valid :
    mulPoly ep_Q2_019_coefficient_05_0208
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0209 : Poly :=
[
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 209 for generator 5. -/
def ep_Q2_019_partial_05_0209 : Poly :=
[
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 5. -/
theorem ep_Q2_019_partial_05_0209_valid :
    mulPoly ep_Q2_019_coefficient_05_0209
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0210 : Poly :=
[
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 5. -/
def ep_Q2_019_partial_05_0210 : Poly :=
[
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 5. -/
theorem ep_Q2_019_partial_05_0210_valid :
    mulPoly ep_Q2_019_coefficient_05_0210
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0211 : Poly :=
[
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 5. -/
def ep_Q2_019_partial_05_0211 : Poly :=
[
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 5. -/
theorem ep_Q2_019_partial_05_0211_valid :
    mulPoly ep_Q2_019_coefficient_05_0211
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0212 : Poly :=
[
  term ((5979918337544489898251329971467585856 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 212 for generator 5. -/
def ep_Q2_019_partial_05_0212 : Poly :=
[
  term ((5979918337544489898251329971467585856 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((5979918337544489898251329971467585856 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5979918337544489898251329971467585856 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5979918337544489898251329971467585856 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 5. -/
theorem ep_Q2_019_partial_05_0212_valid :
    mulPoly ep_Q2_019_coefficient_05_0212
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0213 : Poly :=
[
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 213 for generator 5. -/
def ep_Q2_019_partial_05_0213 : Poly :=
[
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 5. -/
theorem ep_Q2_019_partial_05_0213_valid :
    mulPoly ep_Q2_019_coefficient_05_0213
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0214 : Poly :=
[
  term ((-180632751376116949451127422632624046292 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 214 for generator 5. -/
def ep_Q2_019_partial_05_0214 : Poly :=
[
  term ((-180632751376116949451127422632624046292 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-180632751376116949451127422632624046292 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((180632751376116949451127422632624046292 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((180632751376116949451127422632624046292 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 5. -/
theorem ep_Q2_019_partial_05_0214_valid :
    mulPoly ep_Q2_019_coefficient_05_0214
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0215 : Poly :=
[
  term ((1707083080091511759049569657724487856 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 215 for generator 5. -/
def ep_Q2_019_partial_05_0215 : Poly :=
[
  term ((1707083080091511759049569657724487856 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1707083080091511759049569657724487856 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1707083080091511759049569657724487856 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1707083080091511759049569657724487856 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 5. -/
theorem ep_Q2_019_partial_05_0215_valid :
    mulPoly ep_Q2_019_coefficient_05_0215
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0216 : Poly :=
[
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 5. -/
def ep_Q2_019_partial_05_0216 : Poly :=
[
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (14, 2), (15, 3), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (14, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 5. -/
theorem ep_Q2_019_partial_05_0216_valid :
    mulPoly ep_Q2_019_coefficient_05_0216
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0217 : Poly :=
[
  term ((-2828346690898131894054143233575894901 : Rat) / 631229392162537766698204277291765820) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 217 for generator 5. -/
def ep_Q2_019_partial_05_0217 : Poly :=
[
  term ((-2828346690898131894054143233575894901 : Rat) / 631229392162537766698204277291765820) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2828346690898131894054143233575894901 : Rat) / 631229392162537766698204277291765820) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((2828346690898131894054143233575894901 : Rat) / 631229392162537766698204277291765820) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((2828346690898131894054143233575894901 : Rat) / 631229392162537766698204277291765820) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 5. -/
theorem ep_Q2_019_partial_05_0217_valid :
    mulPoly ep_Q2_019_coefficient_05_0217
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0218 : Poly :=
[
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 218 for generator 5. -/
def ep_Q2_019_partial_05_0218 : Poly :=
[
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (14, 2), (15, 3), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 5. -/
theorem ep_Q2_019_partial_05_0218_valid :
    mulPoly ep_Q2_019_coefficient_05_0218
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0219 : Poly :=
[
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (8, 1), (16, 1)]
]

/-- Partial product 219 for generator 5. -/
def ep_Q2_019_partial_05_0219 : Poly :=
[
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 2), (8, 1), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 2), (8, 1), (16, 1)],
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (8, 1), (14, 2), (16, 1)],
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 5. -/
theorem ep_Q2_019_partial_05_0219_valid :
    mulPoly ep_Q2_019_coefficient_05_0219
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0220 : Poly :=
[
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (12, 1), (16, 1)]
]

/-- Partial product 220 for generator 5. -/
def ep_Q2_019_partial_05_0220 : Poly :=
[
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 2), (12, 1), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 2), (12, 1), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (12, 1), (14, 2), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 5. -/
theorem ep_Q2_019_partial_05_0220_valid :
    mulPoly ep_Q2_019_coefficient_05_0220
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0221 : Poly :=
[
  term ((12592227379876117996335162240546175896 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (16, 1)]
]

/-- Partial product 221 for generator 5. -/
def ep_Q2_019_partial_05_0221 : Poly :=
[
  term ((12592227379876117996335162240546175896 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 2), (16, 1)],
  term ((12592227379876117996335162240546175896 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 2), (16, 1)],
  term ((-12592227379876117996335162240546175896 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (14, 2), (16, 1)],
  term ((-12592227379876117996335162240546175896 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 5. -/
theorem ep_Q2_019_partial_05_0221_valid :
    mulPoly ep_Q2_019_coefficient_05_0221
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0222 : Poly :=
[
  term ((1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 222 for generator 5. -/
def ep_Q2_019_partial_05_0222 : Poly :=
[
  term ((1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 5. -/
theorem ep_Q2_019_partial_05_0222_valid :
    mulPoly ep_Q2_019_coefficient_05_0222
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0223 : Poly :=
[
  term ((-8216738889742585343822577501560038992 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 223 for generator 5. -/
def ep_Q2_019_partial_05_0223 : Poly :=
[
  term ((-8216738889742585343822577501560038992 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (8, 1), (12, 1), (16, 1)],
  term ((-8216738889742585343822577501560038992 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (8, 1), (12, 1), (16, 1)],
  term ((8216738889742585343822577501560038992 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 1), (14, 2), (16, 1)],
  term ((8216738889742585343822577501560038992 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 5. -/
theorem ep_Q2_019_partial_05_0223_valid :
    mulPoly ep_Q2_019_coefficient_05_0223
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0224 : Poly :=
[
  term ((-23955425217947870378193465275328979872 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 224 for generator 5. -/
def ep_Q2_019_partial_05_0224 : Poly :=
[
  term ((-23955425217947870378193465275328979872 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (8, 1), (14, 1), (16, 1)],
  term ((-23955425217947870378193465275328979872 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (8, 1), (14, 1), (16, 1)],
  term ((23955425217947870378193465275328979872 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((23955425217947870378193465275328979872 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 5. -/
theorem ep_Q2_019_partial_05_0224_valid :
    mulPoly ep_Q2_019_coefficient_05_0224
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0225 : Poly :=
[
  term ((1816095637945422485204253559925304744 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (16, 1)]
]

/-- Partial product 225 for generator 5. -/
def ep_Q2_019_partial_05_0225 : Poly :=
[
  term ((1816095637945422485204253559925304744 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (8, 1), (16, 1)],
  term ((1816095637945422485204253559925304744 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (8, 1), (16, 1)],
  term ((-1816095637945422485204253559925304744 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (14, 2), (16, 1)],
  term ((-1816095637945422485204253559925304744 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 5. -/
theorem ep_Q2_019_partial_05_0225_valid :
    mulPoly ep_Q2_019_coefficient_05_0225
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0226 : Poly :=
[
  term ((547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(8, 2), (16, 1)]
]

/-- Partial product 226 for generator 5. -/
def ep_Q2_019_partial_05_0226 : Poly :=
[
  term ((547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(2, 2), (8, 2), (16, 1)],
  term ((547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(3, 2), (8, 2), (16, 1)],
  term ((-547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(8, 2), (14, 2), (16, 1)],
  term ((-547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(8, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 5. -/
theorem ep_Q2_019_partial_05_0226_valid :
    mulPoly ep_Q2_019_coefficient_05_0226
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0227 : Poly :=
[
  term ((-36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 227 for generator 5. -/
def ep_Q2_019_partial_05_0227 : Poly :=
[
  term ((-36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 5. -/
theorem ep_Q2_019_partial_05_0227_valid :
    mulPoly ep_Q2_019_coefficient_05_0227
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0228 : Poly :=
[
  term ((193020634023349733142957715202225217952 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 228 for generator 5. -/
def ep_Q2_019_partial_05_0228 : Poly :=
[
  term ((193020634023349733142957715202225217952 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((193020634023349733142957715202225217952 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-193020634023349733142957715202225217952 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-193020634023349733142957715202225217952 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 5. -/
theorem ep_Q2_019_partial_05_0228_valid :
    mulPoly ep_Q2_019_coefficient_05_0228
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0229 : Poly :=
[
  term ((-2629455799234597957468869379350364846261 : Rat) / 394360562753545469744703122238030696045) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 229 for generator 5. -/
def ep_Q2_019_partial_05_0229 : Poly :=
[
  term ((-2629455799234597957468869379350364846261 : Rat) / 394360562753545469744703122238030696045) [(2, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2629455799234597957468869379350364846261 : Rat) / 394360562753545469744703122238030696045) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((2629455799234597957468869379350364846261 : Rat) / 394360562753545469744703122238030696045) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2629455799234597957468869379350364846261 : Rat) / 394360562753545469744703122238030696045) [(9, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 5. -/
theorem ep_Q2_019_partial_05_0229_valid :
    mulPoly ep_Q2_019_coefficient_05_0229
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0230 : Poly :=
[
  term ((186538783359255546328951720763279720592 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 230 for generator 5. -/
def ep_Q2_019_partial_05_0230 : Poly :=
[
  term ((186538783359255546328951720763279720592 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((186538783359255546328951720763279720592 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-186538783359255546328951720763279720592 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-186538783359255546328951720763279720592 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 5. -/
theorem ep_Q2_019_partial_05_0230_valid :
    mulPoly ep_Q2_019_coefficient_05_0230
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0231 : Poly :=
[
  term ((19832642032609962520370392308368167703063 : Rat) / 315488450202836375795762497790424556836) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 231 for generator 5. -/
def ep_Q2_019_partial_05_0231 : Poly :=
[
  term ((19832642032609962520370392308368167703063 : Rat) / 315488450202836375795762497790424556836) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((19832642032609962520370392308368167703063 : Rat) / 315488450202836375795762497790424556836) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-19832642032609962520370392308368167703063 : Rat) / 315488450202836375795762497790424556836) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-19832642032609962520370392308368167703063 : Rat) / 315488450202836375795762497790424556836) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 5. -/
theorem ep_Q2_019_partial_05_0231_valid :
    mulPoly ep_Q2_019_coefficient_05_0231
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0232 : Poly :=
[
  term ((666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 232 for generator 5. -/
def ep_Q2_019_partial_05_0232 : Poly :=
[
  term ((666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(2, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(3, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 5. -/
theorem ep_Q2_019_partial_05_0232_valid :
    mulPoly ep_Q2_019_coefficient_05_0232
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0233 : Poly :=
[
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 233 for generator 5. -/
def ep_Q2_019_partial_05_0233 : Poly :=
[
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 5. -/
theorem ep_Q2_019_partial_05_0233_valid :
    mulPoly ep_Q2_019_coefficient_05_0233
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0234 : Poly :=
[
  term ((-11068969376785589669299766049197200795330 : Rat) / 341779154386406073778742705939626603239) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 234 for generator 5. -/
def ep_Q2_019_partial_05_0234 : Poly :=
[
  term ((-11068969376785589669299766049197200795330 : Rat) / 341779154386406073778742705939626603239) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11068969376785589669299766049197200795330 : Rat) / 341779154386406073778742705939626603239) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((11068969376785589669299766049197200795330 : Rat) / 341779154386406073778742705939626603239) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((11068969376785589669299766049197200795330 : Rat) / 341779154386406073778742705939626603239) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 5. -/
theorem ep_Q2_019_partial_05_0234_valid :
    mulPoly ep_Q2_019_coefficient_05_0234
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0235 : Poly :=
[
  term ((-1286009543164591680617379394037225365492 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 235 for generator 5. -/
def ep_Q2_019_partial_05_0235 : Poly :=
[
  term ((-1286009543164591680617379394037225365492 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1286009543164591680617379394037225365492 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1286009543164591680617379394037225365492 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1286009543164591680617379394037225365492 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 5. -/
theorem ep_Q2_019_partial_05_0235_valid :
    mulPoly ep_Q2_019_coefficient_05_0235
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0236 : Poly :=
[
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 236 for generator 5. -/
def ep_Q2_019_partial_05_0236 : Poly :=
[
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (13, 1), (14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 5. -/
theorem ep_Q2_019_partial_05_0236_valid :
    mulPoly ep_Q2_019_coefficient_05_0236
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0237 : Poly :=
[
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 237 for generator 5. -/
def ep_Q2_019_partial_05_0237 : Poly :=
[
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 5. -/
theorem ep_Q2_019_partial_05_0237_valid :
    mulPoly ep_Q2_019_coefficient_05_0237
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0238 : Poly :=
[
  term ((-357985038821072541410122455233095843526 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 238 for generator 5. -/
def ep_Q2_019_partial_05_0238 : Poly :=
[
  term ((-357985038821072541410122455233095843526 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-357985038821072541410122455233095843526 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((357985038821072541410122455233095843526 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((357985038821072541410122455233095843526 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 5. -/
theorem ep_Q2_019_partial_05_0238_valid :
    mulPoly ep_Q2_019_coefficient_05_0238
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0239 : Poly :=
[
  term ((-5035244688057006806659828859947413079952 : Rat) / 131453520917848489914901040746010232015) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 5. -/
def ep_Q2_019_partial_05_0239 : Poly :=
[
  term ((-5035244688057006806659828859947413079952 : Rat) / 131453520917848489914901040746010232015) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5035244688057006806659828859947413079952 : Rat) / 131453520917848489914901040746010232015) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((5035244688057006806659828859947413079952 : Rat) / 131453520917848489914901040746010232015) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((5035244688057006806659828859947413079952 : Rat) / 131453520917848489914901040746010232015) [(9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 5. -/
theorem ep_Q2_019_partial_05_0239_valid :
    mulPoly ep_Q2_019_coefficient_05_0239
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0240 : Poly :=
[
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 240 for generator 5. -/
def ep_Q2_019_partial_05_0240 : Poly :=
[
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (14, 2), (15, 3), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (14, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 5. -/
theorem ep_Q2_019_partial_05_0240_valid :
    mulPoly ep_Q2_019_coefficient_05_0240
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0241 : Poly :=
[
  term ((2460559439846684370440215053227998550747 : Rat) / 87635680611898993276600693830673488010) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 5. -/
def ep_Q2_019_partial_05_0241 : Poly :=
[
  term ((2460559439846684370440215053227998550747 : Rat) / 87635680611898993276600693830673488010) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((2460559439846684370440215053227998550747 : Rat) / 87635680611898993276600693830673488010) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2460559439846684370440215053227998550747 : Rat) / 87635680611898993276600693830673488010) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2460559439846684370440215053227998550747 : Rat) / 87635680611898993276600693830673488010) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 5. -/
theorem ep_Q2_019_partial_05_0241_valid :
    mulPoly ep_Q2_019_coefficient_05_0241
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0242 : Poly :=
[
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 242 for generator 5. -/
def ep_Q2_019_partial_05_0242 : Poly :=
[
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (14, 2), (15, 3), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 5. -/
theorem ep_Q2_019_partial_05_0242_valid :
    mulPoly ep_Q2_019_coefficient_05_0242
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0243 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 243 for generator 5. -/
def ep_Q2_019_partial_05_0243 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 5. -/
theorem ep_Q2_019_partial_05_0243_valid :
    mulPoly ep_Q2_019_coefficient_05_0243
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0244 : Poly :=
[
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 244 for generator 5. -/
def ep_Q2_019_partial_05_0244 : Poly :=
[
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 5. -/
theorem ep_Q2_019_partial_05_0244_valid :
    mulPoly ep_Q2_019_coefficient_05_0244
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0245 : Poly :=
[
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (12, 1), (16, 1)]
]

/-- Partial product 245 for generator 5. -/
def ep_Q2_019_partial_05_0245 : Poly :=
[
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 2), (12, 1), (16, 1)],
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 2), (12, 1), (16, 1)],
  term ((-73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (12, 1), (14, 2), (16, 1)],
  term ((-73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 5. -/
theorem ep_Q2_019_partial_05_0245_valid :
    mulPoly ep_Q2_019_coefficient_05_0245
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0246 : Poly :=
[
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 246 for generator 5. -/
def ep_Q2_019_partial_05_0246 : Poly :=
[
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 5. -/
theorem ep_Q2_019_partial_05_0246_valid :
    mulPoly ep_Q2_019_coefficient_05_0246
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0247 : Poly :=
[
  term ((5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (14, 1), (16, 1)]
]

/-- Partial product 247 for generator 5. -/
def ep_Q2_019_partial_05_0247 : Poly :=
[
  term ((5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(2, 2), (9, 2), (14, 1), (16, 1)],
  term ((5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(3, 2), (9, 2), (14, 1), (16, 1)],
  term ((-5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 5. -/
theorem ep_Q2_019_partial_05_0247_valid :
    mulPoly ep_Q2_019_coefficient_05_0247
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0248 : Poly :=
[
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 248 for generator 5. -/
def ep_Q2_019_partial_05_0248 : Poly :=
[
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (14, 2), (15, 2), (16, 1)],
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 5. -/
theorem ep_Q2_019_partial_05_0248_valid :
    mulPoly ep_Q2_019_coefficient_05_0248
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0249 : Poly :=
[
  term ((33355417788669761114140082601377201372531 : Rat) / 788721125507090939489406244476061392090) [(9, 2), (16, 1)]
]

/-- Partial product 249 for generator 5. -/
def ep_Q2_019_partial_05_0249 : Poly :=
[
  term ((33355417788669761114140082601377201372531 : Rat) / 788721125507090939489406244476061392090) [(2, 2), (9, 2), (16, 1)],
  term ((33355417788669761114140082601377201372531 : Rat) / 788721125507090939489406244476061392090) [(3, 2), (9, 2), (16, 1)],
  term ((-33355417788669761114140082601377201372531 : Rat) / 788721125507090939489406244476061392090) [(9, 2), (14, 2), (16, 1)],
  term ((-33355417788669761114140082601377201372531 : Rat) / 788721125507090939489406244476061392090) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 5. -/
theorem ep_Q2_019_partial_05_0249_valid :
    mulPoly ep_Q2_019_coefficient_05_0249
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0250 : Poly :=
[
  term ((-333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 250 for generator 5. -/
def ep_Q2_019_partial_05_0250 : Poly :=
[
  term ((-333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 5. -/
theorem ep_Q2_019_partial_05_0250_valid :
    mulPoly ep_Q2_019_coefficient_05_0250
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0251 : Poly :=
[
  term ((2540753855630490841315324295318046924196 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 251 for generator 5. -/
def ep_Q2_019_partial_05_0251 : Poly :=
[
  term ((2540753855630490841315324295318046924196 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2540753855630490841315324295318046924196 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2540753855630490841315324295318046924196 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2540753855630490841315324295318046924196 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 5. -/
theorem ep_Q2_019_partial_05_0251_valid :
    mulPoly ep_Q2_019_coefficient_05_0251
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0252 : Poly :=
[
  term ((10039222572707309617706951845772386356623 : Rat) / 244127967418861481270530504242590430885) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 252 for generator 5. -/
def ep_Q2_019_partial_05_0252 : Poly :=
[
  term ((10039222572707309617706951845772386356623 : Rat) / 244127967418861481270530504242590430885) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10039222572707309617706951845772386356623 : Rat) / 244127967418861481270530504242590430885) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10039222572707309617706951845772386356623 : Rat) / 244127967418861481270530504242590430885) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10039222572707309617706951845772386356623 : Rat) / 244127967418861481270530504242590430885) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 5. -/
theorem ep_Q2_019_partial_05_0252_valid :
    mulPoly ep_Q2_019_coefficient_05_0252
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0253 : Poly :=
[
  term ((1626325470701768028275360007275068567572 : Rat) / 43817840305949496638300346915336744005) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 253 for generator 5. -/
def ep_Q2_019_partial_05_0253 : Poly :=
[
  term ((1626325470701768028275360007275068567572 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1626325470701768028275360007275068567572 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1626325470701768028275360007275068567572 : Rat) / 43817840305949496638300346915336744005) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1626325470701768028275360007275068567572 : Rat) / 43817840305949496638300346915336744005) [(11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 5. -/
theorem ep_Q2_019_partial_05_0253_valid :
    mulPoly ep_Q2_019_coefficient_05_0253
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0254 : Poly :=
[
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 254 for generator 5. -/
def ep_Q2_019_partial_05_0254 : Poly :=
[
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 5. -/
theorem ep_Q2_019_partial_05_0254_valid :
    mulPoly ep_Q2_019_coefficient_05_0254
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0255 : Poly :=
[
  term ((-388148708923700369374112427933754575266 : Rat) / 43817840305949496638300346915336744005) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 255 for generator 5. -/
def ep_Q2_019_partial_05_0255 : Poly :=
[
  term ((-388148708923700369374112427933754575266 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-388148708923700369374112427933754575266 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((388148708923700369374112427933754575266 : Rat) / 43817840305949496638300346915336744005) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((388148708923700369374112427933754575266 : Rat) / 43817840305949496638300346915336744005) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 5. -/
theorem ep_Q2_019_partial_05_0255_valid :
    mulPoly ep_Q2_019_coefficient_05_0255
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0256 : Poly :=
[
  term ((-2047602028621779328449461061513066016639 : Rat) / 244127967418861481270530504242590430885) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 256 for generator 5. -/
def ep_Q2_019_partial_05_0256 : Poly :=
[
  term ((-2047602028621779328449461061513066016639 : Rat) / 244127967418861481270530504242590430885) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2047602028621779328449461061513066016639 : Rat) / 244127967418861481270530504242590430885) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2047602028621779328449461061513066016639 : Rat) / 244127967418861481270530504242590430885) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((2047602028621779328449461061513066016639 : Rat) / 244127967418861481270530504242590430885) [(11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 5. -/
theorem ep_Q2_019_partial_05_0256_valid :
    mulPoly ep_Q2_019_coefficient_05_0256
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0257 : Poly :=
[
  term ((114863317846035077991352581364739356047481 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 257 for generator 5. -/
def ep_Q2_019_partial_05_0257 : Poly :=
[
  term ((114863317846035077991352581364739356047481 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((114863317846035077991352581364739356047481 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-114863317846035077991352581364739356047481 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-114863317846035077991352581364739356047481 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 5. -/
theorem ep_Q2_019_partial_05_0257_valid :
    mulPoly ep_Q2_019_coefficient_05_0257
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0258 : Poly :=
[
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 258 for generator 5. -/
def ep_Q2_019_partial_05_0258 : Poly :=
[
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 5. -/
theorem ep_Q2_019_partial_05_0258_valid :
    mulPoly ep_Q2_019_coefficient_05_0258
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0259 : Poly :=
[
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 259 for generator 5. -/
def ep_Q2_019_partial_05_0259 : Poly :=
[
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(2, 2), (11, 2), (14, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(3, 2), (11, 2), (14, 1), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(11, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 5. -/
theorem ep_Q2_019_partial_05_0259_valid :
    mulPoly ep_Q2_019_coefficient_05_0259
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0260 : Poly :=
[
  term ((134567434821369808649561171242246922549 : Rat) / 630976900405672751591524995580849113672) [(11, 2), (16, 1)]
]

/-- Partial product 260 for generator 5. -/
def ep_Q2_019_partial_05_0260 : Poly :=
[
  term ((134567434821369808649561171242246922549 : Rat) / 630976900405672751591524995580849113672) [(2, 2), (11, 2), (16, 1)],
  term ((134567434821369808649561171242246922549 : Rat) / 630976900405672751591524995580849113672) [(3, 2), (11, 2), (16, 1)],
  term ((-134567434821369808649561171242246922549 : Rat) / 630976900405672751591524995580849113672) [(11, 2), (14, 2), (16, 1)],
  term ((-134567434821369808649561171242246922549 : Rat) / 630976900405672751591524995580849113672) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 5. -/
theorem ep_Q2_019_partial_05_0260_valid :
    mulPoly ep_Q2_019_coefficient_05_0260
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0261 : Poly :=
[
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 261 for generator 5. -/
def ep_Q2_019_partial_05_0261 : Poly :=
[
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 5. -/
theorem ep_Q2_019_partial_05_0261_valid :
    mulPoly ep_Q2_019_coefficient_05_0261
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0262 : Poly :=
[
  term ((263436432455006706325148133304114601968 : Rat) / 100523280701884139346689031158713706835) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 262 for generator 5. -/
def ep_Q2_019_partial_05_0262 : Poly :=
[
  term ((263436432455006706325148133304114601968 : Rat) / 100523280701884139346689031158713706835) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((263436432455006706325148133304114601968 : Rat) / 100523280701884139346689031158713706835) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-263436432455006706325148133304114601968 : Rat) / 100523280701884139346689031158713706835) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-263436432455006706325148133304114601968 : Rat) / 100523280701884139346689031158713706835) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 5. -/
theorem ep_Q2_019_partial_05_0262_valid :
    mulPoly ep_Q2_019_coefficient_05_0262
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0263 : Poly :=
[
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 263 for generator 5. -/
def ep_Q2_019_partial_05_0263 : Poly :=
[
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 5. -/
theorem ep_Q2_019_partial_05_0263_valid :
    mulPoly ep_Q2_019_coefficient_05_0263
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0264 : Poly :=
[
  term ((7008287011726943595837645185479017752 : Rat) / 515504003599405842803533493121608753) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 264 for generator 5. -/
def ep_Q2_019_partial_05_0264 : Poly :=
[
  term ((7008287011726943595837645185479017752 : Rat) / 515504003599405842803533493121608753) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((7008287011726943595837645185479017752 : Rat) / 515504003599405842803533493121608753) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((-7008287011726943595837645185479017752 : Rat) / 515504003599405842803533493121608753) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7008287011726943595837645185479017752 : Rat) / 515504003599405842803533493121608753) [(12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 5. -/
theorem ep_Q2_019_partial_05_0264_valid :
    mulPoly ep_Q2_019_coefficient_05_0264
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0265 : Poly :=
[
  term ((-6892134151232596676236064301960601284 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 265 for generator 5. -/
def ep_Q2_019_partial_05_0265 : Poly :=
[
  term ((-6892134151232596676236064301960601284 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-6892134151232596676236064301960601284 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((6892134151232596676236064301960601284 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((6892134151232596676236064301960601284 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 5. -/
theorem ep_Q2_019_partial_05_0265_valid :
    mulPoly ep_Q2_019_coefficient_05_0265
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0266 : Poly :=
[
  term ((-41605151992846554686868707747373244088 : Rat) / 43817840305949496638300346915336744005) [(12, 1), (16, 1)]
]

/-- Partial product 266 for generator 5. -/
def ep_Q2_019_partial_05_0266 : Poly :=
[
  term ((-41605151992846554686868707747373244088 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (12, 1), (16, 1)],
  term ((-41605151992846554686868707747373244088 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (12, 1), (16, 1)],
  term ((41605151992846554686868707747373244088 : Rat) / 43817840305949496638300346915336744005) [(12, 1), (14, 2), (16, 1)],
  term ((41605151992846554686868707747373244088 : Rat) / 43817840305949496638300346915336744005) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 5. -/
theorem ep_Q2_019_partial_05_0266_valid :
    mulPoly ep_Q2_019_coefficient_05_0266
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0267 : Poly :=
[
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 267 for generator 5. -/
def ep_Q2_019_partial_05_0267 : Poly :=
[
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (12, 2), (15, 2), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (12, 2), (15, 2), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(12, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 5. -/
theorem ep_Q2_019_partial_05_0267_valid :
    mulPoly ep_Q2_019_coefficient_05_0267
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0268 : Poly :=
[
  term ((-134083423548868944641719712508656102 : Rat) / 178848327779385700564491211899333649) [(12, 2), (16, 1)]
]

/-- Partial product 268 for generator 5. -/
def ep_Q2_019_partial_05_0268 : Poly :=
[
  term ((-134083423548868944641719712508656102 : Rat) / 178848327779385700564491211899333649) [(2, 2), (12, 2), (16, 1)],
  term ((-134083423548868944641719712508656102 : Rat) / 178848327779385700564491211899333649) [(3, 2), (12, 2), (16, 1)],
  term ((134083423548868944641719712508656102 : Rat) / 178848327779385700564491211899333649) [(12, 2), (14, 2), (16, 1)],
  term ((134083423548868944641719712508656102 : Rat) / 178848327779385700564491211899333649) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 5. -/
theorem ep_Q2_019_partial_05_0268_valid :
    mulPoly ep_Q2_019_coefficient_05_0268
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0269 : Poly :=
[
  term ((-2069615662859159793936241984772891868 : Rat) / 6259691472278499519757192416476677715) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 269 for generator 5. -/
def ep_Q2_019_partial_05_0269 : Poly :=
[
  term ((-2069615662859159793936241984772891868 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2069615662859159793936241984772891868 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2069615662859159793936241984772891868 : Rat) / 6259691472278499519757192416476677715) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2069615662859159793936241984772891868 : Rat) / 6259691472278499519757192416476677715) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 5. -/
theorem ep_Q2_019_partial_05_0269_valid :
    mulPoly ep_Q2_019_coefficient_05_0269
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0270 : Poly :=
[
  term ((16260682099396546734908649776567655776413 : Rat) / 683558308772812147557485411879253206478) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 5. -/
def ep_Q2_019_partial_05_0270 : Poly :=
[
  term ((16260682099396546734908649776567655776413 : Rat) / 683558308772812147557485411879253206478) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((16260682099396546734908649776567655776413 : Rat) / 683558308772812147557485411879253206478) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16260682099396546734908649776567655776413 : Rat) / 683558308772812147557485411879253206478) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16260682099396546734908649776567655776413 : Rat) / 683558308772812147557485411879253206478) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 5. -/
theorem ep_Q2_019_partial_05_0270_valid :
    mulPoly ep_Q2_019_coefficient_05_0270
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0271 : Poly :=
[
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 271 for generator 5. -/
def ep_Q2_019_partial_05_0271 : Poly :=
[
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 5. -/
theorem ep_Q2_019_partial_05_0271_valid :
    mulPoly ep_Q2_019_coefficient_05_0271
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0272 : Poly :=
[
  term ((-3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 272 for generator 5. -/
def ep_Q2_019_partial_05_0272 : Poly :=
[
  term ((-3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(2, 2), (13, 2), (14, 1), (16, 1)],
  term ((-3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(3, 2), (13, 2), (14, 1), (16, 1)],
  term ((3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(13, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 5. -/
theorem ep_Q2_019_partial_05_0272_valid :
    mulPoly ep_Q2_019_coefficient_05_0272
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0273 : Poly :=
[
  term ((3343065261362252388457836180878176014 : Rat) / 894241638896928502822456059496668245) [(13, 2), (16, 1)]
]

/-- Partial product 273 for generator 5. -/
def ep_Q2_019_partial_05_0273 : Poly :=
[
  term ((3343065261362252388457836180878176014 : Rat) / 894241638896928502822456059496668245) [(2, 2), (13, 2), (16, 1)],
  term ((3343065261362252388457836180878176014 : Rat) / 894241638896928502822456059496668245) [(3, 2), (13, 2), (16, 1)],
  term ((-3343065261362252388457836180878176014 : Rat) / 894241638896928502822456059496668245) [(13, 2), (14, 2), (16, 1)],
  term ((-3343065261362252388457836180878176014 : Rat) / 894241638896928502822456059496668245) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 5. -/
theorem ep_Q2_019_partial_05_0273_valid :
    mulPoly ep_Q2_019_coefficient_05_0273
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0274 : Poly :=
[
  term ((-140716523271977608485236177216676960 : Rat) / 1251938294455699903951438483295335543) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 274 for generator 5. -/
def ep_Q2_019_partial_05_0274 : Poly :=
[
  term ((-140716523271977608485236177216676960 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((-140716523271977608485236177216676960 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((140716523271977608485236177216676960 : Rat) / 1251938294455699903951438483295335543) [(14, 1), (15, 4), (16, 1)],
  term ((140716523271977608485236177216676960 : Rat) / 1251938294455699903951438483295335543) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 5. -/
theorem ep_Q2_019_partial_05_0274_valid :
    mulPoly ep_Q2_019_coefficient_05_0274
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0275 : Poly :=
[
  term ((1683605116232864911076020117783642043221 : Rat) / 175271361223797986553201387661346976020) [(14, 1), (16, 1)]
]

/-- Partial product 275 for generator 5. -/
def ep_Q2_019_partial_05_0275 : Poly :=
[
  term ((1683605116232864911076020117783642043221 : Rat) / 175271361223797986553201387661346976020) [(2, 2), (14, 1), (16, 1)],
  term ((1683605116232864911076020117783642043221 : Rat) / 175271361223797986553201387661346976020) [(3, 2), (14, 1), (16, 1)],
  term ((-1683605116232864911076020117783642043221 : Rat) / 175271361223797986553201387661346976020) [(14, 1), (15, 2), (16, 1)],
  term ((-1683605116232864911076020117783642043221 : Rat) / 175271361223797986553201387661346976020) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 5. -/
theorem ep_Q2_019_partial_05_0275_valid :
    mulPoly ep_Q2_019_coefficient_05_0275
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0276 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 276 for generator 5. -/
def ep_Q2_019_partial_05_0276 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (14, 2), (15, 2), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(14, 2), (15, 4), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(14, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 5. -/
theorem ep_Q2_019_partial_05_0276_valid :
    mulPoly ep_Q2_019_coefficient_05_0276
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0277 : Poly :=
[
  term ((-7049789345612124413439534375655766139319 : Rat) / 394360562753545469744703122238030696045) [(14, 2), (16, 1)]
]

/-- Partial product 277 for generator 5. -/
def ep_Q2_019_partial_05_0277 : Poly :=
[
  term ((-7049789345612124413439534375655766139319 : Rat) / 394360562753545469744703122238030696045) [(2, 2), (14, 2), (16, 1)],
  term ((-7049789345612124413439534375655766139319 : Rat) / 394360562753545469744703122238030696045) [(3, 2), (14, 2), (16, 1)],
  term ((7049789345612124413439534375655766139319 : Rat) / 394360562753545469744703122238030696045) [(14, 2), (15, 2), (16, 1)],
  term ((7049789345612124413439534375655766139319 : Rat) / 394360562753545469744703122238030696045) [(14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 5. -/
theorem ep_Q2_019_partial_05_0277_valid :
    mulPoly ep_Q2_019_coefficient_05_0277
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0278 : Poly :=
[
  term ((-476723604510357020486605049219463986074613 : Rat) / 10253374631592182213362281178188798097170) [(15, 2), (16, 1)]
]

/-- Partial product 278 for generator 5. -/
def ep_Q2_019_partial_05_0278 : Poly :=
[
  term ((-476723604510357020486605049219463986074613 : Rat) / 10253374631592182213362281178188798097170) [(2, 2), (15, 2), (16, 1)],
  term ((-476723604510357020486605049219463986074613 : Rat) / 10253374631592182213362281178188798097170) [(3, 2), (15, 2), (16, 1)],
  term ((476723604510357020486605049219463986074613 : Rat) / 10253374631592182213362281178188798097170) [(14, 2), (15, 2), (16, 1)],
  term ((476723604510357020486605049219463986074613 : Rat) / 10253374631592182213362281178188798097170) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 5. -/
theorem ep_Q2_019_partial_05_0278_valid :
    mulPoly ep_Q2_019_coefficient_05_0278
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0279 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(15, 4), (16, 1)]
]

/-- Partial product 279 for generator 5. -/
def ep_Q2_019_partial_05_0279 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (15, 4), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (15, 4), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(14, 2), (15, 4), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 5. -/
theorem ep_Q2_019_partial_05_0279_valid :
    mulPoly ep_Q2_019_coefficient_05_0279
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0280 : Poly :=
[
  term ((466790893945764511398802839818067713880187 : Rat) / 12619538008113455031830499911616982273440) [(16, 1)]
]

/-- Partial product 280 for generator 5. -/
def ep_Q2_019_partial_05_0280 : Poly :=
[
  term ((466790893945764511398802839818067713880187 : Rat) / 12619538008113455031830499911616982273440) [(2, 2), (16, 1)],
  term ((466790893945764511398802839818067713880187 : Rat) / 12619538008113455031830499911616982273440) [(3, 2), (16, 1)],
  term ((-466790893945764511398802839818067713880187 : Rat) / 12619538008113455031830499911616982273440) [(14, 2), (16, 1)],
  term ((-466790893945764511398802839818067713880187 : Rat) / 12619538008113455031830499911616982273440) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 5. -/
theorem ep_Q2_019_partial_05_0280_valid :
    mulPoly ep_Q2_019_coefficient_05_0280
        ep_Q2_019_generator_05_0200_0280 =
      ep_Q2_019_partial_05_0280 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_05_0200_0280 : List Poly :=
[
  ep_Q2_019_partial_05_0200,
  ep_Q2_019_partial_05_0201,
  ep_Q2_019_partial_05_0202,
  ep_Q2_019_partial_05_0203,
  ep_Q2_019_partial_05_0204,
  ep_Q2_019_partial_05_0205,
  ep_Q2_019_partial_05_0206,
  ep_Q2_019_partial_05_0207,
  ep_Q2_019_partial_05_0208,
  ep_Q2_019_partial_05_0209,
  ep_Q2_019_partial_05_0210,
  ep_Q2_019_partial_05_0211,
  ep_Q2_019_partial_05_0212,
  ep_Q2_019_partial_05_0213,
  ep_Q2_019_partial_05_0214,
  ep_Q2_019_partial_05_0215,
  ep_Q2_019_partial_05_0216,
  ep_Q2_019_partial_05_0217,
  ep_Q2_019_partial_05_0218,
  ep_Q2_019_partial_05_0219,
  ep_Q2_019_partial_05_0220,
  ep_Q2_019_partial_05_0221,
  ep_Q2_019_partial_05_0222,
  ep_Q2_019_partial_05_0223,
  ep_Q2_019_partial_05_0224,
  ep_Q2_019_partial_05_0225,
  ep_Q2_019_partial_05_0226,
  ep_Q2_019_partial_05_0227,
  ep_Q2_019_partial_05_0228,
  ep_Q2_019_partial_05_0229,
  ep_Q2_019_partial_05_0230,
  ep_Q2_019_partial_05_0231,
  ep_Q2_019_partial_05_0232,
  ep_Q2_019_partial_05_0233,
  ep_Q2_019_partial_05_0234,
  ep_Q2_019_partial_05_0235,
  ep_Q2_019_partial_05_0236,
  ep_Q2_019_partial_05_0237,
  ep_Q2_019_partial_05_0238,
  ep_Q2_019_partial_05_0239,
  ep_Q2_019_partial_05_0240,
  ep_Q2_019_partial_05_0241,
  ep_Q2_019_partial_05_0242,
  ep_Q2_019_partial_05_0243,
  ep_Q2_019_partial_05_0244,
  ep_Q2_019_partial_05_0245,
  ep_Q2_019_partial_05_0246,
  ep_Q2_019_partial_05_0247,
  ep_Q2_019_partial_05_0248,
  ep_Q2_019_partial_05_0249,
  ep_Q2_019_partial_05_0250,
  ep_Q2_019_partial_05_0251,
  ep_Q2_019_partial_05_0252,
  ep_Q2_019_partial_05_0253,
  ep_Q2_019_partial_05_0254,
  ep_Q2_019_partial_05_0255,
  ep_Q2_019_partial_05_0256,
  ep_Q2_019_partial_05_0257,
  ep_Q2_019_partial_05_0258,
  ep_Q2_019_partial_05_0259,
  ep_Q2_019_partial_05_0260,
  ep_Q2_019_partial_05_0261,
  ep_Q2_019_partial_05_0262,
  ep_Q2_019_partial_05_0263,
  ep_Q2_019_partial_05_0264,
  ep_Q2_019_partial_05_0265,
  ep_Q2_019_partial_05_0266,
  ep_Q2_019_partial_05_0267,
  ep_Q2_019_partial_05_0268,
  ep_Q2_019_partial_05_0269,
  ep_Q2_019_partial_05_0270,
  ep_Q2_019_partial_05_0271,
  ep_Q2_019_partial_05_0272,
  ep_Q2_019_partial_05_0273,
  ep_Q2_019_partial_05_0274,
  ep_Q2_019_partial_05_0275,
  ep_Q2_019_partial_05_0276,
  ep_Q2_019_partial_05_0277,
  ep_Q2_019_partial_05_0278,
  ep_Q2_019_partial_05_0279,
  ep_Q2_019_partial_05_0280
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_05_0200_0280 : Poly :=
[
  term ((9915782878446100008423286602736194575279 : Rat) / 87635680611898993276600693830673488010) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term ((-13752294263307734127985218974254314784 : Rat) / 178848327779385700564491211899333649) [(2, 2), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-460918296718660877985356527678163127272 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((142159058145265415508733781665912160168 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-5172226754661521263280608587558500256 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2884006467938487483992010575942309972893 : Rat) / 131453520917848489914901040746010232015) [(2, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((5762592997122118035639076434459599904 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-21921946681871069583689631590509069178971 : Rat) / 262907041835696979829802081492020464030) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((5979918337544489898251329971467585856 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-180632751376116949451127422632624046292 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((1707083080091511759049569657724487856 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2828346690898131894054143233575894901 : Rat) / 631229392162537766698204277291765820) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 2), (8, 1), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 2), (12, 1), (16, 1)],
  term ((12592227379876117996335162240546175896 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 2), (16, 1)],
  term ((1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8216738889742585343822577501560038992 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (8, 1), (12, 1), (16, 1)],
  term ((-23955425217947870378193465275328979872 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (8, 1), (14, 1), (16, 1)],
  term ((1816095637945422485204253559925304744 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (8, 1), (16, 1)],
  term ((547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(2, 2), (8, 2), (16, 1)],
  term ((-36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((193020634023349733142957715202225217952 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2629455799234597957468869379350364846261 : Rat) / 394360562753545469744703122238030696045) [(2, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((186538783359255546328951720763279720592 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((19832642032609962520370392308368167703063 : Rat) / 315488450202836375795762497790424556836) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(2, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11068969376785589669299766049197200795330 : Rat) / 341779154386406073778742705939626603239) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1286009543164591680617379394037225365492 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-357985038821072541410122455233095843526 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-5035244688057006806659828859947413079952 : Rat) / 131453520917848489914901040746010232015) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((2460559439846684370440215053227998550747 : Rat) / 87635680611898993276600693830673488010) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 2), (12, 1), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(2, 2), (9, 2), (14, 1), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((33355417788669761114140082601377201372531 : Rat) / 788721125507090939489406244476061392090) [(2, 2), (9, 2), (16, 1)],
  term ((-333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2540753855630490841315324295318046924196 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10039222572707309617706951845772386356623 : Rat) / 244127967418861481270530504242590430885) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1626325470701768028275360007275068567572 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-388148708923700369374112427933754575266 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2047602028621779328449461061513066016639 : Rat) / 244127967418861481270530504242590430885) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((114863317846035077991352581364739356047481 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(2, 2), (11, 2), (14, 1), (16, 1)],
  term ((134567434821369808649561171242246922549 : Rat) / 630976900405672751591524995580849113672) [(2, 2), (11, 2), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((263436432455006706325148133304114601968 : Rat) / 100523280701884139346689031158713706835) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((7008287011726943595837645185479017752 : Rat) / 515504003599405842803533493121608753) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((-6892134151232596676236064301960601284 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-41605151992846554686868707747373244088 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (12, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (12, 2), (15, 2), (16, 1)],
  term ((-134083423548868944641719712508656102 : Rat) / 178848327779385700564491211899333649) [(2, 2), (12, 2), (16, 1)],
  term ((-2069615662859159793936241984772891868 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16260682099396546734908649776567655776413 : Rat) / 683558308772812147557485411879253206478) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((-3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(2, 2), (13, 2), (14, 1), (16, 1)],
  term ((3343065261362252388457836180878176014 : Rat) / 894241638896928502822456059496668245) [(2, 2), (13, 2), (16, 1)],
  term ((-140716523271977608485236177216676960 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((1683605116232864911076020117783642043221 : Rat) / 175271361223797986553201387661346976020) [(2, 2), (14, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (14, 2), (15, 2), (16, 1)],
  term ((-7049789345612124413439534375655766139319 : Rat) / 394360562753545469744703122238030696045) [(2, 2), (14, 2), (16, 1)],
  term ((-476723604510357020486605049219463986074613 : Rat) / 10253374631592182213362281178188798097170) [(2, 2), (15, 2), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (15, 4), (16, 1)],
  term ((466790893945764511398802839818067713880187 : Rat) / 12619538008113455031830499911616982273440) [(2, 2), (16, 1)],
  term ((9915782878446100008423286602736194575279 : Rat) / 87635680611898993276600693830673488010) [(3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-13752294263307734127985218974254314784 : Rat) / 178848327779385700564491211899333649) [(3, 2), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-460918296718660877985356527678163127272 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((142159058145265415508733781665912160168 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-5172226754661521263280608587558500256 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2884006467938487483992010575942309972893 : Rat) / 131453520917848489914901040746010232015) [(3, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((5762592997122118035639076434459599904 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-21921946681871069583689631590509069178971 : Rat) / 262907041835696979829802081492020464030) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((5979918337544489898251329971467585856 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-180632751376116949451127422632624046292 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((1707083080091511759049569657724487856 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2828346690898131894054143233575894901 : Rat) / 631229392162537766698204277291765820) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 2), (8, 1), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 2), (12, 1), (16, 1)],
  term ((12592227379876117996335162240546175896 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 2), (16, 1)],
  term ((1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8216738889742585343822577501560038992 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (8, 1), (12, 1), (16, 1)],
  term ((-23955425217947870378193465275328979872 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (8, 1), (14, 1), (16, 1)],
  term ((1816095637945422485204253559925304744 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (8, 1), (16, 1)],
  term ((547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(3, 2), (8, 2), (16, 1)],
  term ((-36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((193020634023349733142957715202225217952 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2629455799234597957468869379350364846261 : Rat) / 394360562753545469744703122238030696045) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((186538783359255546328951720763279720592 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((19832642032609962520370392308368167703063 : Rat) / 315488450202836375795762497790424556836) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(3, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11068969376785589669299766049197200795330 : Rat) / 341779154386406073778742705939626603239) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1286009543164591680617379394037225365492 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-357985038821072541410122455233095843526 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-5035244688057006806659828859947413079952 : Rat) / 131453520917848489914901040746010232015) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((2460559439846684370440215053227998550747 : Rat) / 87635680611898993276600693830673488010) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 2), (12, 1), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(3, 2), (9, 2), (14, 1), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((33355417788669761114140082601377201372531 : Rat) / 788721125507090939489406244476061392090) [(3, 2), (9, 2), (16, 1)],
  term ((-333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2540753855630490841315324295318046924196 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10039222572707309617706951845772386356623 : Rat) / 244127967418861481270530504242590430885) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1626325470701768028275360007275068567572 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-388148708923700369374112427933754575266 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2047602028621779328449461061513066016639 : Rat) / 244127967418861481270530504242590430885) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((114863317846035077991352581364739356047481 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(3, 2), (11, 2), (14, 1), (16, 1)],
  term ((134567434821369808649561171242246922549 : Rat) / 630976900405672751591524995580849113672) [(3, 2), (11, 2), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((263436432455006706325148133304114601968 : Rat) / 100523280701884139346689031158713706835) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((7008287011726943595837645185479017752 : Rat) / 515504003599405842803533493121608753) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((-6892134151232596676236064301960601284 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-41605151992846554686868707747373244088 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (12, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (12, 2), (15, 2), (16, 1)],
  term ((-134083423548868944641719712508656102 : Rat) / 178848327779385700564491211899333649) [(3, 2), (12, 2), (16, 1)],
  term ((-2069615662859159793936241984772891868 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16260682099396546734908649776567655776413 : Rat) / 683558308772812147557485411879253206478) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((-3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(3, 2), (13, 2), (14, 1), (16, 1)],
  term ((3343065261362252388457836180878176014 : Rat) / 894241638896928502822456059496668245) [(3, 2), (13, 2), (16, 1)],
  term ((-140716523271977608485236177216676960 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((1683605116232864911076020117783642043221 : Rat) / 175271361223797986553201387661346976020) [(3, 2), (14, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term ((-7049789345612124413439534375655766139319 : Rat) / 394360562753545469744703122238030696045) [(3, 2), (14, 2), (16, 1)],
  term ((-476723604510357020486605049219463986074613 : Rat) / 10253374631592182213362281178188798097170) [(3, 2), (15, 2), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (15, 4), (16, 1)],
  term ((466790893945764511398802839818067713880187 : Rat) / 12619538008113455031830499911616982273440) [(3, 2), (16, 1)],
  term ((-9915782878446100008423286602736194575279 : Rat) / 87635680611898993276600693830673488010) [(7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-9915782878446100008423286602736194575279 : Rat) / 87635680611898993276600693830673488010) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((13752294263307734127985218974254314784 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((13752294263307734127985218974254314784 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((460918296718660877985356527678163127272 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((460918296718660877985356527678163127272 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 2), (15, 3), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-142159058145265415508733781665912160168 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (12, 1), (14, 3), (16, 1)],
  term ((-142159058145265415508733781665912160168 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((5172226754661521263280608587558500256 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((5172226754661521263280608587558500256 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2884006467938487483992010575942309972893 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5762592997122118035639076434459599904 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((21921946681871069583689631590509069178971 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2884006467938487483992010575942309972893 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (11, 1), (14, 3), (16, 1)],
  term ((21921946681871069583689631590509069178971 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5762592997122118035639076434459599904 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (15, 4), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-5979918337544489898251329971467585856 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((180632751376116949451127422632624046292 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5979918337544489898251329971467585856 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (14, 3), (16, 1)],
  term ((180632751376116949451127422632624046292 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-1707083080091511759049569657724487856 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((2828346690898131894054143233575894901 : Rat) / 631229392162537766698204277291765820) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (14, 2), (15, 3), (16, 1)],
  term ((-1707083080091511759049569657724487856 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (14, 4), (15, 1), (16, 1)],
  term ((2828346690898131894054143233575894901 : Rat) / 631229392162537766698204277291765820) [(7, 1), (15, 3), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (15, 5), (16, 1)],
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (8, 1), (14, 2), (16, 1)],
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (12, 1), (14, 2), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-12592227379876117996335162240546175896 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (14, 2), (16, 1)],
  term ((-12592227379876117996335162240546175896 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (15, 2), (16, 1)],
  term ((-1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((8216738889742585343822577501560038992 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 1), (14, 2), (16, 1)],
  term ((8216738889742585343822577501560038992 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((23955425217947870378193465275328979872 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1816095637945422485204253559925304744 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (14, 2), (16, 1)],
  term ((23955425217947870378193465275328979872 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (14, 3), (16, 1)],
  term ((-1816095637945422485204253559925304744 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (15, 2), (16, 1)],
  term ((-547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(8, 2), (14, 2), (16, 1)],
  term ((-547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(8, 2), (15, 2), (16, 1)],
  term ((36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-193020634023349733142957715202225217952 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-193020634023349733142957715202225217952 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((2629455799234597957468869379350364846261 : Rat) / 394360562753545469744703122238030696045) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-186538783359255546328951720763279720592 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-19832642032609962520370392308368167703063 : Rat) / 315488450202836375795762497790424556836) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((2629455799234597957468869379350364846261 : Rat) / 394360562753545469744703122238030696045) [(9, 1), (11, 1), (14, 3), (16, 1)],
  term ((-19832642032609962520370392308368167703063 : Rat) / 315488450202836375795762497790424556836) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-186538783359255546328951720763279720592 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (15, 4), (16, 1)],
  term ((-666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((11068969376785589669299766049197200795330 : Rat) / 341779154386406073778742705939626603239) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((11068969376785589669299766049197200795330 : Rat) / 341779154386406073778742705939626603239) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((1286009543164591680617379394037225365492 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((357985038821072541410122455233095843526 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((1286009543164591680617379394037225365492 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (14, 3), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (13, 1), (14, 4), (16, 1)],
  term ((357985038821072541410122455233095843526 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((5035244688057006806659828859947413079952 : Rat) / 131453520917848489914901040746010232015) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2460559439846684370440215053227998550747 : Rat) / 87635680611898993276600693830673488010) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (14, 2), (15, 3), (16, 1)],
  term ((5035244688057006806659828859947413079952 : Rat) / 131453520917848489914901040746010232015) [(9, 1), (14, 3), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (14, 4), (15, 1), (16, 1)],
  term ((-2460559439846684370440215053227998550747 : Rat) / 87635680611898993276600693830673488010) [(9, 1), (15, 3), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (15, 5), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (12, 1), (14, 2), (16, 1)],
  term ((-73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (14, 2), (15, 2), (16, 1)],
  term ((-33355417788669761114140082601377201372531 : Rat) / 788721125507090939489406244476061392090) [(9, 2), (14, 2), (16, 1)],
  term ((-5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (14, 3), (16, 1)],
  term ((-33355417788669761114140082601377201372531 : Rat) / 788721125507090939489406244476061392090) [(9, 2), (15, 2), (16, 1)],
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (15, 4), (16, 1)],
  term ((333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2540753855630490841315324295318046924196 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-10039222572707309617706951845772386356623 : Rat) / 244127967418861481270530504242590430885) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2540753855630490841315324295318046924196 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-10039222572707309617706951845772386356623 : Rat) / 244127967418861481270530504242590430885) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1626325470701768028275360007275068567572 : Rat) / 43817840305949496638300346915336744005) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((388148708923700369374112427933754575266 : Rat) / 43817840305949496638300346915336744005) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1626325470701768028275360007275068567572 : Rat) / 43817840305949496638300346915336744005) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((388148708923700369374112427933754575266 : Rat) / 43817840305949496638300346915336744005) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((2047602028621779328449461061513066016639 : Rat) / 244127967418861481270530504242590430885) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-114863317846035077991352581364739356047481 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((2047602028621779328449461061513066016639 : Rat) / 244127967418861481270530504242590430885) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-114863317846035077991352581364739356047481 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (15, 3), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(11, 1), (15, 5), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-134567434821369808649561171242246922549 : Rat) / 630976900405672751591524995580849113672) [(11, 2), (14, 2), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(11, 2), (14, 3), (16, 1)],
  term ((-134567434821369808649561171242246922549 : Rat) / 630976900405672751591524995580849113672) [(11, 2), (15, 2), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-263436432455006706325148133304114601968 : Rat) / 100523280701884139346689031158713706835) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-263436432455006706325148133304114601968 : Rat) / 100523280701884139346689031158713706835) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-7008287011726943595837645185479017752 : Rat) / 515504003599405842803533493121608753) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((6892134151232596676236064301960601284 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((41605151992846554686868707747373244088 : Rat) / 43817840305949496638300346915336744005) [(12, 1), (14, 2), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (14, 3), (15, 2), (16, 1)],
  term ((-7008287011726943595837645185479017752 : Rat) / 515504003599405842803533493121608753) [(12, 1), (14, 3), (16, 1)],
  term ((41605151992846554686868707747373244088 : Rat) / 43817840305949496638300346915336744005) [(12, 1), (15, 2), (16, 1)],
  term ((6892134151232596676236064301960601284 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (15, 4), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((134083423548868944641719712508656102 : Rat) / 178848327779385700564491211899333649) [(12, 2), (14, 2), (16, 1)],
  term ((134083423548868944641719712508656102 : Rat) / 178848327779385700564491211899333649) [(12, 2), (15, 2), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(12, 2), (15, 4), (16, 1)],
  term ((2069615662859159793936241984772891868 : Rat) / 6259691472278499519757192416476677715) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-16260682099396546734908649776567655776413 : Rat) / 683558308772812147557485411879253206478) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((2069615662859159793936241984772891868 : Rat) / 6259691472278499519757192416476677715) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-16260682099396546734908649776567655776413 : Rat) / 683558308772812147557485411879253206478) [(13, 1), (15, 3), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(13, 1), (15, 5), (16, 1)],
  term ((3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3343065261362252388457836180878176014 : Rat) / 894241638896928502822456059496668245) [(13, 2), (14, 2), (16, 1)],
  term ((3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(13, 2), (14, 3), (16, 1)],
  term ((-3343065261362252388457836180878176014 : Rat) / 894241638896928502822456059496668245) [(13, 2), (15, 2), (16, 1)],
  term ((-1683605116232864911076020117783642043221 : Rat) / 175271361223797986553201387661346976020) [(14, 1), (15, 2), (16, 1)],
  term ((140716523271977608485236177216676960 : Rat) / 1251938294455699903951438483295335543) [(14, 1), (15, 4), (16, 1)],
  term ((660018127496272255236032942986513905696907 : Rat) / 10253374631592182213362281178188798097170) [(14, 2), (15, 2), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(14, 2), (15, 4), (16, 1)],
  term ((-466790893945764511398802839818067713880187 : Rat) / 12619538008113455031830499911616982273440) [(14, 2), (16, 1)],
  term ((140716523271977608485236177216676960 : Rat) / 1251938294455699903951438483295335543) [(14, 3), (15, 2), (16, 1)],
  term ((-1683605116232864911076020117783642043221 : Rat) / 175271361223797986553201387661346976020) [(14, 3), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(14, 4), (15, 2), (16, 1)],
  term ((7049789345612124413439534375655766139319 : Rat) / 394360562753545469744703122238030696045) [(14, 4), (16, 1)],
  term ((-466790893945764511398802839818067713880187 : Rat) / 12619538008113455031830499911616982273440) [(15, 2), (16, 1)],
  term ((476723604510357020486605049219463986074613 : Rat) / 10253374631592182213362281178188798097170) [(15, 4), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 200 through 280. -/
theorem ep_Q2_019_block_05_0200_0280_valid :
    checkProductSumEq ep_Q2_019_partials_05_0200_0280
      ep_Q2_019_block_05_0200_0280 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
