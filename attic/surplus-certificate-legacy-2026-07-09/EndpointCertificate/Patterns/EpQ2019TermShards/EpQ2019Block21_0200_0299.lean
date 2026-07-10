/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 21:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_21_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0200 : Poly :=
[
  term ((-464706514765395894143985115828193631968 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 200 for generator 21. -/
def ep_Q2_019_partial_21_0200 : Poly :=
[
  term ((-929413029530791788287970231656387263936 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((464706514765395894143985115828193631968 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 21. -/
theorem ep_Q2_019_partial_21_0200_valid :
    mulPoly ep_Q2_019_coefficient_21_0200
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0201 : Poly :=
[
  term ((-3782613331824858417007031671910588840279 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 21. -/
def ep_Q2_019_partial_21_0201 : Poly :=
[
  term ((-7565226663649716834014063343821177680558 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((3782613331824858417007031671910588840279 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 21. -/
theorem ep_Q2_019_partial_21_0201_valid :
    mulPoly ep_Q2_019_coefficient_21_0201
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0202 : Poly :=
[
  term ((-1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 202 for generator 21. -/
def ep_Q2_019_partial_21_0202 : Poly :=
[
  term ((1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-2844110064578040921104226517855619712 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 21. -/
theorem ep_Q2_019_partial_21_0202_valid :
    mulPoly ep_Q2_019_coefficient_21_0202
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0203 : Poly :=
[
  term ((314323987169262415026054702292026293816 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 203 for generator 21. -/
def ep_Q2_019_partial_21_0203 : Poly :=
[
  term ((628647974338524830052109404584052587632 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-314323987169262415026054702292026293816 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 21. -/
theorem ep_Q2_019_partial_21_0203_valid :
    mulPoly ep_Q2_019_coefficient_21_0203
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0204 : Poly :=
[
  term ((-156843616261247246328565140980779699408 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 204 for generator 21. -/
def ep_Q2_019_partial_21_0204 : Poly :=
[
  term ((156843616261247246328565140980779699408 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-313687232522494492657130281961559398816 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (6, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 21. -/
theorem ep_Q2_019_partial_21_0204_valid :
    mulPoly ep_Q2_019_coefficient_21_0204
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0205 : Poly :=
[
  term ((2968953856829624995542262885132157508103 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 21. -/
def ep_Q2_019_partial_21_0205 : Poly :=
[
  term ((-2968953856829624995542262885132157508103 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((5937907713659249991084525770264315016206 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 21. -/
theorem ep_Q2_019_partial_21_0205_valid :
    mulPoly ep_Q2_019_coefficient_21_0205
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0206 : Poly :=
[
  term ((-1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 206 for generator 21. -/
def ep_Q2_019_partial_21_0206 : Poly :=
[
  term ((-2844110064578040921104226517855619712 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 21. -/
theorem ep_Q2_019_partial_21_0206_valid :
    mulPoly ep_Q2_019_coefficient_21_0206
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0207 : Poly :=
[
  term ((314323987169262415026054702292026293816 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 207 for generator 21. -/
def ep_Q2_019_partial_21_0207 : Poly :=
[
  term ((628647974338524830052109404584052587632 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-314323987169262415026054702292026293816 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 21. -/
theorem ep_Q2_019_partial_21_0207_valid :
    mulPoly ep_Q2_019_coefficient_21_0207
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0208 : Poly :=
[
  term ((3808151454781969056659877553645891597632 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 208 for generator 21. -/
def ep_Q2_019_partial_21_0208 : Poly :=
[
  term ((7616302909563938113319755107291783195264 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3808151454781969056659877553645891597632 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 21. -/
theorem ep_Q2_019_partial_21_0208_valid :
    mulPoly ep_Q2_019_coefficient_21_0208
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0209 : Poly :=
[
  term ((-33472138549610040757073877117177193032 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 209 for generator 21. -/
def ep_Q2_019_partial_21_0209 : Poly :=
[
  term ((-66944277099220081514147754234354386064 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((33472138549610040757073877117177193032 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 21. -/
theorem ep_Q2_019_partial_21_0209_valid :
    mulPoly ep_Q2_019_coefficient_21_0209
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0210 : Poly :=
[
  term ((-253564044921693126362058129218085432462 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 21. -/
def ep_Q2_019_partial_21_0210 : Poly :=
[
  term ((-507128089843386252724116258436170864924 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((253564044921693126362058129218085432462 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 21. -/
theorem ep_Q2_019_partial_21_0210_valid :
    mulPoly ep_Q2_019_coefficient_21_0210
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0211 : Poly :=
[
  term ((16200118927604067084781012584052029312 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 21. -/
def ep_Q2_019_partial_21_0211 : Poly :=
[
  term ((32400237855208134169562025168104058624 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-16200118927604067084781012584052029312 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 21. -/
theorem ep_Q2_019_partial_21_0211_valid :
    mulPoly ep_Q2_019_coefficient_21_0211
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0212 : Poly :=
[
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 212 for generator 21. -/
def ep_Q2_019_partial_21_0212 : Poly :=
[
  term ((769612413105665019457609919098680823040 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 21. -/
theorem ep_Q2_019_partial_21_0212_valid :
    mulPoly ep_Q2_019_coefficient_21_0212
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0213 : Poly :=
[
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 21. -/
def ep_Q2_019_partial_21_0213 : Poly :=
[
  term ((741648245990769512846588699893436429888 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 21. -/
theorem ep_Q2_019_partial_21_0213_valid :
    mulPoly ep_Q2_019_coefficient_21_0213
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0214 : Poly :=
[
  term ((-1034738767143564525669822516024958574424 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 214 for generator 21. -/
def ep_Q2_019_partial_21_0214 : Poly :=
[
  term ((-2069477534287129051339645032049917148848 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((1034738767143564525669822516024958574424 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 21. -/
theorem ep_Q2_019_partial_21_0214_valid :
    mulPoly ep_Q2_019_coefficient_21_0214
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0215 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 215 for generator 21. -/
def ep_Q2_019_partial_21_0215 : Poly :=
[
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (9, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 21. -/
theorem ep_Q2_019_partial_21_0215_valid :
    mulPoly ep_Q2_019_coefficient_21_0215
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0216 : Poly :=
[
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 21. -/
def ep_Q2_019_partial_21_0216 : Poly :=
[
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 21. -/
theorem ep_Q2_019_partial_21_0216_valid :
    mulPoly ep_Q2_019_coefficient_21_0216
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0217 : Poly :=
[
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 217 for generator 21. -/
def ep_Q2_019_partial_21_0217 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 21. -/
theorem ep_Q2_019_partial_21_0217_valid :
    mulPoly ep_Q2_019_coefficient_21_0217
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0218 : Poly :=
[
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 21. -/
def ep_Q2_019_partial_21_0218 : Poly :=
[
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 21. -/
theorem ep_Q2_019_partial_21_0218_valid :
    mulPoly ep_Q2_019_coefficient_21_0218
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0219 : Poly :=
[
  term ((30017008797849207236049429733778649744 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 219 for generator 21. -/
def ep_Q2_019_partial_21_0219 : Poly :=
[
  term ((-30017008797849207236049429733778649744 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((60034017595698414472098859467557299488 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (10, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 21. -/
theorem ep_Q2_019_partial_21_0219_valid :
    mulPoly ep_Q2_019_coefficient_21_0219
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0220 : Poly :=
[
  term ((419282441111991227829752041872751688 : Rat) / 1184265954214851260494603970684776865) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 220 for generator 21. -/
def ep_Q2_019_partial_21_0220 : Poly :=
[
  term ((-419282441111991227829752041872751688 : Rat) / 1184265954214851260494603970684776865) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term ((838564882223982455659504083745503376 : Rat) / 1184265954214851260494603970684776865) [(1, 1), (7, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 21. -/
theorem ep_Q2_019_partial_21_0220_valid :
    mulPoly ep_Q2_019_coefficient_21_0220
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0221 : Poly :=
[
  term ((-60034017595698414472098859467557299488 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 221 for generator 21. -/
def ep_Q2_019_partial_21_0221 : Poly :=
[
  term ((-120068035191396828944197718935114598976 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((60034017595698414472098859467557299488 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 21. -/
theorem ep_Q2_019_partial_21_0221_valid :
    mulPoly ep_Q2_019_coefficient_21_0221
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0222 : Poly :=
[
  term ((15008504398924603618024714866889324872 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 222 for generator 21. -/
def ep_Q2_019_partial_21_0222 : Poly :=
[
  term ((30017008797849207236049429733778649744 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-15008504398924603618024714866889324872 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 21. -/
theorem ep_Q2_019_partial_21_0222_valid :
    mulPoly ep_Q2_019_coefficient_21_0222
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0223 : Poly :=
[
  term ((50109496099339785204308510489024152408 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 223 for generator 21. -/
def ep_Q2_019_partial_21_0223 : Poly :=
[
  term ((100218992198679570408617020978048304816 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-50109496099339785204308510489024152408 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 21. -/
theorem ep_Q2_019_partial_21_0223_valid :
    mulPoly ep_Q2_019_coefficient_21_0223
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0224 : Poly :=
[
  term ((209641220555995613914876020936375844 : Rat) / 1184265954214851260494603970684776865) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 224 for generator 21. -/
def ep_Q2_019_partial_21_0224 : Poly :=
[
  term ((419282441111991227829752041872751688 : Rat) / 1184265954214851260494603970684776865) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term ((-209641220555995613914876020936375844 : Rat) / 1184265954214851260494603970684776865) [(1, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 21. -/
theorem ep_Q2_019_partial_21_0224_valid :
    mulPoly ep_Q2_019_coefficient_21_0224
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0225 : Poly :=
[
  term ((-192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 225 for generator 21. -/
def ep_Q2_019_partial_21_0225 : Poly :=
[
  term ((-385709321422076670220539060603571820032 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 21. -/
theorem ep_Q2_019_partial_21_0225_valid :
    mulPoly ep_Q2_019_coefficient_21_0225
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0226 : Poly :=
[
  term ((-908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 21. -/
def ep_Q2_019_partial_21_0226 : Poly :=
[
  term ((-1817554616618942836503812013160306095008 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 21. -/
theorem ep_Q2_019_partial_21_0226_valid :
    mulPoly ep_Q2_019_coefficient_21_0226
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0227 : Poly :=
[
  term ((129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 227 for generator 21. -/
def ep_Q2_019_partial_21_0227 : Poly :=
[
  term ((258032819784045854781171729780402432 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 21. -/
theorem ep_Q2_019_partial_21_0227_valid :
    mulPoly ep_Q2_019_coefficient_21_0227
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0228 : Poly :=
[
  term ((-141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 228 for generator 21. -/
def ep_Q2_019_partial_21_0228 : Poly :=
[
  term ((-282362921683250545271503757322663936 : Rat) / 169180850602121608642086281526396695) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 21. -/
theorem ep_Q2_019_partial_21_0228_valid :
    mulPoly ep_Q2_019_coefficient_21_0228
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0229 : Poly :=
[
  term ((5842727070813116236296761816844612676972 : Rat) / 56337223250506495677814731748290099435) [(1, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 229 for generator 21. -/
def ep_Q2_019_partial_21_0229 : Poly :=
[
  term ((11685454141626232472593523633689225353944 : Rat) / 56337223250506495677814731748290099435) [(1, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-5842727070813116236296761816844612676972 : Rat) / 56337223250506495677814731748290099435) [(1, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 21. -/
theorem ep_Q2_019_partial_21_0229_valid :
    mulPoly ep_Q2_019_coefficient_21_0229
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0230 : Poly :=
[
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (8, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 230 for generator 21. -/
def ep_Q2_019_partial_21_0230 : Poly :=
[
  term ((-769612413105665019457609919098680823040 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (8, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 21. -/
theorem ep_Q2_019_partial_21_0230_valid :
    mulPoly ep_Q2_019_coefficient_21_0230
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0231 : Poly :=
[
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 231 for generator 21. -/
def ep_Q2_019_partial_21_0231 : Poly :=
[
  term ((-741648245990769512846588699893436429888 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 21. -/
theorem ep_Q2_019_partial_21_0231_valid :
    mulPoly ep_Q2_019_coefficient_21_0231
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0232 : Poly :=
[
  term ((1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 232 for generator 21. -/
def ep_Q2_019_partial_21_0232 : Poly :=
[
  term ((-1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 21. -/
theorem ep_Q2_019_partial_21_0232_valid :
    mulPoly ep_Q2_019_coefficient_21_0232
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0233 : Poly :=
[
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 233 for generator 21. -/
def ep_Q2_019_partial_21_0233 : Poly :=
[
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 21. -/
theorem ep_Q2_019_partial_21_0233_valid :
    mulPoly ep_Q2_019_coefficient_21_0233
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0234 : Poly :=
[
  term ((-5851689751244529726083204031464335344 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 234 for generator 21. -/
def ep_Q2_019_partial_21_0234 : Poly :=
[
  term ((-11703379502489059452166408062928670688 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((5851689751244529726083204031464335344 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 21. -/
theorem ep_Q2_019_partial_21_0234_valid :
    mulPoly ep_Q2_019_coefficient_21_0234
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0235 : Poly :=
[
  term ((-327266747568168042118571801845045024 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 235 for generator 21. -/
def ep_Q2_019_partial_21_0235 : Poly :=
[
  term ((-654533495136336084237143603690090048 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((327266747568168042118571801845045024 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 21. -/
theorem ep_Q2_019_partial_21_0235_valid :
    mulPoly ep_Q2_019_coefficient_21_0235
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0236 : Poly :=
[
  term ((2046433730948412874269578134020602503499 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 236 for generator 21. -/
def ep_Q2_019_partial_21_0236 : Poly :=
[
  term ((4092867461896825748539156268041205006998 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2046433730948412874269578134020602503499 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 21. -/
theorem ep_Q2_019_partial_21_0236_valid :
    mulPoly ep_Q2_019_coefficient_21_0236
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0237 : Poly :=
[
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 237 for generator 21. -/
def ep_Q2_019_partial_21_0237 : Poly :=
[
  term ((-13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 21. -/
theorem ep_Q2_019_partial_21_0237_valid :
    mulPoly ep_Q2_019_coefficient_21_0237
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0238 : Poly :=
[
  term ((-1982939694910400294478516543254903212436 : Rat) / 34875423916980211610075786320370061555) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 238 for generator 21. -/
def ep_Q2_019_partial_21_0238 : Poly :=
[
  term ((-3965879389820800588957033086509806424872 : Rat) / 34875423916980211610075786320370061555) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1982939694910400294478516543254903212436 : Rat) / 34875423916980211610075786320370061555) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 21. -/
theorem ep_Q2_019_partial_21_0238_valid :
    mulPoly ep_Q2_019_coefficient_21_0238
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0239 : Poly :=
[
  term ((55547729838871008045025113894814186400 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 239 for generator 21. -/
def ep_Q2_019_partial_21_0239 : Poly :=
[
  term ((111095459677742016090050227789628372800 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-55547729838871008045025113894814186400 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 21. -/
theorem ep_Q2_019_partial_21_0239_valid :
    mulPoly ep_Q2_019_coefficient_21_0239
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0240 : Poly :=
[
  term ((-236372870963634995615355000949265363724 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 240 for generator 21. -/
def ep_Q2_019_partial_21_0240 : Poly :=
[
  term ((-472745741927269991230710001898530727448 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((236372870963634995615355000949265363724 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 21. -/
theorem ep_Q2_019_partial_21_0240_valid :
    mulPoly ep_Q2_019_coefficient_21_0240
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0241 : Poly :=
[
  term ((345534732096799443673262269024510065246 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 21. -/
def ep_Q2_019_partial_21_0241 : Poly :=
[
  term ((691069464193598887346524538049020130492 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-345534732096799443673262269024510065246 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 21. -/
theorem ep_Q2_019_partial_21_0241_valid :
    mulPoly ep_Q2_019_coefficient_21_0241
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0242 : Poly :=
[
  term ((297331997043592376467536980867709363659857 : Rat) / 2278527695909373825191618039597510688260) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 21. -/
def ep_Q2_019_partial_21_0242 : Poly :=
[
  term ((297331997043592376467536980867709363659857 : Rat) / 1139263847954686912595809019798755344130) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-297331997043592376467536980867709363659857 : Rat) / 2278527695909373825191618039597510688260) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 21. -/
theorem ep_Q2_019_partial_21_0242_valid :
    mulPoly ep_Q2_019_coefficient_21_0242
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0243 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 243 for generator 21. -/
def ep_Q2_019_partial_21_0243 : Poly :=
[
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 21. -/
theorem ep_Q2_019_partial_21_0243_valid :
    mulPoly ep_Q2_019_coefficient_21_0243
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0244 : Poly :=
[
  term ((5851689751244529726083204031464335344 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 244 for generator 21. -/
def ep_Q2_019_partial_21_0244 : Poly :=
[
  term ((-5851689751244529726083204031464335344 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((11703379502489059452166408062928670688 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 21. -/
theorem ep_Q2_019_partial_21_0244_valid :
    mulPoly ep_Q2_019_coefficient_21_0244
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0245 : Poly :=
[
  term ((-64508204946011463695292932445100608 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 245 for generator 21. -/
def ep_Q2_019_partial_21_0245 : Poly :=
[
  term ((64508204946011463695292932445100608 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 21. -/
theorem ep_Q2_019_partial_21_0245_valid :
    mulPoly ep_Q2_019_coefficient_21_0245
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0246 : Poly :=
[
  term ((327266747568168042118571801845045024 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 246 for generator 21. -/
def ep_Q2_019_partial_21_0246 : Poly :=
[
  term ((-327266747568168042118571801845045024 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((654533495136336084237143603690090048 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 21. -/
theorem ep_Q2_019_partial_21_0246_valid :
    mulPoly ep_Q2_019_coefficient_21_0246
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0247 : Poly :=
[
  term ((70590730420812636317875939330665984 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 247 for generator 21. -/
def ep_Q2_019_partial_21_0247 : Poly :=
[
  term ((-70590730420812636317875939330665984 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 21. -/
theorem ep_Q2_019_partial_21_0247_valid :
    mulPoly ep_Q2_019_coefficient_21_0247
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0248 : Poly :=
[
  term ((-29019497023763772947915481755399328 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 248 for generator 21. -/
def ep_Q2_019_partial_21_0248 : Poly :=
[
  term ((29019497023763772947915481755399328 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term ((-58038994047527545895830963510798656 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 21. -/
theorem ep_Q2_019_partial_21_0248_valid :
    mulPoly ep_Q2_019_coefficient_21_0248
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0249 : Poly :=
[
  term ((192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 249 for generator 21. -/
def ep_Q2_019_partial_21_0249 : Poly :=
[
  term ((385709321422076670220539060603571820032 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 21. -/
theorem ep_Q2_019_partial_21_0249_valid :
    mulPoly ep_Q2_019_coefficient_21_0249
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0250 : Poly :=
[
  term ((908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 250 for generator 21. -/
def ep_Q2_019_partial_21_0250 : Poly :=
[
  term ((1817554616618942836503812013160306095008 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 21. -/
theorem ep_Q2_019_partial_21_0250_valid :
    mulPoly ep_Q2_019_coefficient_21_0250
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0251 : Poly :=
[
  term ((-591901178930006383407731877299053152 : Rat) / 368217145428147030573952495086863395) [(1, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 251 for generator 21. -/
def ep_Q2_019_partial_21_0251 : Poly :=
[
  term ((-1183802357860012766815463754598106304 : Rat) / 368217145428147030573952495086863395) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((591901178930006383407731877299053152 : Rat) / 368217145428147030573952495086863395) [(1, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 21. -/
theorem ep_Q2_019_partial_21_0251_valid :
    mulPoly ep_Q2_019_coefficient_21_0251
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0252 : Poly :=
[
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (12, 1), (14, 2), (16, 1)]
]

/-- Partial product 252 for generator 21. -/
def ep_Q2_019_partial_21_0252 : Poly :=
[
  term ((13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 21. -/
theorem ep_Q2_019_partial_21_0252_valid :
    mulPoly ep_Q2_019_coefficient_21_0252
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0253 : Poly :=
[
  term ((2925844875622264863041602015732167672 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 253 for generator 21. -/
def ep_Q2_019_partial_21_0253 : Poly :=
[
  term ((5851689751244529726083204031464335344 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-2925844875622264863041602015732167672 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 21. -/
theorem ep_Q2_019_partial_21_0253_valid :
    mulPoly ep_Q2_019_coefficient_21_0253
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0254 : Poly :=
[
  term ((-32254102473005731847646466222550304 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 21. -/
def ep_Q2_019_partial_21_0254 : Poly :=
[
  term ((-64508204946011463695292932445100608 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((32254102473005731847646466222550304 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 21. -/
theorem ep_Q2_019_partial_21_0254_valid :
    mulPoly ep_Q2_019_coefficient_21_0254
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0255 : Poly :=
[
  term ((-12352148431564933905058162502182033396208 : Rat) / 78872112550709093948940624447606139209) [(1, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 255 for generator 21. -/
def ep_Q2_019_partial_21_0255 : Poly :=
[
  term ((-24704296863129867810116325004364066792416 : Rat) / 78872112550709093948940624447606139209) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((12352148431564933905058162502182033396208 : Rat) / 78872112550709093948940624447606139209) [(1, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 21. -/
theorem ep_Q2_019_partial_21_0255_valid :
    mulPoly ep_Q2_019_coefficient_21_0255
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0256 : Poly :=
[
  term ((986525965542614849997822545154677056 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 256 for generator 21. -/
def ep_Q2_019_partial_21_0256 : Poly :=
[
  term ((1973051931085229699995645090309354112 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-986525965542614849997822545154677056 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 21. -/
theorem ep_Q2_019_partial_21_0256_valid :
    mulPoly ep_Q2_019_coefficient_21_0256
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0257 : Poly :=
[
  term ((35295365210406318158937969665332992 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 257 for generator 21. -/
def ep_Q2_019_partial_21_0257 : Poly :=
[
  term ((70590730420812636317875939330665984 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-35295365210406318158937969665332992 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 21. -/
theorem ep_Q2_019_partial_21_0257_valid :
    mulPoly ep_Q2_019_coefficient_21_0257
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0258 : Poly :=
[
  term ((-14509748511881886473957740877699664 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 258 for generator 21. -/
def ep_Q2_019_partial_21_0258 : Poly :=
[
  term ((-29019497023763772947915481755399328 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term ((14509748511881886473957740877699664 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 21. -/
theorem ep_Q2_019_partial_21_0258_valid :
    mulPoly ep_Q2_019_coefficient_21_0258
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0259 : Poly :=
[
  term ((192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 259 for generator 21. -/
def ep_Q2_019_partial_21_0259 : Poly :=
[
  term ((-192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((385709321422076670220539060603571820032 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 2), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 21. -/
theorem ep_Q2_019_partial_21_0259_valid :
    mulPoly ep_Q2_019_coefficient_21_0259
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0260 : Poly :=
[
  term ((908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 260 for generator 21. -/
def ep_Q2_019_partial_21_0260 : Poly :=
[
  term ((-908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((1817554616618942836503812013160306095008 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 2), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 21. -/
theorem ep_Q2_019_partial_21_0260_valid :
    mulPoly ep_Q2_019_coefficient_21_0260
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0261 : Poly :=
[
  term ((-129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 261 for generator 21. -/
def ep_Q2_019_partial_21_0261 : Poly :=
[
  term ((-258032819784045854781171729780402432 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 21. -/
theorem ep_Q2_019_partial_21_0261_valid :
    mulPoly ep_Q2_019_coefficient_21_0261
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0262 : Poly :=
[
  term ((96427330355519167555134765150892955008 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 262 for generator 21. -/
def ep_Q2_019_partial_21_0262 : Poly :=
[
  term ((192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-96427330355519167555134765150892955008 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 21. -/
theorem ep_Q2_019_partial_21_0262_valid :
    mulPoly ep_Q2_019_coefficient_21_0262
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0263 : Poly :=
[
  term ((141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 263 for generator 21. -/
def ep_Q2_019_partial_21_0263 : Poly :=
[
  term ((282362921683250545271503757322663936 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 21. -/
theorem ep_Q2_019_partial_21_0263_valid :
    mulPoly ep_Q2_019_coefficient_21_0263
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0264 : Poly :=
[
  term ((454388654154735709125953003290076523752 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 264 for generator 21. -/
def ep_Q2_019_partial_21_0264 : Poly :=
[
  term ((908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-454388654154735709125953003290076523752 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 21. -/
theorem ep_Q2_019_partial_21_0264_valid :
    mulPoly ep_Q2_019_coefficient_21_0264
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0265 : Poly :=
[
  term ((-2084860018144044374909234235205639917647 : Rat) / 262907041835696979829802081492020464030) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 265 for generator 21. -/
def ep_Q2_019_partial_21_0265 : Poly :=
[
  term ((2084860018144044374909234235205639917647 : Rat) / 262907041835696979829802081492020464030) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2084860018144044374909234235205639917647 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (10, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 21. -/
theorem ep_Q2_019_partial_21_0265_valid :
    mulPoly ep_Q2_019_coefficient_21_0265
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0266 : Poly :=
[
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 266 for generator 21. -/
def ep_Q2_019_partial_21_0266 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 21. -/
theorem ep_Q2_019_partial_21_0266_valid :
    mulPoly ep_Q2_019_coefficient_21_0266
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0267 : Poly :=
[
  term ((787910445846549774067582124324659161436 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 267 for generator 21. -/
def ep_Q2_019_partial_21_0267 : Poly :=
[
  term ((-787910445846549774067582124324659161436 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1575820891693099548135164248649318322872 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 21. -/
theorem ep_Q2_019_partial_21_0267_valid :
    mulPoly ep_Q2_019_coefficient_21_0267
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0268 : Poly :=
[
  term ((-1055713339808288663300420036133532027856 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 268 for generator 21. -/
def ep_Q2_019_partial_21_0268 : Poly :=
[
  term ((1055713339808288663300420036133532027856 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2111426679616577326600840072267064055712 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 21. -/
theorem ep_Q2_019_partial_21_0268_valid :
    mulPoly ep_Q2_019_coefficient_21_0268
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0269 : Poly :=
[
  term ((-609447433736819948671577056259986822872 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 269 for generator 21. -/
def ep_Q2_019_partial_21_0269 : Poly :=
[
  term ((609447433736819948671577056259986822872 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1218894867473639897343154112519973645744 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 21. -/
theorem ep_Q2_019_partial_21_0269_valid :
    mulPoly ep_Q2_019_coefficient_21_0269
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0270 : Poly :=
[
  term ((-89657278698040709230799232124326417183 : Rat) / 17527136122379798655320138766134697602) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 21. -/
def ep_Q2_019_partial_21_0270 : Poly :=
[
  term ((89657278698040709230799232124326417183 : Rat) / 17527136122379798655320138766134697602) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-89657278698040709230799232124326417183 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 21. -/
theorem ep_Q2_019_partial_21_0270_valid :
    mulPoly ep_Q2_019_coefficient_21_0270
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0271 : Poly :=
[
  term ((-5510282247661238500416878350029618850661 : Rat) / 175271361223797986553201387661346976020) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 271 for generator 21. -/
def ep_Q2_019_partial_21_0271 : Poly :=
[
  term ((5510282247661238500416878350029618850661 : Rat) / 175271361223797986553201387661346976020) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5510282247661238500416878350029618850661 : Rat) / 87635680611898993276600693830673488010) [(1, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 21. -/
theorem ep_Q2_019_partial_21_0271_valid :
    mulPoly ep_Q2_019_coefficient_21_0271
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0272 : Poly :=
[
  term ((758530014886337823975241529848127808 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 272 for generator 21. -/
def ep_Q2_019_partial_21_0272 : Poly :=
[
  term ((1517060029772675647950483059696255616 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-758530014886337823975241529848127808 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 21. -/
theorem ep_Q2_019_partial_21_0272_valid :
    mulPoly ep_Q2_019_coefficient_21_0272
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0273 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

/-- Partial product 273 for generator 21. -/
def ep_Q2_019_partial_21_0273 : Poly :=
[
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 21. -/
theorem ep_Q2_019_partial_21_0273_valid :
    mulPoly ep_Q2_019_coefficient_21_0273
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0274 : Poly :=
[
  term ((-5076564547422219200526168447499634760082 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 274 for generator 21. -/
def ep_Q2_019_partial_21_0274 : Poly :=
[
  term ((-10153129094844438401052336894999269520164 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((5076564547422219200526168447499634760082 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 21. -/
theorem ep_Q2_019_partial_21_0274_valid :
    mulPoly ep_Q2_019_coefficient_21_0274
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0275 : Poly :=
[
  term ((165996235203139382880339470732293504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 275 for generator 21. -/
def ep_Q2_019_partial_21_0275 : Poly :=
[
  term ((331992470406278765760678941464587008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-165996235203139382880339470732293504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 21. -/
theorem ep_Q2_019_partial_21_0275_valid :
    mulPoly ep_Q2_019_coefficient_21_0275
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0276 : Poly :=
[
  term ((-2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 276 for generator 21. -/
def ep_Q2_019_partial_21_0276 : Poly :=
[
  term ((-2084860018144044374909234235205639917647 : Rat) / 262907041835696979829802081492020464030) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 21. -/
theorem ep_Q2_019_partial_21_0276_valid :
    mulPoly ep_Q2_019_coefficient_21_0276
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0277 : Poly :=
[
  term ((37591877025099597620634560930780049293228 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 277 for generator 21. -/
def ep_Q2_019_partial_21_0277 : Poly :=
[
  term ((75183754050199195241269121861560098586456 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37591877025099597620634560930780049293228 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 21. -/
theorem ep_Q2_019_partial_21_0277_valid :
    mulPoly ep_Q2_019_coefficient_21_0277
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0278 : Poly :=
[
  term ((393955222923274887033791062162329580718 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 278 for generator 21. -/
def ep_Q2_019_partial_21_0278 : Poly :=
[
  term ((787910445846549774067582124324659161436 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-393955222923274887033791062162329580718 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 21. -/
theorem ep_Q2_019_partial_21_0278_valid :
    mulPoly ep_Q2_019_coefficient_21_0278
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0279 : Poly :=
[
  term ((1196207598800672755132911333888135050228 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 279 for generator 21. -/
def ep_Q2_019_partial_21_0279 : Poly :=
[
  term ((2392415197601345510265822667776270100456 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1196207598800672755132911333888135050228 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 21. -/
theorem ep_Q2_019_partial_21_0279_valid :
    mulPoly ep_Q2_019_coefficient_21_0279
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0280 : Poly :=
[
  term ((13984126935737275497723684293000057376 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 280 for generator 21. -/
def ep_Q2_019_partial_21_0280 : Poly :=
[
  term ((27968253871474550995447368586000114752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-13984126935737275497723684293000057376 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 21. -/
theorem ep_Q2_019_partial_21_0280_valid :
    mulPoly ep_Q2_019_coefficient_21_0280
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0281 : Poly :=
[
  term ((-304723716868409974335788528129993411436 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 281 for generator 21. -/
def ep_Q2_019_partial_21_0281 : Poly :=
[
  term ((-609447433736819948671577056259986822872 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((304723716868409974335788528129993411436 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 21. -/
theorem ep_Q2_019_partial_21_0281_valid :
    mulPoly ep_Q2_019_coefficient_21_0281
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0282 : Poly :=
[
  term ((-7582556600911484685452410524232827732299 : Rat) / 341779154386406073778742705939626603239) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 282 for generator 21. -/
def ep_Q2_019_partial_21_0282 : Poly :=
[
  term ((-15165113201822969370904821048465655464598 : Rat) / 341779154386406073778742705939626603239) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((7582556600911484685452410524232827732299 : Rat) / 341779154386406073778742705939626603239) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 21. -/
theorem ep_Q2_019_partial_21_0282_valid :
    mulPoly ep_Q2_019_coefficient_21_0282
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0283 : Poly :=
[
  term ((-11525185994244236071278152868919199808 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 283 for generator 21. -/
def ep_Q2_019_partial_21_0283 : Poly :=
[
  term ((-23050371988488472142556305737838399616 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((11525185994244236071278152868919199808 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 21. -/
theorem ep_Q2_019_partial_21_0283_valid :
    mulPoly ep_Q2_019_coefficient_21_0283
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0284 : Poly :=
[
  term ((-5510282247661238500416878350029618850661 : Rat) / 350542722447595973106402775322693952040) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 284 for generator 21. -/
def ep_Q2_019_partial_21_0284 : Poly :=
[
  term ((-5510282247661238500416878350029618850661 : Rat) / 175271361223797986553201387661346976020) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((5510282247661238500416878350029618850661 : Rat) / 350542722447595973106402775322693952040) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 21. -/
theorem ep_Q2_019_partial_21_0284_valid :
    mulPoly ep_Q2_019_coefficient_21_0284
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0285 : Poly :=
[
  term ((1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (8, 1), (16, 1)]
]

/-- Partial product 285 for generator 21. -/
def ep_Q2_019_partial_21_0285 : Poly :=
[
  term ((3512785358422406537449770996477886186568 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (8, 1), (10, 1), (16, 1)],
  term ((-1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 21. -/
theorem ep_Q2_019_partial_21_0285_valid :
    mulPoly ep_Q2_019_coefficient_21_0285
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0286 : Poly :=
[
  term ((-1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (14, 1), (16, 1)]
]

/-- Partial product 286 for generator 21. -/
def ep_Q2_019_partial_21_0286 : Poly :=
[
  term ((-3512785358422406537449770996477886186568 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 21. -/
theorem ep_Q2_019_partial_21_0286_valid :
    mulPoly ep_Q2_019_coefficient_21_0286
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0287 : Poly :=
[
  term ((-6992462532203177895993711781211857444004 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (8, 1), (16, 1)]
]

/-- Partial product 287 for generator 21. -/
def ep_Q2_019_partial_21_0287 : Poly :=
[
  term ((-13984925064406355791987423562423714888008 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (8, 1), (10, 1), (16, 1)],
  term ((6992462532203177895993711781211857444004 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 21. -/
theorem ep_Q2_019_partial_21_0287_valid :
    mulPoly ep_Q2_019_coefficient_21_0287
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0288 : Poly :=
[
  term ((-258720116428612861948290029132381904 : Rat) / 894241638896928502822456059496668245) [(1, 2), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 288 for generator 21. -/
def ep_Q2_019_partial_21_0288 : Poly :=
[
  term ((258720116428612861948290029132381904 : Rat) / 894241638896928502822456059496668245) [(1, 2), (10, 1), (12, 1), (16, 1)],
  term ((-517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(1, 2), (10, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 21. -/
theorem ep_Q2_019_partial_21_0288_valid :
    mulPoly ep_Q2_019_coefficient_21_0288
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0289 : Poly :=
[
  term ((-17080513032731465289052170251476364592 : Rat) / 2577520017997029214017667465608043765) [(1, 2), (10, 1), (16, 1)]
]

/-- Partial product 289 for generator 21. -/
def ep_Q2_019_partial_21_0289 : Poly :=
[
  term ((17080513032731465289052170251476364592 : Rat) / 2577520017997029214017667465608043765) [(1, 2), (10, 1), (16, 1)],
  term ((-34161026065462930578104340502952729184 : Rat) / 2577520017997029214017667465608043765) [(1, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 21. -/
theorem ep_Q2_019_partial_21_0289_valid :
    mulPoly ep_Q2_019_coefficient_21_0289
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0290 : Poly :=
[
  term ((517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(1, 2), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 290 for generator 21. -/
def ep_Q2_019_partial_21_0290 : Poly :=
[
  term ((1034880465714451447793160116529527616 : Rat) / 894241638896928502822456059496668245) [(1, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(1, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 21. -/
theorem ep_Q2_019_partial_21_0290_valid :
    mulPoly ep_Q2_019_coefficient_21_0290
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0291 : Poly :=
[
  term ((-129360058214306430974145014566190952 : Rat) / 894241638896928502822456059496668245) [(1, 2), (12, 1), (16, 1)]
]

/-- Partial product 291 for generator 21. -/
def ep_Q2_019_partial_21_0291 : Poly :=
[
  term ((-258720116428612861948290029132381904 : Rat) / 894241638896928502822456059496668245) [(1, 2), (10, 1), (12, 1), (16, 1)],
  term ((129360058214306430974145014566190952 : Rat) / 894241638896928502822456059496668245) [(1, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 21. -/
theorem ep_Q2_019_partial_21_0291_valid :
    mulPoly ep_Q2_019_coefficient_21_0291
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0292 : Poly :=
[
  term ((8724561302290252514844991839038568096116 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (14, 1), (16, 1)]
]

/-- Partial product 292 for generator 21. -/
def ep_Q2_019_partial_21_0292 : Poly :=
[
  term ((17449122604580505029689983678077136192232 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((-8724561302290252514844991839038568096116 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 21. -/
theorem ep_Q2_019_partial_21_0292_valid :
    mulPoly ep_Q2_019_coefficient_21_0292
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0293 : Poly :=
[
  term ((-8540256516365732644526085125738182296 : Rat) / 2577520017997029214017667465608043765) [(1, 2), (16, 1)]
]

/-- Partial product 293 for generator 21. -/
def ep_Q2_019_partial_21_0293 : Poly :=
[
  term ((-17080513032731465289052170251476364592 : Rat) / 2577520017997029214017667465608043765) [(1, 2), (10, 1), (16, 1)],
  term ((8540256516365732644526085125738182296 : Rat) / 2577520017997029214017667465608043765) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 21. -/
theorem ep_Q2_019_partial_21_0293_valid :
    mulPoly ep_Q2_019_coefficient_21_0293
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0294 : Poly :=
[
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 294 for generator 21. -/
def ep_Q2_019_partial_21_0294 : Poly :=
[
  term ((181064694087024185626457829673696320 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 21. -/
theorem ep_Q2_019_partial_21_0294_valid :
    mulPoly ep_Q2_019_coefficient_21_0294
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0295 : Poly :=
[
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 295 for generator 21. -/
def ep_Q2_019_partial_21_0295 : Poly :=
[
  term ((-181064694087024185626457829673696320 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 21. -/
theorem ep_Q2_019_partial_21_0295_valid :
    mulPoly ep_Q2_019_coefficient_21_0295
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0296 : Poly :=
[
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 296 for generator 21. -/
def ep_Q2_019_partial_21_0296 : Poly :=
[
  term ((27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 21. -/
theorem ep_Q2_019_partial_21_0296_valid :
    mulPoly ep_Q2_019_coefficient_21_0296
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0297 : Poly :=
[
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 297 for generator 21. -/
def ep_Q2_019_partial_21_0297 : Poly :=
[
  term ((-27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 21. -/
theorem ep_Q2_019_partial_21_0297_valid :
    mulPoly ep_Q2_019_coefficient_21_0297
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0298 : Poly :=
[
  term ((508350560227750433546617028410924872 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 298 for generator 21. -/
def ep_Q2_019_partial_21_0298 : Poly :=
[
  term ((1016701120455500867093234056821849744 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-508350560227750433546617028410924872 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 21. -/
theorem ep_Q2_019_partial_21_0298_valid :
    mulPoly ep_Q2_019_coefficient_21_0298
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0299 : Poly :=
[
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 299 for generator 21. -/
def ep_Q2_019_partial_21_0299 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 21. -/
theorem ep_Q2_019_partial_21_0299_valid :
    mulPoly ep_Q2_019_coefficient_21_0299
        ep_Q2_019_generator_21_0200_0299 =
      ep_Q2_019_partial_21_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_21_0200_0299 : List Poly :=
[
  ep_Q2_019_partial_21_0200,
  ep_Q2_019_partial_21_0201,
  ep_Q2_019_partial_21_0202,
  ep_Q2_019_partial_21_0203,
  ep_Q2_019_partial_21_0204,
  ep_Q2_019_partial_21_0205,
  ep_Q2_019_partial_21_0206,
  ep_Q2_019_partial_21_0207,
  ep_Q2_019_partial_21_0208,
  ep_Q2_019_partial_21_0209,
  ep_Q2_019_partial_21_0210,
  ep_Q2_019_partial_21_0211,
  ep_Q2_019_partial_21_0212,
  ep_Q2_019_partial_21_0213,
  ep_Q2_019_partial_21_0214,
  ep_Q2_019_partial_21_0215,
  ep_Q2_019_partial_21_0216,
  ep_Q2_019_partial_21_0217,
  ep_Q2_019_partial_21_0218,
  ep_Q2_019_partial_21_0219,
  ep_Q2_019_partial_21_0220,
  ep_Q2_019_partial_21_0221,
  ep_Q2_019_partial_21_0222,
  ep_Q2_019_partial_21_0223,
  ep_Q2_019_partial_21_0224,
  ep_Q2_019_partial_21_0225,
  ep_Q2_019_partial_21_0226,
  ep_Q2_019_partial_21_0227,
  ep_Q2_019_partial_21_0228,
  ep_Q2_019_partial_21_0229,
  ep_Q2_019_partial_21_0230,
  ep_Q2_019_partial_21_0231,
  ep_Q2_019_partial_21_0232,
  ep_Q2_019_partial_21_0233,
  ep_Q2_019_partial_21_0234,
  ep_Q2_019_partial_21_0235,
  ep_Q2_019_partial_21_0236,
  ep_Q2_019_partial_21_0237,
  ep_Q2_019_partial_21_0238,
  ep_Q2_019_partial_21_0239,
  ep_Q2_019_partial_21_0240,
  ep_Q2_019_partial_21_0241,
  ep_Q2_019_partial_21_0242,
  ep_Q2_019_partial_21_0243,
  ep_Q2_019_partial_21_0244,
  ep_Q2_019_partial_21_0245,
  ep_Q2_019_partial_21_0246,
  ep_Q2_019_partial_21_0247,
  ep_Q2_019_partial_21_0248,
  ep_Q2_019_partial_21_0249,
  ep_Q2_019_partial_21_0250,
  ep_Q2_019_partial_21_0251,
  ep_Q2_019_partial_21_0252,
  ep_Q2_019_partial_21_0253,
  ep_Q2_019_partial_21_0254,
  ep_Q2_019_partial_21_0255,
  ep_Q2_019_partial_21_0256,
  ep_Q2_019_partial_21_0257,
  ep_Q2_019_partial_21_0258,
  ep_Q2_019_partial_21_0259,
  ep_Q2_019_partial_21_0260,
  ep_Q2_019_partial_21_0261,
  ep_Q2_019_partial_21_0262,
  ep_Q2_019_partial_21_0263,
  ep_Q2_019_partial_21_0264,
  ep_Q2_019_partial_21_0265,
  ep_Q2_019_partial_21_0266,
  ep_Q2_019_partial_21_0267,
  ep_Q2_019_partial_21_0268,
  ep_Q2_019_partial_21_0269,
  ep_Q2_019_partial_21_0270,
  ep_Q2_019_partial_21_0271,
  ep_Q2_019_partial_21_0272,
  ep_Q2_019_partial_21_0273,
  ep_Q2_019_partial_21_0274,
  ep_Q2_019_partial_21_0275,
  ep_Q2_019_partial_21_0276,
  ep_Q2_019_partial_21_0277,
  ep_Q2_019_partial_21_0278,
  ep_Q2_019_partial_21_0279,
  ep_Q2_019_partial_21_0280,
  ep_Q2_019_partial_21_0281,
  ep_Q2_019_partial_21_0282,
  ep_Q2_019_partial_21_0283,
  ep_Q2_019_partial_21_0284,
  ep_Q2_019_partial_21_0285,
  ep_Q2_019_partial_21_0286,
  ep_Q2_019_partial_21_0287,
  ep_Q2_019_partial_21_0288,
  ep_Q2_019_partial_21_0289,
  ep_Q2_019_partial_21_0290,
  ep_Q2_019_partial_21_0291,
  ep_Q2_019_partial_21_0292,
  ep_Q2_019_partial_21_0293,
  ep_Q2_019_partial_21_0294,
  ep_Q2_019_partial_21_0295,
  ep_Q2_019_partial_21_0296,
  ep_Q2_019_partial_21_0297,
  ep_Q2_019_partial_21_0298,
  ep_Q2_019_partial_21_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_21_0200_0299 : Poly :=
[
  term ((-929413029530791788287970231656387263936 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-7565226663649716834014063343821177680558 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((464706514765395894143985115828193631968 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((3782613331824858417007031671910588840279 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((698328670920686832619162954271515270576 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-2844110064578040921104226517855619712 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (9, 1), (10, 2), (16, 1)],
  term ((-314323987169262415026054702292026293816 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (9, 1), (16, 1)],
  term ((-2844110064578040921104226517855619712 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((628647974338524830052109404584052587632 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((7616302909563938113319755107291783195264 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((315608141611695661043791425263417794592 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-507128089843386252724116258436170864924 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-548430438368633611271065741791085819547 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-313687232522494492657130281961559398816 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((5937907713659249991084525770264315016206 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-314323987169262415026054702292026293816 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-3808151454781969056659877553645891597632 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((33472138549610040757073877117177193032 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((253564044921693126362058129218085432462 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16200118927604067084781012584052029312 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((769612413105665019457609919098680823040 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((741648245990769512846588699893436429888 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2069477534287129051339645032049917148848 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((1034738767143564525669822516024958574424 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 1), (8, 1), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-120068035191396828944197718935114598976 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((100218992198679570408617020978048304816 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((60034017595698414472098859467557299488 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((838564882223982455659504083745503376 : Rat) / 1184265954214851260494603970684776865) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term ((60034017595698414472098859467557299488 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-15008504398924603618024714866889324872 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (12, 1), (16, 1)],
  term ((-50109496099339785204308510489024152408 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-209641220555995613914876020936375844 : Rat) / 1184265954214851260494603970684776865) [(1, 1), (7, 1), (16, 1)],
  term ((-385709321422076670220539060603571820032 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1817554616618942836503812013160306095008 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((258032819784045854781171729780402432 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-282362921683250545271503757322663936 : Rat) / 169180850602121608642086281526396695) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((11685454141626232472593523633689225353944 : Rat) / 56337223250506495677814731748290099435) [(1, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-5842727070813116236296761816844612676972 : Rat) / 56337223250506495677814731748290099435) [(1, 1), (8, 1), (9, 1), (16, 1)],
  term ((-769612413105665019457609919098680823040 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-741648245990769512846588699893436429888 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-11703379502489059452166408062928670688 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-654533495136336084237143603690090048 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((4092867461896825748539156268041205006998 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3965879389820800588957033086509806424872 : Rat) / 34875423916980211610075786320370061555) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((111095459677742016090050227789628372800 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-472745741927269991230710001898530727448 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((691069464193598887346524538049020130492 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((293943600858237679211442396605390223947089 : Rat) / 1139263847954686912595809019798755344130) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((5851689751244529726083204031464335344 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((327266747568168042118571801845045024 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2046433730948412874269578134020602503499 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1982939694910400294478516543254903212436 : Rat) / 34875423916980211610075786320370061555) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-55547729838871008045025113894814186400 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((236372870963634995615355000949265363724 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((-345534732096799443673262269024510065246 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-297331997043592376467536980867709363659857 : Rat) / 2278527695909373825191618039597510688260) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((385709321422076670220539060603571820032 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1817554616618942836503812013160306095008 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3368504232452463033478590306095654592 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-123542102120746133637235095045336571798592 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((1973051931085229699995645090309354112 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((11703379502489059452166408062928670688 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((-129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((654533495136336084237143603690090048 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-58038994047527545895830963510798656 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((-192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((591901178930006383407731877299053152 : Rat) / 368217145428147030573952495086863395) [(1, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-2925844875622264863041602015732167672 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (12, 1), (16, 1)],
  term ((32254102473005731847646466222550304 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((12352148431564933905058162502182033396208 : Rat) / 78872112550709093948940624447606139209) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((-986525965542614849997822545154677056 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (14, 2), (16, 1)],
  term ((-35295365210406318158937969665332992 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((14509748511881886473957740877699664 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 1), (16, 1)],
  term ((-258032819784045854781171729780402432 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((282362921683250545271503757322663936 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((385709321422076670220539060603571820032 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((1817554616618942836503812013160306095008 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-96427330355519167555134765150892955008 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((-141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-454388654154735709125953003290076523752 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((1517060029772675647950483059696255616 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-10153129094844438401052336894999269520164 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((331992470406278765760678941464587008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((74287735584668488031176830344290855747672 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((93192663173233356042330883889454111576 : Rat) / 1184265954214851260494603970684776865) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((27968253871474550995447368586000114752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3833370362060335868829781720583225808437 : Rat) / 97651186967544592508212201697036172354) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23050371988488472142556305737838399616 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2084860018144044374909234235205639917647 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1575820891693099548135164248649318322872 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2111426679616577326600840072267064055712 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1218894867473639897343154112519973645744 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((-89657278698040709230799232124326417183 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5510282247661238500416878350029618850661 : Rat) / 87635680611898993276600693830673488010) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-758530014886337823975241529848127808 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((5076564547422219200526168447499634760082 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-165996235203139382880339470732293504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(1, 1), (11, 1), (16, 1)],
  term ((-37591877025099597620634560930780049293228 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-393955222923274887033791062162329580718 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1196207598800672755132911333888135050228 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13984126935737275497723684293000057376 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((304723716868409974335788528129993411436 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (13, 1), (16, 1)],
  term ((7582556600911484685452410524232827732299 : Rat) / 341779154386406073778742705939626603239) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((11525185994244236071278152868919199808 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((5510282247661238500416878350029618850661 : Rat) / 350542722447595973106402775322693952040) [(1, 1), (15, 1), (16, 1)],
  term ((3512785358422406537449770996477886186568 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (8, 1), (10, 1), (16, 1)],
  term ((-1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (8, 1), (16, 1)],
  term ((-3512785358422406537449770996477886186568 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (14, 1), (16, 1)],
  term ((-13984925064406355791987423562423714888008 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (8, 1), (10, 1), (16, 1)],
  term ((6992462532203177895993711781211857444004 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (8, 1), (16, 1)],
  term ((1034880465714451447793160116529527616 : Rat) / 894241638896928502822456059496668245) [(1, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((17449122604580505029689983678077136192232 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((-517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(1, 2), (10, 2), (12, 1), (16, 1)],
  term ((-34161026065462930578104340502952729184 : Rat) / 2577520017997029214017667465608043765) [(1, 2), (10, 2), (16, 1)],
  term ((-517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((129360058214306430974145014566190952 : Rat) / 894241638896928502822456059496668245) [(1, 2), (12, 1), (16, 1)],
  term ((-8724561302290252514844991839038568096116 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (14, 1), (16, 1)],
  term ((8540256516365732644526085125738182296 : Rat) / 2577520017997029214017667465608043765) [(1, 2), (16, 1)],
  term ((181064694087024185626457829673696320 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-181064694087024185626457829673696320 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((1016701120455500867093234056821849744 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-508350560227750433546617028410924872 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 200 through 299. -/
theorem ep_Q2_019_block_21_0200_0299_valid :
    checkProductSumEq ep_Q2_019_partials_21_0200_0299
      ep_Q2_019_block_21_0200_0299 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
