/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_041, term block 4:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_041`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2041TermShards

/-- Generator polynomial 4 for endpoint certificate `ep_Q2_041`. -/
def ep_Q2_041_generator_04_0300_0399 : Poly :=
[
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0300 : Poly :=
[
  term ((21904222840080 : Rat) / 275754830051) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 300 for generator 4. -/
def ep_Q2_041_partial_04_0300 : Poly :=
[
  term ((21904222840080 : Rat) / 275754830051) [(1, 1), (4, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((21904222840080 : Rat) / 275754830051) [(1, 1), (5, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-21904222840080 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-21904222840080 : Rat) / 275754830051) [(1, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 4. -/
theorem ep_Q2_041_partial_04_0300_valid :
    mulPoly ep_Q2_041_coefficient_04_0300
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0301 : Poly :=
[
  term ((-6597946783 : Rat) / 151763803) [(1, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 301 for generator 4. -/
def ep_Q2_041_partial_04_0301 : Poly :=
[
  term ((-6597946783 : Rat) / 151763803) [(1, 1), (4, 2), (9, 1), (14, 1), (16, 1)],
  term ((-6597946783 : Rat) / 151763803) [(1, 1), (5, 2), (9, 1), (14, 1), (16, 1)],
  term ((6597946783 : Rat) / 151763803) [(1, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((6597946783 : Rat) / 151763803) [(1, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 4. -/
theorem ep_Q2_041_partial_04_0301_valid :
    mulPoly ep_Q2_041_coefficient_04_0301
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0302 : Poly :=
[
  term ((43706396304392267779 : Rat) / 259001945121800951) [(1, 1), (9, 1), (14, 2)]
]

/-- Partial product 302 for generator 4. -/
def ep_Q2_041_partial_04_0302 : Poly :=
[
  term ((43706396304392267779 : Rat) / 259001945121800951) [(1, 1), (4, 2), (9, 1), (14, 2)],
  term ((43706396304392267779 : Rat) / 259001945121800951) [(1, 1), (5, 2), (9, 1), (14, 2)],
  term ((-43706396304392267779 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 2), (14, 2)],
  term ((-43706396304392267779 : Rat) / 259001945121800951) [(1, 1), (9, 1), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 4. -/
theorem ep_Q2_041_partial_04_0302_valid :
    mulPoly ep_Q2_041_coefficient_04_0302
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0303 : Poly :=
[
  term ((5378758734 : Rat) / 151763803) [(1, 1), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 303 for generator 4. -/
def ep_Q2_041_partial_04_0303 : Poly :=
[
  term ((5378758734 : Rat) / 151763803) [(1, 1), (4, 2), (9, 1), (14, 2), (16, 1)],
  term ((5378758734 : Rat) / 151763803) [(1, 1), (5, 2), (9, 1), (14, 2), (16, 1)],
  term ((-5378758734 : Rat) / 151763803) [(1, 1), (9, 1), (10, 2), (14, 2), (16, 1)],
  term ((-5378758734 : Rat) / 151763803) [(1, 1), (9, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 4. -/
theorem ep_Q2_041_partial_04_0303_valid :
    mulPoly ep_Q2_041_coefficient_04_0303
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0304 : Poly :=
[
  term ((-6685445501212977061778584791701882380457530795076490357549750626331594589 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (9, 1), (15, 2)]
]

/-- Partial product 304 for generator 4. -/
def ep_Q2_041_partial_04_0304 : Poly :=
[
  term ((-6685445501212977061778584791701882380457530795076490357549750626331594589 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (4, 2), (9, 1), (15, 2)],
  term ((-6685445501212977061778584791701882380457530795076490357549750626331594589 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (5, 2), (9, 1), (15, 2)],
  term ((6685445501212977061778584791701882380457530795076490357549750626331594589 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (9, 1), (10, 2), (15, 2)],
  term ((6685445501212977061778584791701882380457530795076490357549750626331594589 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (9, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 4. -/
theorem ep_Q2_041_partial_04_0304_valid :
    mulPoly ep_Q2_041_coefficient_04_0304
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0305 : Poly :=
[
  term ((-339757075288560 : Rat) / 275754830051) [(1, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 305 for generator 4. -/
def ep_Q2_041_partial_04_0305 : Poly :=
[
  term ((-339757075288560 : Rat) / 275754830051) [(1, 1), (4, 2), (9, 1), (15, 2), (16, 1)],
  term ((-339757075288560 : Rat) / 275754830051) [(1, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((339757075288560 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((339757075288560 : Rat) / 275754830051) [(1, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 4. -/
theorem ep_Q2_041_partial_04_0305_valid :
    mulPoly ep_Q2_041_coefficient_04_0305
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0306 : Poly :=
[
  term ((-169517057 : Rat) / 151763803) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 306 for generator 4. -/
def ep_Q2_041_partial_04_0306 : Poly :=
[
  term ((-169517057 : Rat) / 151763803) [(1, 1), (4, 2), (9, 1), (16, 1)],
  term ((-169517057 : Rat) / 151763803) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((169517057 : Rat) / 151763803) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((169517057 : Rat) / 151763803) [(1, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 4. -/
theorem ep_Q2_041_partial_04_0306_valid :
    mulPoly ep_Q2_041_coefficient_04_0306
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0307 : Poly :=
[
  term ((112774684453615571615 : Rat) / 259001945121800951) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 307 for generator 4. -/
def ep_Q2_041_partial_04_0307 : Poly :=
[
  term ((112774684453615571615 : Rat) / 259001945121800951) [(1, 1), (4, 2), (10, 1), (11, 1)],
  term ((112774684453615571615 : Rat) / 259001945121800951) [(1, 1), (5, 2), (10, 1), (11, 1)],
  term ((-112774684453615571615 : Rat) / 259001945121800951) [(1, 1), (10, 1), (11, 3)],
  term ((-112774684453615571615 : Rat) / 259001945121800951) [(1, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 4. -/
theorem ep_Q2_041_partial_04_0307_valid :
    mulPoly ep_Q2_041_coefficient_04_0307
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0308 : Poly :=
[
  term ((-1348714666807157674522499365140572204676822148784107380354320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 308 for generator 4. -/
def ep_Q2_041_partial_04_0308 : Poly :=
[
  term ((-1348714666807157674522499365140572204676822148784107380354320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1348714666807157674522499365140572204676822148784107380354320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((1348714666807157674522499365140572204676822148784107380354320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 3), (12, 1), (13, 1), (15, 1)],
  term ((1348714666807157674522499365140572204676822148784107380354320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 3), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 4. -/
theorem ep_Q2_041_partial_04_0308_valid :
    mulPoly ep_Q2_041_coefficient_04_0308
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0309 : Poly :=
[
  term ((115159554375110428077936196144767190225981875507139606256972350 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 309 for generator 4. -/
def ep_Q2_041_partial_04_0309 : Poly :=
[
  term ((115159554375110428077936196144767190225981875507139606256972350 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (4, 2), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((115159554375110428077936196144767190225981875507139606256972350 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 2), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-115159554375110428077936196144767190225981875507139606256972350 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 3), (12, 1), (15, 2)],
  term ((-115159554375110428077936196144767190225981875507139606256972350 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 3), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 4. -/
theorem ep_Q2_041_partial_04_0309_valid :
    mulPoly ep_Q2_041_coefficient_04_0309
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0310 : Poly :=
[
  term ((562502356765632876427929772549309198554784261659455220875920 : Rat) / 9617354187642203712125655254372939285495069578637751278031) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 310 for generator 4. -/
def ep_Q2_041_partial_04_0310 : Poly :=
[
  term ((562502356765632876427929772549309198554784261659455220875920 : Rat) / 9617354187642203712125655254372939285495069578637751278031) [(1, 1), (4, 2), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((562502356765632876427929772549309198554784261659455220875920 : Rat) / 9617354187642203712125655254372939285495069578637751278031) [(1, 1), (5, 2), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-562502356765632876427929772549309198554784261659455220875920 : Rat) / 9617354187642203712125655254372939285495069578637751278031) [(1, 1), (10, 1), (11, 3), (13, 1), (14, 1), (15, 1)],
  term ((-562502356765632876427929772549309198554784261659455220875920 : Rat) / 9617354187642203712125655254372939285495069578637751278031) [(1, 1), (10, 3), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 4. -/
theorem ep_Q2_041_partial_04_0310_valid :
    mulPoly ep_Q2_041_coefficient_04_0310
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0311 : Poly :=
[
  term ((-1190539092493479245018666352960796036393923136171443971864180 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 311 for generator 4. -/
def ep_Q2_041_partial_04_0311 : Poly :=
[
  term ((-1190539092493479245018666352960796036393923136171443971864180 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1190539092493479245018666352960796036393923136171443971864180 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((1190539092493479245018666352960796036393923136171443971864180 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 3), (13, 1), (15, 1)],
  term ((1190539092493479245018666352960796036393923136171443971864180 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 4. -/
theorem ep_Q2_041_partial_04_0311_valid :
    mulPoly ep_Q2_041_coefficient_04_0311
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0312 : Poly :=
[
  term ((-41672803159245398866 : Rat) / 259001945121800951) [(1, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 312 for generator 4. -/
def ep_Q2_041_partial_04_0312 : Poly :=
[
  term ((-41672803159245398866 : Rat) / 259001945121800951) [(1, 1), (4, 2), (10, 1), (11, 1), (14, 1)],
  term ((-41672803159245398866 : Rat) / 259001945121800951) [(1, 1), (5, 2), (10, 1), (11, 1), (14, 1)],
  term ((41672803159245398866 : Rat) / 259001945121800951) [(1, 1), (10, 1), (11, 3), (14, 1)],
  term ((41672803159245398866 : Rat) / 259001945121800951) [(1, 1), (10, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 4. -/
theorem ep_Q2_041_partial_04_0312_valid :
    mulPoly ep_Q2_041_coefficient_04_0312
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0313 : Poly :=
[
  term ((1256428699072951542123181101255045803160250108729888421867782310 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 313 for generator 4. -/
def ep_Q2_041_partial_04_0313 : Poly :=
[
  term ((1256428699072951542123181101255045803160250108729888421867782310 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (4, 2), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((1256428699072951542123181101255045803160250108729888421867782310 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (5, 2), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1256428699072951542123181101255045803160250108729888421867782310 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (10, 1), (11, 3), (14, 1), (15, 2)],
  term ((-1256428699072951542123181101255045803160250108729888421867782310 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (10, 3), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 4. -/
theorem ep_Q2_041_partial_04_0313_valid :
    mulPoly ep_Q2_041_coefficient_04_0313
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0314 : Poly :=
[
  term ((-2610306556 : Rat) / 151763803) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 314 for generator 4. -/
def ep_Q2_041_partial_04_0314 : Poly :=
[
  term ((-2610306556 : Rat) / 151763803) [(1, 1), (4, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2610306556 : Rat) / 151763803) [(1, 1), (5, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((2610306556 : Rat) / 151763803) [(1, 1), (10, 1), (11, 3), (14, 1), (16, 1)],
  term ((2610306556 : Rat) / 151763803) [(1, 1), (10, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 4. -/
theorem ep_Q2_041_partial_04_0314_valid :
    mulPoly ep_Q2_041_coefficient_04_0314
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0315 : Poly :=
[
  term ((-1241201616154444033511079542735534111410193461438480559571093180 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 315 for generator 4. -/
def ep_Q2_041_partial_04_0315 : Poly :=
[
  term ((-1241201616154444033511079542735534111410193461438480559571093180 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (4, 2), (10, 1), (11, 1), (15, 2)],
  term ((-1241201616154444033511079542735534111410193461438480559571093180 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 2), (10, 1), (11, 1), (15, 2)],
  term ((1241201616154444033511079542735534111410193461438480559571093180 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 3), (15, 2)],
  term ((1241201616154444033511079542735534111410193461438480559571093180 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 4. -/
theorem ep_Q2_041_partial_04_0315_valid :
    mulPoly ep_Q2_041_coefficient_04_0315
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0316 : Poly :=
[
  term ((7311164962 : Rat) / 151763803) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 316 for generator 4. -/
def ep_Q2_041_partial_04_0316 : Poly :=
[
  term ((7311164962 : Rat) / 151763803) [(1, 1), (4, 2), (10, 1), (11, 1), (16, 1)],
  term ((7311164962 : Rat) / 151763803) [(1, 1), (5, 2), (10, 1), (11, 1), (16, 1)],
  term ((-7311164962 : Rat) / 151763803) [(1, 1), (10, 1), (11, 3), (16, 1)],
  term ((-7311164962 : Rat) / 151763803) [(1, 1), (10, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 4. -/
theorem ep_Q2_041_partial_04_0316_valid :
    mulPoly ep_Q2_041_coefficient_04_0316
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0317 : Poly :=
[
  term ((-56282970980211821728977592215664193877259041822264714737680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 317 for generator 4. -/
def ep_Q2_041_partial_04_0317 : Poly :=
[
  term ((-56282970980211821728977592215664193877259041822264714737680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (4, 2), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-56282970980211821728977592215664193877259041822264714737680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (5, 2), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((56282970980211821728977592215664193877259041822264714737680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 1), (11, 4), (14, 1), (15, 1)],
  term ((56282970980211821728977592215664193877259041822264714737680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 3), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 4. -/
theorem ep_Q2_041_partial_04_0317_valid :
    mulPoly ep_Q2_041_coefficient_04_0317
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0318 : Poly :=
[
  term ((1934495837280916615561189558626562217655444139341339009418920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 318 for generator 4. -/
def ep_Q2_041_partial_04_0318 : Poly :=
[
  term ((1934495837280916615561189558626562217655444139341339009418920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (10, 1), (11, 2), (15, 1)],
  term ((1934495837280916615561189558626562217655444139341339009418920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (10, 1), (11, 2), (15, 1)],
  term ((-1934495837280916615561189558626562217655444139341339009418920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 4), (15, 1)],
  term ((-1934495837280916615561189558626562217655444139341339009418920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 4. -/
theorem ep_Q2_041_partial_04_0318_valid :
    mulPoly ep_Q2_041_coefficient_04_0318
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0319 : Poly :=
[
  term ((-46938125629518110234 : Rat) / 259001945121800951) [(1, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 319 for generator 4. -/
def ep_Q2_041_partial_04_0319 : Poly :=
[
  term ((-46938125629518110234 : Rat) / 259001945121800951) [(1, 1), (4, 2), (10, 1), (12, 1), (13, 1)],
  term ((-46938125629518110234 : Rat) / 259001945121800951) [(1, 1), (5, 2), (10, 1), (12, 1), (13, 1)],
  term ((46938125629518110234 : Rat) / 259001945121800951) [(1, 1), (10, 1), (11, 2), (12, 1), (13, 1)],
  term ((46938125629518110234 : Rat) / 259001945121800951) [(1, 1), (10, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 4. -/
theorem ep_Q2_041_partial_04_0319_valid :
    mulPoly ep_Q2_041_coefficient_04_0319
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0320 : Poly :=
[
  term ((36329710873820453704908469759846869196073335854712797705423370 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 320 for generator 4. -/
def ep_Q2_041_partial_04_0320 : Poly :=
[
  term ((36329710873820453704908469759846869196073335854712797705423370 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (4, 2), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((36329710873820453704908469759846869196073335854712797705423370 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 2), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-36329710873820453704908469759846869196073335854712797705423370 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-36329710873820453704908469759846869196073335854712797705423370 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 3), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 4. -/
theorem ep_Q2_041_partial_04_0320_valid :
    mulPoly ep_Q2_041_coefficient_04_0320
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0321 : Poly :=
[
  term ((-3304939040 : Rat) / 151763803) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 321 for generator 4. -/
def ep_Q2_041_partial_04_0321 : Poly :=
[
  term ((-3304939040 : Rat) / 151763803) [(1, 1), (4, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3304939040 : Rat) / 151763803) [(1, 1), (5, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((3304939040 : Rat) / 151763803) [(1, 1), (10, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((3304939040 : Rat) / 151763803) [(1, 1), (10, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 4. -/
theorem ep_Q2_041_partial_04_0321_valid :
    mulPoly ep_Q2_041_coefficient_04_0321
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0322 : Poly :=
[
  term ((151762784719717487449061233576276388220322491199247177043960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 322 for generator 4. -/
def ep_Q2_041_partial_04_0322 : Poly :=
[
  term ((151762784719717487449061233576276388220322491199247177043960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((151762784719717487449061233576276388220322491199247177043960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-151762784719717487449061233576276388220322491199247177043960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-151762784719717487449061233576276388220322491199247177043960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 3), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 4. -/
theorem ep_Q2_041_partial_04_0322_valid :
    mulPoly ep_Q2_041_coefficient_04_0322
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0323 : Poly :=
[
  term ((-14997105462506511390078102866122788255007952787771030870137641064432675 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 323 for generator 4. -/
def ep_Q2_041_partial_04_0323 : Poly :=
[
  term ((-14997105462506511390078102866122788255007952787771030870137641064432675 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 1), (4, 2), (10, 1), (12, 1), (15, 1)],
  term ((-14997105462506511390078102866122788255007952787771030870137641064432675 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 1), (5, 2), (10, 1), (12, 1), (15, 1)],
  term ((14997105462506511390078102866122788255007952787771030870137641064432675 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((14997105462506511390078102866122788255007952787771030870137641064432675 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 1), (10, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 4. -/
theorem ep_Q2_041_partial_04_0323_valid :
    mulPoly ep_Q2_041_coefficient_04_0323
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0324 : Poly :=
[
  term ((-6416678142168 : Rat) / 275754830051) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 324 for generator 4. -/
def ep_Q2_041_partial_04_0324 : Poly :=
[
  term ((-6416678142168 : Rat) / 275754830051) [(1, 1), (4, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6416678142168 : Rat) / 275754830051) [(1, 1), (5, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((6416678142168 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((6416678142168 : Rat) / 275754830051) [(1, 1), (10, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 4. -/
theorem ep_Q2_041_partial_04_0324_valid :
    mulPoly ep_Q2_041_coefficient_04_0324
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0325 : Poly :=
[
  term ((-51441277022723016070 : Rat) / 259001945121800951) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 325 for generator 4. -/
def ep_Q2_041_partial_04_0325 : Poly :=
[
  term ((-51441277022723016070 : Rat) / 259001945121800951) [(1, 1), (4, 2), (10, 1), (13, 1)],
  term ((-51441277022723016070 : Rat) / 259001945121800951) [(1, 1), (5, 2), (10, 1), (13, 1)],
  term ((51441277022723016070 : Rat) / 259001945121800951) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((51441277022723016070 : Rat) / 259001945121800951) [(1, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 4. -/
theorem ep_Q2_041_partial_04_0325_valid :
    mulPoly ep_Q2_041_coefficient_04_0325
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0326 : Poly :=
[
  term ((127512074078569441162 : Rat) / 777005835365402853) [(1, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 326 for generator 4. -/
def ep_Q2_041_partial_04_0326 : Poly :=
[
  term ((127512074078569441162 : Rat) / 777005835365402853) [(1, 1), (4, 2), (10, 1), (13, 1), (14, 1)],
  term ((127512074078569441162 : Rat) / 777005835365402853) [(1, 1), (5, 2), (10, 1), (13, 1), (14, 1)],
  term ((-127512074078569441162 : Rat) / 777005835365402853) [(1, 1), (10, 1), (11, 2), (13, 1), (14, 1)],
  term ((-127512074078569441162 : Rat) / 777005835365402853) [(1, 1), (10, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 4. -/
theorem ep_Q2_041_partial_04_0326_valid :
    mulPoly ep_Q2_041_coefficient_04_0326
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0327 : Poly :=
[
  term ((-770217748531315330743962273130785842284298848770937565814376670 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 327 for generator 4. -/
def ep_Q2_041_partial_04_0327 : Poly :=
[
  term ((-770217748531315330743962273130785842284298848770937565814376670 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (4, 2), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-770217748531315330743962273130785842284298848770937565814376670 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (5, 2), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((770217748531315330743962273130785842284298848770937565814376670 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((770217748531315330743962273130785842284298848770937565814376670 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (10, 3), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 4. -/
theorem ep_Q2_041_partial_04_0327_valid :
    mulPoly ep_Q2_041_coefficient_04_0327
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0328 : Poly :=
[
  term ((8978194720 : Rat) / 455291409) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 328 for generator 4. -/
def ep_Q2_041_partial_04_0328 : Poly :=
[
  term ((8978194720 : Rat) / 455291409) [(1, 1), (4, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((8978194720 : Rat) / 455291409) [(1, 1), (5, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8978194720 : Rat) / 455291409) [(1, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-8978194720 : Rat) / 455291409) [(1, 1), (10, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 4. -/
theorem ep_Q2_041_partial_04_0328_valid :
    mulPoly ep_Q2_041_coefficient_04_0328
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0329 : Poly :=
[
  term ((1057980748646445416765236355229464385733593370701496517580631400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 329 for generator 4. -/
def ep_Q2_041_partial_04_0329 : Poly :=
[
  term ((1057980748646445416765236355229464385733593370701496517580631400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (4, 2), (10, 1), (13, 1), (15, 2)],
  term ((1057980748646445416765236355229464385733593370701496517580631400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 2), (10, 1), (13, 1), (15, 2)],
  term ((-1057980748646445416765236355229464385733593370701496517580631400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((-1057980748646445416765236355229464385733593370701496517580631400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 4. -/
theorem ep_Q2_041_partial_04_0329_valid :
    mulPoly ep_Q2_041_coefficient_04_0329
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0330 : Poly :=
[
  term ((-3613051784 : Rat) / 151763803) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 330 for generator 4. -/
def ep_Q2_041_partial_04_0330 : Poly :=
[
  term ((-3613051784 : Rat) / 151763803) [(1, 1), (4, 2), (10, 1), (13, 1), (16, 1)],
  term ((-3613051784 : Rat) / 151763803) [(1, 1), (5, 2), (10, 1), (13, 1), (16, 1)],
  term ((3613051784 : Rat) / 151763803) [(1, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((3613051784 : Rat) / 151763803) [(1, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 4. -/
theorem ep_Q2_041_partial_04_0330_valid :
    mulPoly ep_Q2_041_coefficient_04_0330
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0331 : Poly :=
[
  term ((-137426219361579533169122925411176054650251540613623287174760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 331 for generator 4. -/
def ep_Q2_041_partial_04_0331 : Poly :=
[
  term ((-137426219361579533169122925411176054650251540613623287174760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-137426219361579533169122925411176054650251540613623287174760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((137426219361579533169122925411176054650251540613623287174760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((137426219361579533169122925411176054650251540613623287174760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 3), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 4. -/
theorem ep_Q2_041_partial_04_0331_valid :
    mulPoly ep_Q2_041_coefficient_04_0331
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0332 : Poly :=
[
  term ((184653907744440733363535911779439640035698348184230091688100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (13, 2), (15, 1)]
]

/-- Partial product 332 for generator 4. -/
def ep_Q2_041_partial_04_0332 : Poly :=
[
  term ((184653907744440733363535911779439640035698348184230091688100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (10, 1), (13, 2), (15, 1)],
  term ((184653907744440733363535911779439640035698348184230091688100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (10, 1), (13, 2), (15, 1)],
  term ((-184653907744440733363535911779439640035698348184230091688100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 2), (13, 2), (15, 1)],
  term ((-184653907744440733363535911779439640035698348184230091688100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 4. -/
theorem ep_Q2_041_partial_04_0332_valid :
    mulPoly ep_Q2_041_coefficient_04_0332
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0333 : Poly :=
[
  term ((21314131261055703700341448595409505302307144463949090888811642057865423047 : Rat) / 148513784694998746745810557987091002645721919739117703890909801474936536) [(1, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 333 for generator 4. -/
def ep_Q2_041_partial_04_0333 : Poly :=
[
  term ((21314131261055703700341448595409505302307144463949090888811642057865423047 : Rat) / 148513784694998746745810557987091002645721919739117703890909801474936536) [(1, 1), (4, 2), (10, 1), (14, 1), (15, 1)],
  term ((21314131261055703700341448595409505302307144463949090888811642057865423047 : Rat) / 148513784694998746745810557987091002645721919739117703890909801474936536) [(1, 1), (5, 2), (10, 1), (14, 1), (15, 1)],
  term ((-21314131261055703700341448595409505302307144463949090888811642057865423047 : Rat) / 148513784694998746745810557987091002645721919739117703890909801474936536) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-21314131261055703700341448595409505302307144463949090888811642057865423047 : Rat) / 148513784694998746745810557987091002645721919739117703890909801474936536) [(1, 1), (10, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 4. -/
theorem ep_Q2_041_partial_04_0333_valid :
    mulPoly ep_Q2_041_coefficient_04_0333
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0334 : Poly :=
[
  term ((-14052215491684 : Rat) / 275754830051) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 334 for generator 4. -/
def ep_Q2_041_partial_04_0334 : Poly :=
[
  term ((-14052215491684 : Rat) / 275754830051) [(1, 1), (4, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14052215491684 : Rat) / 275754830051) [(1, 1), (5, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((14052215491684 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((14052215491684 : Rat) / 275754830051) [(1, 1), (10, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 4. -/
theorem ep_Q2_041_partial_04_0334_valid :
    mulPoly ep_Q2_041_coefficient_04_0334
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0335 : Poly :=
[
  term ((-2341478788815569651767713800442868806767679099388616797253437742534412447 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 335 for generator 4. -/
def ep_Q2_041_partial_04_0335 : Poly :=
[
  term ((-2341478788815569651767713800442868806767679099388616797253437742534412447 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (4, 2), (10, 1), (15, 1)],
  term ((-2341478788815569651767713800442868806767679099388616797253437742534412447 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (5, 2), (10, 1), (15, 1)],
  term ((2341478788815569651767713800442868806767679099388616797253437742534412447 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((2341478788815569651767713800442868806767679099388616797253437742534412447 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 4. -/
theorem ep_Q2_041_partial_04_0335_valid :
    mulPoly ep_Q2_041_coefficient_04_0335
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0336 : Poly :=
[
  term ((30178765557114 : Rat) / 275754830051) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 4. -/
def ep_Q2_041_partial_04_0336 : Poly :=
[
  term ((30178765557114 : Rat) / 275754830051) [(1, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((30178765557114 : Rat) / 275754830051) [(1, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((-30178765557114 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-30178765557114 : Rat) / 275754830051) [(1, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 4. -/
theorem ep_Q2_041_partial_04_0336_valid :
    mulPoly ep_Q2_041_coefficient_04_0336
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0337 : Poly :=
[
  term ((207494564124178103772692210021626493027203407505247289285280 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 337 for generator 4. -/
def ep_Q2_041_partial_04_0337 : Poly :=
[
  term ((207494564124178103772692210021626493027203407505247289285280 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (4, 2), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((207494564124178103772692210021626493027203407505247289285280 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (5, 2), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-207494564124178103772692210021626493027203407505247289285280 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 2), (11, 3), (13, 1), (15, 1)],
  term ((-207494564124178103772692210021626493027203407505247289285280 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 4), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 4. -/
theorem ep_Q2_041_partial_04_0337_valid :
    mulPoly ep_Q2_041_coefficient_04_0337
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0338 : Poly :=
[
  term ((-2092068966833169898387283093903305101008395043213441178055555200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 1), (15, 2)]
]

/-- Partial product 338 for generator 4. -/
def ep_Q2_041_partial_04_0338 : Poly :=
[
  term ((-2092068966833169898387283093903305101008395043213441178055555200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (4, 2), (10, 2), (11, 1), (15, 2)],
  term ((-2092068966833169898387283093903305101008395043213441178055555200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 2), (10, 2), (11, 1), (15, 2)],
  term ((2092068966833169898387283093903305101008395043213441178055555200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 3), (15, 2)],
  term ((2092068966833169898387283093903305101008395043213441178055555200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 4), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 4. -/
theorem ep_Q2_041_partial_04_0338_valid :
    mulPoly ep_Q2_041_coefficient_04_0338
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0339 : Poly :=
[
  term ((7221250096848940036 : Rat) / 37000277874542993) [(1, 1), (10, 2), (13, 1)]
]

/-- Partial product 339 for generator 4. -/
def ep_Q2_041_partial_04_0339 : Poly :=
[
  term ((7221250096848940036 : Rat) / 37000277874542993) [(1, 1), (4, 2), (10, 2), (13, 1)],
  term ((7221250096848940036 : Rat) / 37000277874542993) [(1, 1), (5, 2), (10, 2), (13, 1)],
  term ((-7221250096848940036 : Rat) / 37000277874542993) [(1, 1), (10, 2), (11, 2), (13, 1)],
  term ((-7221250096848940036 : Rat) / 37000277874542993) [(1, 1), (10, 4), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 4. -/
theorem ep_Q2_041_partial_04_0339_valid :
    mulPoly ep_Q2_041_coefficient_04_0339
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0340 : Poly :=
[
  term ((-659990923945154012672189927418830708628257469547127537720595840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 2), (13, 1), (15, 2)]
]

/-- Partial product 340 for generator 4. -/
def ep_Q2_041_partial_04_0340 : Poly :=
[
  term ((-659990923945154012672189927418830708628257469547127537720595840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (4, 2), (10, 2), (13, 1), (15, 2)],
  term ((-659990923945154012672189927418830708628257469547127537720595840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 2), (10, 2), (13, 1), (15, 2)],
  term ((659990923945154012672189927418830708628257469547127537720595840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 2), (11, 2), (13, 1), (15, 2)],
  term ((659990923945154012672189927418830708628257469547127537720595840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 4), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 4. -/
theorem ep_Q2_041_partial_04_0340_valid :
    mulPoly ep_Q2_041_coefficient_04_0340
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0341 : Poly :=
[
  term ((3559165120 : Rat) / 151763803) [(1, 1), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 341 for generator 4. -/
def ep_Q2_041_partial_04_0341 : Poly :=
[
  term ((3559165120 : Rat) / 151763803) [(1, 1), (4, 2), (10, 2), (13, 1), (16, 1)],
  term ((3559165120 : Rat) / 151763803) [(1, 1), (5, 2), (10, 2), (13, 1), (16, 1)],
  term ((-3559165120 : Rat) / 151763803) [(1, 1), (10, 2), (11, 2), (13, 1), (16, 1)],
  term ((-3559165120 : Rat) / 151763803) [(1, 1), (10, 4), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 4. -/
theorem ep_Q2_041_partial_04_0341_valid :
    mulPoly ep_Q2_041_coefficient_04_0341
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0342 : Poly :=
[
  term ((-23348120726110382684470959011734828956972690953730334929840 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 2), (13, 2), (15, 1)]
]

/-- Partial product 342 for generator 4. -/
def ep_Q2_041_partial_04_0342 : Poly :=
[
  term ((-23348120726110382684470959011734828956972690953730334929840 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (4, 2), (10, 2), (13, 2), (15, 1)],
  term ((-23348120726110382684470959011734828956972690953730334929840 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (5, 2), (10, 2), (13, 2), (15, 1)],
  term ((23348120726110382684470959011734828956972690953730334929840 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 2), (11, 2), (13, 2), (15, 1)],
  term ((23348120726110382684470959011734828956972690953730334929840 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 4), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 4. -/
theorem ep_Q2_041_partial_04_0342_valid :
    mulPoly ep_Q2_041_coefficient_04_0342
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0343 : Poly :=
[
  term ((327475631325046536562210390551735563480208834484865961447291673390716580 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 2), (15, 1)]
]

/-- Partial product 343 for generator 4. -/
def ep_Q2_041_partial_04_0343 : Poly :=
[
  term ((327475631325046536562210390551735563480208834484865961447291673390716580 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (4, 2), (10, 2), (15, 1)],
  term ((327475631325046536562210390551735563480208834484865961447291673390716580 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 2), (10, 2), (15, 1)],
  term ((-327475631325046536562210390551735563480208834484865961447291673390716580 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 2), (11, 2), (15, 1)],
  term ((-327475631325046536562210390551735563480208834484865961447291673390716580 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 4. -/
theorem ep_Q2_041_partial_04_0343_valid :
    mulPoly ep_Q2_041_coefficient_04_0343
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0344 : Poly :=
[
  term ((116569860696576 : Rat) / 275754830051) [(1, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 344 for generator 4. -/
def ep_Q2_041_partial_04_0344 : Poly :=
[
  term ((116569860696576 : Rat) / 275754830051) [(1, 1), (4, 2), (10, 2), (15, 1), (16, 1)],
  term ((116569860696576 : Rat) / 275754830051) [(1, 1), (5, 2), (10, 2), (15, 1), (16, 1)],
  term ((-116569860696576 : Rat) / 275754830051) [(1, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term ((-116569860696576 : Rat) / 275754830051) [(1, 1), (10, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 4. -/
theorem ep_Q2_041_partial_04_0344_valid :
    mulPoly ep_Q2_041_coefficient_04_0344
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0345 : Poly :=
[
  term ((123413653059028303469 : Rat) / 518003890243601902) [(1, 1), (11, 1)]
]

/-- Partial product 345 for generator 4. -/
def ep_Q2_041_partial_04_0345 : Poly :=
[
  term ((123413653059028303469 : Rat) / 518003890243601902) [(1, 1), (4, 2), (11, 1)],
  term ((123413653059028303469 : Rat) / 518003890243601902) [(1, 1), (5, 2), (11, 1)],
  term ((-123413653059028303469 : Rat) / 518003890243601902) [(1, 1), (10, 2), (11, 1)],
  term ((-123413653059028303469 : Rat) / 518003890243601902) [(1, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 4. -/
theorem ep_Q2_041_partial_04_0345_valid :
    mulPoly ep_Q2_041_coefficient_04_0345
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0346 : Poly :=
[
  term ((-174817807033103331270 : Rat) / 259001945121800951) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 346 for generator 4. -/
def ep_Q2_041_partial_04_0346 : Poly :=
[
  term ((-174817807033103331270 : Rat) / 259001945121800951) [(1, 1), (4, 2), (11, 1), (12, 1)],
  term ((-174817807033103331270 : Rat) / 259001945121800951) [(1, 1), (5, 2), (11, 1), (12, 1)],
  term ((174817807033103331270 : Rat) / 259001945121800951) [(1, 1), (10, 2), (11, 1), (12, 1)],
  term ((174817807033103331270 : Rat) / 259001945121800951) [(1, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 4. -/
theorem ep_Q2_041_partial_04_0346_valid :
    mulPoly ep_Q2_041_coefficient_04_0346
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0347 : Poly :=
[
  term ((-1714911507669309992415780722271992153580920143742614738727600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 347 for generator 4. -/
def ep_Q2_041_partial_04_0347 : Poly :=
[
  term ((-1714911507669309992415780722271992153580920143742614738727600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1714911507669309992415780722271992153580920143742614738727600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1714911507669309992415780722271992153580920143742614738727600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1714911507669309992415780722271992153580920143742614738727600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 3), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 4. -/
theorem ep_Q2_041_partial_04_0347_valid :
    mulPoly ep_Q2_041_coefficient_04_0347
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0348 : Poly :=
[
  term ((2390374057795299247778421947827613666745456803793932387313560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 348 for generator 4. -/
def ep_Q2_041_partial_04_0348 : Poly :=
[
  term ((2390374057795299247778421947827613666745456803793932387313560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((2390374057795299247778421947827613666745456803793932387313560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2390374057795299247778421947827613666745456803793932387313560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2390374057795299247778421947827613666745456803793932387313560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 3), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 4. -/
theorem ep_Q2_041_partial_04_0348_valid :
    mulPoly ep_Q2_041_coefficient_04_0348
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0349 : Poly :=
[
  term ((-5394858667228630698089997460562288818707288595136429521417280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 349 for generator 4. -/
def ep_Q2_041_partial_04_0349 : Poly :=
[
  term ((-5394858667228630698089997460562288818707288595136429521417280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-5394858667228630698089997460562288818707288595136429521417280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((5394858667228630698089997460562288818707288595136429521417280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((5394858667228630698089997460562288818707288595136429521417280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 3), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 4. -/
theorem ep_Q2_041_partial_04_0349_valid :
    mulPoly ep_Q2_041_coefficient_04_0349
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0350 : Poly :=
[
  term ((113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 350 for generator 4. -/
def ep_Q2_041_partial_04_0350 : Poly :=
[
  term ((113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (4, 2), (11, 1), (12, 1), (14, 1)],
  term ((113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (5, 2), (11, 1), (12, 1), (14, 1)],
  term ((-113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((-113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (11, 3), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 4. -/
theorem ep_Q2_041_partial_04_0350_valid :
    mulPoly ep_Q2_041_coefficient_04_0350
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0351 : Poly :=
[
  term ((115159554375110428077936196144767190225981875507139606256972350 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 351 for generator 4. -/
def ep_Q2_041_partial_04_0351 : Poly :=
[
  term ((115159554375110428077936196144767190225981875507139606256972350 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (4, 2), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((115159554375110428077936196144767190225981875507139606256972350 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 2), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-115159554375110428077936196144767190225981875507139606256972350 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-115159554375110428077936196144767190225981875507139606256972350 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 3), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 4. -/
theorem ep_Q2_041_partial_04_0351_valid :
    mulPoly ep_Q2_041_coefficient_04_0351
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0352 : Poly :=
[
  term ((7974670720 : Rat) / 151763803) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 352 for generator 4. -/
def ep_Q2_041_partial_04_0352 : Poly :=
[
  term ((7974670720 : Rat) / 151763803) [(1, 1), (4, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((7974670720 : Rat) / 151763803) [(1, 1), (5, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-7974670720 : Rat) / 151763803) [(1, 1), (10, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-7974670720 : Rat) / 151763803) [(1, 1), (11, 3), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 4. -/
theorem ep_Q2_041_partial_04_0352_valid :
    mulPoly ep_Q2_041_coefficient_04_0352
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0353 : Poly :=
[
  term ((-380342316945755781724151022432883902785096813213954011559240320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 353 for generator 4. -/
def ep_Q2_041_partial_04_0353 : Poly :=
[
  term ((-380342316945755781724151022432883902785096813213954011559240320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (4, 2), (11, 1), (12, 1), (15, 2)],
  term ((-380342316945755781724151022432883902785096813213954011559240320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 2), (11, 1), (12, 1), (15, 2)],
  term ((380342316945755781724151022432883902785096813213954011559240320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 1), (12, 1), (15, 2)],
  term ((380342316945755781724151022432883902785096813213954011559240320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 4. -/
theorem ep_Q2_041_partial_04_0353_valid :
    mulPoly ep_Q2_041_coefficient_04_0353
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0354 : Poly :=
[
  term ((460638217500441712311744784579068760903927502028558425027889400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 1), (12, 1), (15, 4)]
]

/-- Partial product 354 for generator 4. -/
def ep_Q2_041_partial_04_0354 : Poly :=
[
  term ((460638217500441712311744784579068760903927502028558425027889400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (4, 2), (11, 1), (12, 1), (15, 4)],
  term ((460638217500441712311744784579068760903927502028558425027889400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 2), (11, 1), (12, 1), (15, 4)],
  term ((-460638217500441712311744784579068760903927502028558425027889400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 1), (12, 1), (15, 4)],
  term ((-460638217500441712311744784579068760903927502028558425027889400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 3), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 4. -/
theorem ep_Q2_041_partial_04_0354_valid :
    mulPoly ep_Q2_041_coefficient_04_0354
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0355 : Poly :=
[
  term ((-12969474324 : Rat) / 151763803) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 355 for generator 4. -/
def ep_Q2_041_partial_04_0355 : Poly :=
[
  term ((-12969474324 : Rat) / 151763803) [(1, 1), (4, 2), (11, 1), (12, 1), (16, 1)],
  term ((-12969474324 : Rat) / 151763803) [(1, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((12969474324 : Rat) / 151763803) [(1, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((12969474324 : Rat) / 151763803) [(1, 1), (11, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 4. -/
theorem ep_Q2_041_partial_04_0355_valid :
    mulPoly ep_Q2_041_coefficient_04_0355
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0356 : Poly :=
[
  term ((-1370912442573543607347643763521217650023348345138113212309443565072363723 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 356 for generator 4. -/
def ep_Q2_041_partial_04_0356 : Poly :=
[
  term ((-1370912442573543607347643763521217650023348345138113212309443565072363723 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (4, 2), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1370912442573543607347643763521217650023348345138113212309443565072363723 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 2), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1370912442573543607347643763521217650023348345138113212309443565072363723 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1370912442573543607347643763521217650023348345138113212309443565072363723 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 3), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 4. -/
theorem ep_Q2_041_partial_04_0356_valid :
    mulPoly ep_Q2_041_coefficient_04_0356
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0357 : Poly :=
[
  term ((-369458564416 : Rat) / 275754830051) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 357 for generator 4. -/
def ep_Q2_041_partial_04_0357 : Poly :=
[
  term ((-369458564416 : Rat) / 275754830051) [(1, 1), (4, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-369458564416 : Rat) / 275754830051) [(1, 1), (5, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((369458564416 : Rat) / 275754830051) [(1, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((369458564416 : Rat) / 275754830051) [(1, 1), (11, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 4. -/
theorem ep_Q2_041_partial_04_0357_valid :
    mulPoly ep_Q2_041_coefficient_04_0357
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0358 : Poly :=
[
  term ((-10904910875897794234780415077936570541961075748033633533704166120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 358 for generator 4. -/
def ep_Q2_041_partial_04_0358 : Poly :=
[
  term ((-10904910875897794234780415077936570541961075748033633533704166120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (4, 2), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((-10904910875897794234780415077936570541961075748033633533704166120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 2), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((10904910875897794234780415077936570541961075748033633533704166120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((10904910875897794234780415077936570541961075748033633533704166120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 3), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 4. -/
theorem ep_Q2_041_partial_04_0358_valid :
    mulPoly ep_Q2_041_coefficient_04_0358
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0359 : Poly :=
[
  term ((4541216776696691339137425627753541829732324322750769743059680 : Rat) / 67321479313495425984879586780610574998465487050464258946217) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 359 for generator 4. -/
def ep_Q2_041_partial_04_0359 : Poly :=
[
  term ((4541216776696691339137425627753541829732324322750769743059680 : Rat) / 67321479313495425984879586780610574998465487050464258946217) [(1, 1), (4, 2), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((4541216776696691339137425627753541829732324322750769743059680 : Rat) / 67321479313495425984879586780610574998465487050464258946217) [(1, 1), (5, 2), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4541216776696691339137425627753541829732324322750769743059680 : Rat) / 67321479313495425984879586780610574998465487050464258946217) [(1, 1), (10, 2), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4541216776696691339137425627753541829732324322750769743059680 : Rat) / 67321479313495425984879586780610574998465487050464258946217) [(1, 1), (11, 3), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 4. -/
theorem ep_Q2_041_partial_04_0359_valid :
    mulPoly ep_Q2_041_coefficient_04_0359
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0360 : Poly :=
[
  term ((-274975893126363050450174493383757132572779009070512773321753285746632417 : Rat) / 21216254956428392392258651141013000377960274248445386270129971639276648) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 360 for generator 4. -/
def ep_Q2_041_partial_04_0360 : Poly :=
[
  term ((-274975893126363050450174493383757132572779009070512773321753285746632417 : Rat) / 21216254956428392392258651141013000377960274248445386270129971639276648) [(1, 1), (4, 2), (11, 1), (13, 1), (15, 1)],
  term ((-274975893126363050450174493383757132572779009070512773321753285746632417 : Rat) / 21216254956428392392258651141013000377960274248445386270129971639276648) [(1, 1), (5, 2), (11, 1), (13, 1), (15, 1)],
  term ((274975893126363050450174493383757132572779009070512773321753285746632417 : Rat) / 21216254956428392392258651141013000377960274248445386270129971639276648) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((274975893126363050450174493383757132572779009070512773321753285746632417 : Rat) / 21216254956428392392258651141013000377960274248445386270129971639276648) [(1, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 4. -/
theorem ep_Q2_041_partial_04_0360_valid :
    mulPoly ep_Q2_041_coefficient_04_0360
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0361 : Poly :=
[
  term ((25999106718296 : Rat) / 827264490153) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 361 for generator 4. -/
def ep_Q2_041_partial_04_0361 : Poly :=
[
  term ((25999106718296 : Rat) / 827264490153) [(1, 1), (4, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((25999106718296 : Rat) / 827264490153) [(1, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25999106718296 : Rat) / 827264490153) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25999106718296 : Rat) / 827264490153) [(1, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 4. -/
theorem ep_Q2_041_partial_04_0361_valid :
    mulPoly ep_Q2_041_coefficient_04_0361
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0362 : Poly :=
[
  term ((68039146333527016292551767643569792651011975149463429213104543510 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (11, 1), (13, 1), (15, 3)]
]

/-- Partial product 362 for generator 4. -/
def ep_Q2_041_partial_04_0362 : Poly :=
[
  term ((68039146333527016292551767643569792651011975149463429213104543510 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (4, 2), (11, 1), (13, 1), (15, 3)],
  term ((68039146333527016292551767643569792651011975149463429213104543510 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (5, 2), (11, 1), (13, 1), (15, 3)],
  term ((-68039146333527016292551767643569792651011975149463429213104543510 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 3)],
  term ((-68039146333527016292551767643569792651011975149463429213104543510 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (11, 3), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 4. -/
theorem ep_Q2_041_partial_04_0362_valid :
    mulPoly ep_Q2_041_coefficient_04_0362
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0363 : Poly :=
[
  term ((-36296283381530198602 : Rat) / 37000277874542993) [(1, 1), (11, 1), (13, 2)]
]

/-- Partial product 363 for generator 4. -/
def ep_Q2_041_partial_04_0363 : Poly :=
[
  term ((-36296283381530198602 : Rat) / 37000277874542993) [(1, 1), (4, 2), (11, 1), (13, 2)],
  term ((-36296283381530198602 : Rat) / 37000277874542993) [(1, 1), (5, 2), (11, 1), (13, 2)],
  term ((36296283381530198602 : Rat) / 37000277874542993) [(1, 1), (10, 2), (11, 1), (13, 2)],
  term ((36296283381530198602 : Rat) / 37000277874542993) [(1, 1), (11, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 4. -/
theorem ep_Q2_041_partial_04_0363_valid :
    mulPoly ep_Q2_041_coefficient_04_0363
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0364 : Poly :=
[
  term ((389947505229842761944 : Rat) / 259001945121800951) [(1, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 364 for generator 4. -/
def ep_Q2_041_partial_04_0364 : Poly :=
[
  term ((389947505229842761944 : Rat) / 259001945121800951) [(1, 1), (4, 2), (11, 1), (13, 2), (14, 1)],
  term ((389947505229842761944 : Rat) / 259001945121800951) [(1, 1), (5, 2), (11, 1), (13, 2), (14, 1)],
  term ((-389947505229842761944 : Rat) / 259001945121800951) [(1, 1), (10, 2), (11, 1), (13, 2), (14, 1)],
  term ((-389947505229842761944 : Rat) / 259001945121800951) [(1, 1), (11, 3), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 4. -/
theorem ep_Q2_041_partial_04_0364_valid :
    mulPoly ep_Q2_041_coefficient_04_0364
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0365 : Poly :=
[
  term ((10055112496190615523613175469394604525295764331643336754610590960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 365 for generator 4. -/
def ep_Q2_041_partial_04_0365 : Poly :=
[
  term ((10055112496190615523613175469394604525295764331643336754610590960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (4, 2), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((10055112496190615523613175469394604525295764331643336754610590960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 2), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((-10055112496190615523613175469394604525295764331643336754610590960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 2), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((-10055112496190615523613175469394604525295764331643336754610590960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 3), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 4. -/
theorem ep_Q2_041_partial_04_0365_valid :
    mulPoly ep_Q2_041_coefficient_04_0365
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0366 : Poly :=
[
  term ((27456416640 : Rat) / 151763803) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 366 for generator 4. -/
def ep_Q2_041_partial_04_0366 : Poly :=
[
  term ((27456416640 : Rat) / 151763803) [(1, 1), (4, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((27456416640 : Rat) / 151763803) [(1, 1), (5, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-27456416640 : Rat) / 151763803) [(1, 1), (10, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-27456416640 : Rat) / 151763803) [(1, 1), (11, 3), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 4. -/
theorem ep_Q2_041_partial_04_0366_valid :
    mulPoly ep_Q2_041_coefficient_04_0366
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0367 : Poly :=
[
  term ((-7241438305045521702289815036568673812837954433596423816177773550 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 1), (13, 2), (15, 2)]
]

/-- Partial product 367 for generator 4. -/
def ep_Q2_041_partial_04_0367 : Poly :=
[
  term ((-7241438305045521702289815036568673812837954433596423816177773550 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (4, 2), (11, 1), (13, 2), (15, 2)],
  term ((-7241438305045521702289815036568673812837954433596423816177773550 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 2), (11, 1), (13, 2), (15, 2)],
  term ((7241438305045521702289815036568673812837954433596423816177773550 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 2), (11, 1), (13, 2), (15, 2)],
  term ((7241438305045521702289815036568673812837954433596423816177773550 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 3), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 4. -/
theorem ep_Q2_041_partial_04_0367_valid :
    mulPoly ep_Q2_041_coefficient_04_0367
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0368 : Poly :=
[
  term ((-17889487840 : Rat) / 151763803) [(1, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 368 for generator 4. -/
def ep_Q2_041_partial_04_0368 : Poly :=
[
  term ((-17889487840 : Rat) / 151763803) [(1, 1), (4, 2), (11, 1), (13, 2), (16, 1)],
  term ((-17889487840 : Rat) / 151763803) [(1, 1), (5, 2), (11, 1), (13, 2), (16, 1)],
  term ((17889487840 : Rat) / 151763803) [(1, 1), (10, 2), (11, 1), (13, 2), (16, 1)],
  term ((17889487840 : Rat) / 151763803) [(1, 1), (11, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 4. -/
theorem ep_Q2_041_partial_04_0368_valid :
    mulPoly ep_Q2_041_coefficient_04_0368
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0369 : Poly :=
[
  term ((-1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 1), (13, 3), (14, 1), (15, 1)]
]

/-- Partial product 369 for generator 4. -/
def ep_Q2_041_partial_04_0369 : Poly :=
[
  term ((-1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (11, 1), (13, 3), (14, 1), (15, 1)],
  term ((-1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (11, 1), (13, 3), (14, 1), (15, 1)],
  term ((1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 1), (13, 3), (14, 1), (15, 1)],
  term ((1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 3), (13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 4. -/
theorem ep_Q2_041_partial_04_0369_valid :
    mulPoly ep_Q2_041_coefficient_04_0369
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0370 : Poly :=
[
  term ((117355027860186397177209293980035587652152209793749841357880 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (11, 1), (13, 3), (15, 1)]
]

/-- Partial product 370 for generator 4. -/
def ep_Q2_041_partial_04_0370 : Poly :=
[
  term ((117355027860186397177209293980035587652152209793749841357880 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (4, 2), (11, 1), (13, 3), (15, 1)],
  term ((117355027860186397177209293980035587652152209793749841357880 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (5, 2), (11, 1), (13, 3), (15, 1)],
  term ((-117355027860186397177209293980035587652152209793749841357880 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 2), (11, 1), (13, 3), (15, 1)],
  term ((-117355027860186397177209293980035587652152209793749841357880 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (11, 3), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 4. -/
theorem ep_Q2_041_partial_04_0370_valid :
    mulPoly ep_Q2_041_coefficient_04_0370
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0371 : Poly :=
[
  term ((45254405443667665464 : Rat) / 259001945121800951) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 371 for generator 4. -/
def ep_Q2_041_partial_04_0371 : Poly :=
[
  term ((45254405443667665464 : Rat) / 259001945121800951) [(1, 1), (4, 2), (11, 1), (14, 1)],
  term ((45254405443667665464 : Rat) / 259001945121800951) [(1, 1), (5, 2), (11, 1), (14, 1)],
  term ((-45254405443667665464 : Rat) / 259001945121800951) [(1, 1), (10, 2), (11, 1), (14, 1)],
  term ((-45254405443667665464 : Rat) / 259001945121800951) [(1, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 4. -/
theorem ep_Q2_041_partial_04_0371_valid :
    mulPoly ep_Q2_041_coefficient_04_0371
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0372 : Poly :=
[
  term ((-1384792544919375154888221279392915540213740217424365079588508040015884095 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 372 for generator 4. -/
def ep_Q2_041_partial_04_0372 : Poly :=
[
  term ((-1384792544919375154888221279392915540213740217424365079588508040015884095 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (4, 2), (11, 1), (14, 1), (15, 2)],
  term ((-1384792544919375154888221279392915540213740217424365079588508040015884095 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (5, 2), (11, 1), (14, 1), (15, 2)],
  term ((1384792544919375154888221279392915540213740217424365079588508040015884095 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (10, 2), (11, 1), (14, 1), (15, 2)],
  term ((1384792544919375154888221279392915540213740217424365079588508040015884095 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (11, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 4. -/
theorem ep_Q2_041_partial_04_0372_valid :
    mulPoly ep_Q2_041_coefficient_04_0372
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0373 : Poly :=
[
  term ((54794217545088 : Rat) / 275754830051) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 373 for generator 4. -/
def ep_Q2_041_partial_04_0373 : Poly :=
[
  term ((54794217545088 : Rat) / 275754830051) [(1, 1), (4, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((54794217545088 : Rat) / 275754830051) [(1, 1), (5, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-54794217545088 : Rat) / 275754830051) [(1, 1), (10, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-54794217545088 : Rat) / 275754830051) [(1, 1), (11, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 4. -/
theorem ep_Q2_041_partial_04_0373_valid :
    mulPoly ep_Q2_041_coefficient_04_0373
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0374 : Poly :=
[
  term ((11627623144 : Rat) / 151763803) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 374 for generator 4. -/
def ep_Q2_041_partial_04_0374 : Poly :=
[
  term ((11627623144 : Rat) / 151763803) [(1, 1), (4, 2), (11, 1), (14, 1), (16, 1)],
  term ((11627623144 : Rat) / 151763803) [(1, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-11627623144 : Rat) / 151763803) [(1, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-11627623144 : Rat) / 151763803) [(1, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 4. -/
theorem ep_Q2_041_partial_04_0374_valid :
    mulPoly ep_Q2_041_coefficient_04_0374
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0375 : Poly :=
[
  term ((-93720912000626928786 : Rat) / 259001945121800951) [(1, 1), (11, 1), (14, 2)]
]

/-- Partial product 375 for generator 4. -/
def ep_Q2_041_partial_04_0375 : Poly :=
[
  term ((-93720912000626928786 : Rat) / 259001945121800951) [(1, 1), (4, 2), (11, 1), (14, 2)],
  term ((-93720912000626928786 : Rat) / 259001945121800951) [(1, 1), (5, 2), (11, 1), (14, 2)],
  term ((93720912000626928786 : Rat) / 259001945121800951) [(1, 1), (10, 2), (11, 1), (14, 2)],
  term ((93720912000626928786 : Rat) / 259001945121800951) [(1, 1), (11, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 4. -/
theorem ep_Q2_041_partial_04_0375_valid :
    mulPoly ep_Q2_041_coefficient_04_0375
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0376 : Poly :=
[
  term ((11830293031032908468473483683865186808553338303749509653780240 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (11, 1), (14, 2), (15, 2)]
]

/-- Partial product 376 for generator 4. -/
def ep_Q2_041_partial_04_0376 : Poly :=
[
  term ((11830293031032908468473483683865186808553338303749509653780240 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (4, 2), (11, 1), (14, 2), (15, 2)],
  term ((11830293031032908468473483683865186808553338303749509653780240 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (5, 2), (11, 1), (14, 2), (15, 2)],
  term ((-11830293031032908468473483683865186808553338303749509653780240 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (10, 2), (11, 1), (14, 2), (15, 2)],
  term ((-11830293031032908468473483683865186808553338303749509653780240 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (11, 3), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 4. -/
theorem ep_Q2_041_partial_04_0376_valid :
    mulPoly ep_Q2_041_coefficient_04_0376
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0377 : Poly :=
[
  term ((-11253026820 : Rat) / 151763803) [(1, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 377 for generator 4. -/
def ep_Q2_041_partial_04_0377 : Poly :=
[
  term ((-11253026820 : Rat) / 151763803) [(1, 1), (4, 2), (11, 1), (14, 2), (16, 1)],
  term ((-11253026820 : Rat) / 151763803) [(1, 1), (5, 2), (11, 1), (14, 2), (16, 1)],
  term ((11253026820 : Rat) / 151763803) [(1, 1), (10, 2), (11, 1), (14, 2), (16, 1)],
  term ((11253026820 : Rat) / 151763803) [(1, 1), (11, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 4. -/
theorem ep_Q2_041_partial_04_0377_valid :
    mulPoly ep_Q2_041_coefficient_04_0377
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0378 : Poly :=
[
  term ((17640182966144765173718845696280224751698269669172057458510528350078924789 : Rat) / 10608127478214196196129325570506500188980137124222693135064985819638324) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 378 for generator 4. -/
def ep_Q2_041_partial_04_0378 : Poly :=
[
  term ((17640182966144765173718845696280224751698269669172057458510528350078924789 : Rat) / 10608127478214196196129325570506500188980137124222693135064985819638324) [(1, 1), (4, 2), (11, 1), (15, 2)],
  term ((17640182966144765173718845696280224751698269669172057458510528350078924789 : Rat) / 10608127478214196196129325570506500188980137124222693135064985819638324) [(1, 1), (5, 2), (11, 1), (15, 2)],
  term ((-17640182966144765173718845696280224751698269669172057458510528350078924789 : Rat) / 10608127478214196196129325570506500188980137124222693135064985819638324) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((-17640182966144765173718845696280224751698269669172057458510528350078924789 : Rat) / 10608127478214196196129325570506500188980137124222693135064985819638324) [(1, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 4. -/
theorem ep_Q2_041_partial_04_0378_valid :
    mulPoly ep_Q2_041_coefficient_04_0378
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0379 : Poly :=
[
  term ((-44179831922824 : Rat) / 275754830051) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 379 for generator 4. -/
def ep_Q2_041_partial_04_0379 : Poly :=
[
  term ((-44179831922824 : Rat) / 275754830051) [(1, 1), (4, 2), (11, 1), (15, 2), (16, 1)],
  term ((-44179831922824 : Rat) / 275754830051) [(1, 1), (5, 2), (11, 1), (15, 2), (16, 1)],
  term ((44179831922824 : Rat) / 275754830051) [(1, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((44179831922824 : Rat) / 275754830051) [(1, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 4. -/
theorem ep_Q2_041_partial_04_0379_valid :
    mulPoly ep_Q2_041_coefficient_04_0379
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0380 : Poly :=
[
  term ((-1849941939163898863591590401570112405166223782897842442211175310 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (11, 1), (15, 4)]
]

/-- Partial product 380 for generator 4. -/
def ep_Q2_041_partial_04_0380 : Poly :=
[
  term ((-1849941939163898863591590401570112405166223782897842442211175310 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (4, 2), (11, 1), (15, 4)],
  term ((-1849941939163898863591590401570112405166223782897842442211175310 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (5, 2), (11, 1), (15, 4)],
  term ((1849941939163898863591590401570112405166223782897842442211175310 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (10, 2), (11, 1), (15, 4)],
  term ((1849941939163898863591590401570112405166223782897842442211175310 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (11, 3), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 4. -/
theorem ep_Q2_041_partial_04_0380_valid :
    mulPoly ep_Q2_041_coefficient_04_0380
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0381 : Poly :=
[
  term ((3725436337 : Rat) / 151763803) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 381 for generator 4. -/
def ep_Q2_041_partial_04_0381 : Poly :=
[
  term ((3725436337 : Rat) / 151763803) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((3725436337 : Rat) / 151763803) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((-3725436337 : Rat) / 151763803) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((-3725436337 : Rat) / 151763803) [(1, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 4. -/
theorem ep_Q2_041_partial_04_0381_valid :
    mulPoly ep_Q2_041_coefficient_04_0381
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0382 : Poly :=
[
  term ((3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 382 for generator 4. -/
def ep_Q2_041_partial_04_0382 : Poly :=
[
  term ((3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 4), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 4. -/
theorem ep_Q2_041_partial_04_0382_valid :
    mulPoly ep_Q2_041_coefficient_04_0382
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0383 : Poly :=
[
  term ((-4656472159378857922800085760637488400575627539338503993657280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 383 for generator 4. -/
def ep_Q2_041_partial_04_0383 : Poly :=
[
  term ((-4656472159378857922800085760637488400575627539338503993657280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (11, 2), (12, 1), (15, 1)],
  term ((-4656472159378857922800085760637488400575627539338503993657280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (11, 2), (12, 1), (15, 1)],
  term ((4656472159378857922800085760637488400575627539338503993657280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((4656472159378857922800085760637488400575627539338503993657280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 4), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 4. -/
theorem ep_Q2_041_partial_04_0383_valid :
    mulPoly ep_Q2_041_coefficient_04_0383
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0384 : Poly :=
[
  term ((41047105813667659152 : Rat) / 259001945121800951) [(1, 1), (11, 2), (13, 1)]
]

/-- Partial product 384 for generator 4. -/
def ep_Q2_041_partial_04_0384 : Poly :=
[
  term ((41047105813667659152 : Rat) / 259001945121800951) [(1, 1), (4, 2), (11, 2), (13, 1)],
  term ((41047105813667659152 : Rat) / 259001945121800951) [(1, 1), (5, 2), (11, 2), (13, 1)],
  term ((-41047105813667659152 : Rat) / 259001945121800951) [(1, 1), (10, 2), (11, 2), (13, 1)],
  term ((-41047105813667659152 : Rat) / 259001945121800951) [(1, 1), (11, 4), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 4. -/
theorem ep_Q2_041_partial_04_0384_valid :
    mulPoly ep_Q2_041_coefficient_04_0384
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0385 : Poly :=
[
  term ((-4874218288265832605772845961973914996012819071203262481412313760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 2), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 385 for generator 4. -/
def ep_Q2_041_partial_04_0385 : Poly :=
[
  term ((-4874218288265832605772845961973914996012819071203262481412313760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (4, 2), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-4874218288265832605772845961973914996012819071203262481412313760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 2), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((4874218288265832605772845961973914996012819071203262481412313760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 2), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((4874218288265832605772845961973914996012819071203262481412313760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 4), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 4. -/
theorem ep_Q2_041_partial_04_0385_valid :
    mulPoly ep_Q2_041_coefficient_04_0385
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0386 : Poly :=
[
  term ((-11000733133764061254758980729870075068464204095813839375508591450 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (11, 2), (13, 1), (15, 2)]
]

/-- Partial product 386 for generator 4. -/
def ep_Q2_041_partial_04_0386 : Poly :=
[
  term ((-11000733133764061254758980729870075068464204095813839375508591450 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (4, 2), (11, 2), (13, 1), (15, 2)],
  term ((-11000733133764061254758980729870075068464204095813839375508591450 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (5, 2), (11, 2), (13, 1), (15, 2)],
  term ((11000733133764061254758980729870075068464204095813839375508591450 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (10, 2), (11, 2), (13, 1), (15, 2)],
  term ((11000733133764061254758980729870075068464204095813839375508591450 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (11, 4), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 4. -/
theorem ep_Q2_041_partial_04_0386_valid :
    mulPoly ep_Q2_041_coefficient_04_0386
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0387 : Poly :=
[
  term ((2890149120 : Rat) / 151763803) [(1, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 387 for generator 4. -/
def ep_Q2_041_partial_04_0387 : Poly :=
[
  term ((2890149120 : Rat) / 151763803) [(1, 1), (4, 2), (11, 2), (13, 1), (16, 1)],
  term ((2890149120 : Rat) / 151763803) [(1, 1), (5, 2), (11, 2), (13, 1), (16, 1)],
  term ((-2890149120 : Rat) / 151763803) [(1, 1), (10, 2), (11, 2), (13, 1), (16, 1)],
  term ((-2890149120 : Rat) / 151763803) [(1, 1), (11, 4), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 4. -/
theorem ep_Q2_041_partial_04_0387_valid :
    mulPoly ep_Q2_041_coefficient_04_0387
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0388 : Poly :=
[
  term ((11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 388 for generator 4. -/
def ep_Q2_041_partial_04_0388 : Poly :=
[
  term ((11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 4), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 4. -/
theorem ep_Q2_041_partial_04_0388_valid :
    mulPoly ep_Q2_041_coefficient_04_0388
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0389 : Poly :=
[
  term ((-7433248060812262300103558209090772216633606765276878371559600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (13, 2), (15, 1)]
]

/-- Partial product 389 for generator 4. -/
def ep_Q2_041_partial_04_0389 : Poly :=
[
  term ((-7433248060812262300103558209090772216633606765276878371559600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (11, 2), (13, 2), (15, 1)],
  term ((-7433248060812262300103558209090772216633606765276878371559600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (11, 2), (13, 2), (15, 1)],
  term ((7433248060812262300103558209090772216633606765276878371559600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 2), (13, 2), (15, 1)],
  term ((7433248060812262300103558209090772216633606765276878371559600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 4), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 4. -/
theorem ep_Q2_041_partial_04_0389_valid :
    mulPoly ep_Q2_041_coefficient_04_0389
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0390 : Poly :=
[
  term ((-524735260990447134824123138037239024984389119467192750022320653283138675 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 390 for generator 4. -/
def ep_Q2_041_partial_04_0390 : Poly :=
[
  term ((-524735260990447134824123138037239024984389119467192750022320653283138675 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (4, 2), (11, 2), (14, 1), (15, 1)],
  term ((-524735260990447134824123138037239024984389119467192750022320653283138675 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 2), (11, 2), (14, 1), (15, 1)],
  term ((524735260990447134824123138037239024984389119467192750022320653283138675 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 2), (11, 2), (14, 1), (15, 1)],
  term ((524735260990447134824123138037239024984389119467192750022320653283138675 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 4), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 4. -/
theorem ep_Q2_041_partial_04_0390_valid :
    mulPoly ep_Q2_041_coefficient_04_0390
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0391 : Poly :=
[
  term ((-14531338726464 : Rat) / 275754830051) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 391 for generator 4. -/
def ep_Q2_041_partial_04_0391 : Poly :=
[
  term ((-14531338726464 : Rat) / 275754830051) [(1, 1), (4, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-14531338726464 : Rat) / 275754830051) [(1, 1), (5, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((14531338726464 : Rat) / 275754830051) [(1, 1), (10, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((14531338726464 : Rat) / 275754830051) [(1, 1), (11, 4), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 4. -/
theorem ep_Q2_041_partial_04_0391_valid :
    mulPoly ep_Q2_041_coefficient_04_0391
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0392 : Poly :=
[
  term ((-983386969864941428964727354372412579135876314802758883661637600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 2), (14, 1), (15, 3)]
]

/-- Partial product 392 for generator 4. -/
def ep_Q2_041_partial_04_0392 : Poly :=
[
  term ((-983386969864941428964727354372412579135876314802758883661637600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (4, 2), (11, 2), (14, 1), (15, 3)],
  term ((-983386969864941428964727354372412579135876314802758883661637600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 2), (11, 2), (14, 1), (15, 3)],
  term ((983386969864941428964727354372412579135876314802758883661637600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 2), (14, 1), (15, 3)],
  term ((983386969864941428964727354372412579135876314802758883661637600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 4), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 4. -/
theorem ep_Q2_041_partial_04_0392_valid :
    mulPoly ep_Q2_041_coefficient_04_0392
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0393 : Poly :=
[
  term ((-76845788455688701138278307225011237815300925920892679564080 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (11, 2), (14, 2), (15, 1)]
]

/-- Partial product 393 for generator 4. -/
def ep_Q2_041_partial_04_0393 : Poly :=
[
  term ((-76845788455688701138278307225011237815300925920892679564080 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (4, 2), (11, 2), (14, 2), (15, 1)],
  term ((-76845788455688701138278307225011237815300925920892679564080 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (5, 2), (11, 2), (14, 2), (15, 1)],
  term ((76845788455688701138278307225011237815300925920892679564080 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 2), (11, 2), (14, 2), (15, 1)],
  term ((76845788455688701138278307225011237815300925920892679564080 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (11, 4), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 4. -/
theorem ep_Q2_041_partial_04_0393_valid :
    mulPoly ep_Q2_041_coefficient_04_0393
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0394 : Poly :=
[
  term ((727903284048239223216387078508100936479407549314066866115441052312380330 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 394 for generator 4. -/
def ep_Q2_041_partial_04_0394 : Poly :=
[
  term ((727903284048239223216387078508100936479407549314066866115441052312380330 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (4, 2), (11, 2), (15, 1)],
  term ((727903284048239223216387078508100936479407549314066866115441052312380330 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 2), (11, 2), (15, 1)],
  term ((-727903284048239223216387078508100936479407549314066866115441052312380330 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 2), (11, 2), (15, 1)],
  term ((-727903284048239223216387078508100936479407549314066866115441052312380330 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 4. -/
theorem ep_Q2_041_partial_04_0394_valid :
    mulPoly ep_Q2_041_coefficient_04_0394
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0395 : Poly :=
[
  term ((120399671314944 : Rat) / 275754830051) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 395 for generator 4. -/
def ep_Q2_041_partial_04_0395 : Poly :=
[
  term ((120399671314944 : Rat) / 275754830051) [(1, 1), (4, 2), (11, 2), (15, 1), (16, 1)],
  term ((120399671314944 : Rat) / 275754830051) [(1, 1), (5, 2), (11, 2), (15, 1), (16, 1)],
  term ((-120399671314944 : Rat) / 275754830051) [(1, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term ((-120399671314944 : Rat) / 275754830051) [(1, 1), (11, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 4. -/
theorem ep_Q2_041_partial_04_0395_valid :
    mulPoly ep_Q2_041_coefficient_04_0395
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0396 : Poly :=
[
  term ((2137617121341518612363693787680997817831327675103603112249985580 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (11, 2), (15, 3)]
]

/-- Partial product 396 for generator 4. -/
def ep_Q2_041_partial_04_0396 : Poly :=
[
  term ((2137617121341518612363693787680997817831327675103603112249985580 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (4, 2), (11, 2), (15, 3)],
  term ((2137617121341518612363693787680997817831327675103603112249985580 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (5, 2), (11, 2), (15, 3)],
  term ((-2137617121341518612363693787680997817831327675103603112249985580 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (10, 2), (11, 2), (15, 3)],
  term ((-2137617121341518612363693787680997817831327675103603112249985580 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (11, 4), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 4. -/
theorem ep_Q2_041_partial_04_0396_valid :
    mulPoly ep_Q2_041_coefficient_04_0396
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0397 : Poly :=
[
  term ((1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 3), (13, 1), (15, 1)]
]

/-- Partial product 397 for generator 4. -/
def ep_Q2_041_partial_04_0397 : Poly :=
[
  term ((1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (11, 3), (13, 1), (15, 1)],
  term ((1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (11, 3), (13, 1), (15, 1)],
  term ((-1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 3), (13, 1), (15, 1)],
  term ((-1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 5), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 4. -/
theorem ep_Q2_041_partial_04_0397_valid :
    mulPoly ep_Q2_041_coefficient_04_0397
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0398 : Poly :=
[
  term ((260792649270698882781508510251293252238982852323920584909902800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 3), (14, 1), (15, 2)]
]

/-- Partial product 398 for generator 4. -/
def ep_Q2_041_partial_04_0398 : Poly :=
[
  term ((260792649270698882781508510251293252238982852323920584909902800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (4, 2), (11, 3), (14, 1), (15, 2)],
  term ((260792649270698882781508510251293252238982852323920584909902800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 2), (11, 3), (14, 1), (15, 2)],
  term ((-260792649270698882781508510251293252238982852323920584909902800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 3), (14, 1), (15, 2)],
  term ((-260792649270698882781508510251293252238982852323920584909902800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 5), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 4. -/
theorem ep_Q2_041_partial_04_0398_valid :
    mulPoly ep_Q2_041_coefficient_04_0398
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 4. -/
def ep_Q2_041_coefficient_04_0399 : Poly :=
[
  term ((-2160802238844115932009863236618814098166781738678359163371548800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 3), (15, 2)]
]

/-- Partial product 399 for generator 4. -/
def ep_Q2_041_partial_04_0399 : Poly :=
[
  term ((-2160802238844115932009863236618814098166781738678359163371548800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (4, 2), (11, 3), (15, 2)],
  term ((-2160802238844115932009863236618814098166781738678359163371548800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 2), (11, 3), (15, 2)],
  term ((2160802238844115932009863236618814098166781738678359163371548800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 3), (15, 2)],
  term ((2160802238844115932009863236618814098166781738678359163371548800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 5), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 4. -/
theorem ep_Q2_041_partial_04_0399_valid :
    mulPoly ep_Q2_041_coefficient_04_0399
        ep_Q2_041_generator_04_0300_0399 =
      ep_Q2_041_partial_04_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_041_partials_04_0300_0399 : List Poly :=
[
  ep_Q2_041_partial_04_0300,
  ep_Q2_041_partial_04_0301,
  ep_Q2_041_partial_04_0302,
  ep_Q2_041_partial_04_0303,
  ep_Q2_041_partial_04_0304,
  ep_Q2_041_partial_04_0305,
  ep_Q2_041_partial_04_0306,
  ep_Q2_041_partial_04_0307,
  ep_Q2_041_partial_04_0308,
  ep_Q2_041_partial_04_0309,
  ep_Q2_041_partial_04_0310,
  ep_Q2_041_partial_04_0311,
  ep_Q2_041_partial_04_0312,
  ep_Q2_041_partial_04_0313,
  ep_Q2_041_partial_04_0314,
  ep_Q2_041_partial_04_0315,
  ep_Q2_041_partial_04_0316,
  ep_Q2_041_partial_04_0317,
  ep_Q2_041_partial_04_0318,
  ep_Q2_041_partial_04_0319,
  ep_Q2_041_partial_04_0320,
  ep_Q2_041_partial_04_0321,
  ep_Q2_041_partial_04_0322,
  ep_Q2_041_partial_04_0323,
  ep_Q2_041_partial_04_0324,
  ep_Q2_041_partial_04_0325,
  ep_Q2_041_partial_04_0326,
  ep_Q2_041_partial_04_0327,
  ep_Q2_041_partial_04_0328,
  ep_Q2_041_partial_04_0329,
  ep_Q2_041_partial_04_0330,
  ep_Q2_041_partial_04_0331,
  ep_Q2_041_partial_04_0332,
  ep_Q2_041_partial_04_0333,
  ep_Q2_041_partial_04_0334,
  ep_Q2_041_partial_04_0335,
  ep_Q2_041_partial_04_0336,
  ep_Q2_041_partial_04_0337,
  ep_Q2_041_partial_04_0338,
  ep_Q2_041_partial_04_0339,
  ep_Q2_041_partial_04_0340,
  ep_Q2_041_partial_04_0341,
  ep_Q2_041_partial_04_0342,
  ep_Q2_041_partial_04_0343,
  ep_Q2_041_partial_04_0344,
  ep_Q2_041_partial_04_0345,
  ep_Q2_041_partial_04_0346,
  ep_Q2_041_partial_04_0347,
  ep_Q2_041_partial_04_0348,
  ep_Q2_041_partial_04_0349,
  ep_Q2_041_partial_04_0350,
  ep_Q2_041_partial_04_0351,
  ep_Q2_041_partial_04_0352,
  ep_Q2_041_partial_04_0353,
  ep_Q2_041_partial_04_0354,
  ep_Q2_041_partial_04_0355,
  ep_Q2_041_partial_04_0356,
  ep_Q2_041_partial_04_0357,
  ep_Q2_041_partial_04_0358,
  ep_Q2_041_partial_04_0359,
  ep_Q2_041_partial_04_0360,
  ep_Q2_041_partial_04_0361,
  ep_Q2_041_partial_04_0362,
  ep_Q2_041_partial_04_0363,
  ep_Q2_041_partial_04_0364,
  ep_Q2_041_partial_04_0365,
  ep_Q2_041_partial_04_0366,
  ep_Q2_041_partial_04_0367,
  ep_Q2_041_partial_04_0368,
  ep_Q2_041_partial_04_0369,
  ep_Q2_041_partial_04_0370,
  ep_Q2_041_partial_04_0371,
  ep_Q2_041_partial_04_0372,
  ep_Q2_041_partial_04_0373,
  ep_Q2_041_partial_04_0374,
  ep_Q2_041_partial_04_0375,
  ep_Q2_041_partial_04_0376,
  ep_Q2_041_partial_04_0377,
  ep_Q2_041_partial_04_0378,
  ep_Q2_041_partial_04_0379,
  ep_Q2_041_partial_04_0380,
  ep_Q2_041_partial_04_0381,
  ep_Q2_041_partial_04_0382,
  ep_Q2_041_partial_04_0383,
  ep_Q2_041_partial_04_0384,
  ep_Q2_041_partial_04_0385,
  ep_Q2_041_partial_04_0386,
  ep_Q2_041_partial_04_0387,
  ep_Q2_041_partial_04_0388,
  ep_Q2_041_partial_04_0389,
  ep_Q2_041_partial_04_0390,
  ep_Q2_041_partial_04_0391,
  ep_Q2_041_partial_04_0392,
  ep_Q2_041_partial_04_0393,
  ep_Q2_041_partial_04_0394,
  ep_Q2_041_partial_04_0395,
  ep_Q2_041_partial_04_0396,
  ep_Q2_041_partial_04_0397,
  ep_Q2_041_partial_04_0398,
  ep_Q2_041_partial_04_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_041_block_04_0300_0399 : Poly :=
[
  term ((21904222840080 : Rat) / 275754830051) [(1, 1), (4, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6597946783 : Rat) / 151763803) [(1, 1), (4, 2), (9, 1), (14, 1), (16, 1)],
  term ((43706396304392267779 : Rat) / 259001945121800951) [(1, 1), (4, 2), (9, 1), (14, 2)],
  term ((5378758734 : Rat) / 151763803) [(1, 1), (4, 2), (9, 1), (14, 2), (16, 1)],
  term ((-6685445501212977061778584791701882380457530795076490357549750626331594589 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (4, 2), (9, 1), (15, 2)],
  term ((-339757075288560 : Rat) / 275754830051) [(1, 1), (4, 2), (9, 1), (15, 2), (16, 1)],
  term ((-169517057 : Rat) / 151763803) [(1, 1), (4, 2), (9, 1), (16, 1)],
  term ((112774684453615571615 : Rat) / 259001945121800951) [(1, 1), (4, 2), (10, 1), (11, 1)],
  term ((-1348714666807157674522499365140572204676822148784107380354320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((115159554375110428077936196144767190225981875507139606256972350 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (4, 2), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((562502356765632876427929772549309198554784261659455220875920 : Rat) / 9617354187642203712125655254372939285495069578637751278031) [(1, 1), (4, 2), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1190539092493479245018666352960796036393923136171443971864180 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-41672803159245398866 : Rat) / 259001945121800951) [(1, 1), (4, 2), (10, 1), (11, 1), (14, 1)],
  term ((1256428699072951542123181101255045803160250108729888421867782310 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (4, 2), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-2610306556 : Rat) / 151763803) [(1, 1), (4, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1241201616154444033511079542735534111410193461438480559571093180 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (4, 2), (10, 1), (11, 1), (15, 2)],
  term ((7311164962 : Rat) / 151763803) [(1, 1), (4, 2), (10, 1), (11, 1), (16, 1)],
  term ((-56282970980211821728977592215664193877259041822264714737680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (4, 2), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((1934495837280916615561189558626562217655444139341339009418920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (10, 1), (11, 2), (15, 1)],
  term ((-46938125629518110234 : Rat) / 259001945121800951) [(1, 1), (4, 2), (10, 1), (12, 1), (13, 1)],
  term ((36329710873820453704908469759846869196073335854712797705423370 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (4, 2), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-3304939040 : Rat) / 151763803) [(1, 1), (4, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((151762784719717487449061233576276388220322491199247177043960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-14997105462506511390078102866122788255007952787771030870137641064432675 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 1), (4, 2), (10, 1), (12, 1), (15, 1)],
  term ((-6416678142168 : Rat) / 275754830051) [(1, 1), (4, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-51441277022723016070 : Rat) / 259001945121800951) [(1, 1), (4, 2), (10, 1), (13, 1)],
  term ((127512074078569441162 : Rat) / 777005835365402853) [(1, 1), (4, 2), (10, 1), (13, 1), (14, 1)],
  term ((-770217748531315330743962273130785842284298848770937565814376670 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (4, 2), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((8978194720 : Rat) / 455291409) [(1, 1), (4, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1057980748646445416765236355229464385733593370701496517580631400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (4, 2), (10, 1), (13, 1), (15, 2)],
  term ((-3613051784 : Rat) / 151763803) [(1, 1), (4, 2), (10, 1), (13, 1), (16, 1)],
  term ((-137426219361579533169122925411176054650251540613623287174760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((184653907744440733363535911779439640035698348184230091688100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (10, 1), (13, 2), (15, 1)],
  term ((21314131261055703700341448595409505302307144463949090888811642057865423047 : Rat) / 148513784694998746745810557987091002645721919739117703890909801474936536) [(1, 1), (4, 2), (10, 1), (14, 1), (15, 1)],
  term ((-14052215491684 : Rat) / 275754830051) [(1, 1), (4, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2341478788815569651767713800442868806767679099388616797253437742534412447 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (4, 2), (10, 1), (15, 1)],
  term ((30178765557114 : Rat) / 275754830051) [(1, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((207494564124178103772692210021626493027203407505247289285280 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (4, 2), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-2092068966833169898387283093903305101008395043213441178055555200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (4, 2), (10, 2), (11, 1), (15, 2)],
  term ((7221250096848940036 : Rat) / 37000277874542993) [(1, 1), (4, 2), (10, 2), (13, 1)],
  term ((-659990923945154012672189927418830708628257469547127537720595840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (4, 2), (10, 2), (13, 1), (15, 2)],
  term ((3559165120 : Rat) / 151763803) [(1, 1), (4, 2), (10, 2), (13, 1), (16, 1)],
  term ((-23348120726110382684470959011734828956972690953730334929840 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (4, 2), (10, 2), (13, 2), (15, 1)],
  term ((327475631325046536562210390551735563480208834484865961447291673390716580 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (4, 2), (10, 2), (15, 1)],
  term ((116569860696576 : Rat) / 275754830051) [(1, 1), (4, 2), (10, 2), (15, 1), (16, 1)],
  term ((123413653059028303469 : Rat) / 518003890243601902) [(1, 1), (4, 2), (11, 1)],
  term ((-174817807033103331270 : Rat) / 259001945121800951) [(1, 1), (4, 2), (11, 1), (12, 1)],
  term ((-1714911507669309992415780722271992153580920143742614738727600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2390374057795299247778421947827613666745456803793932387313560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5394858667228630698089997460562288818707288595136429521417280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (4, 2), (11, 1), (12, 1), (14, 1)],
  term ((115159554375110428077936196144767190225981875507139606256972350 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (4, 2), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((7974670720 : Rat) / 151763803) [(1, 1), (4, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-380342316945755781724151022432883902785096813213954011559240320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (4, 2), (11, 1), (12, 1), (15, 2)],
  term ((460638217500441712311744784579068760903927502028558425027889400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (4, 2), (11, 1), (12, 1), (15, 4)],
  term ((-12969474324 : Rat) / 151763803) [(1, 1), (4, 2), (11, 1), (12, 1), (16, 1)],
  term ((-1370912442573543607347643763521217650023348345138113212309443565072363723 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (4, 2), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-369458564416 : Rat) / 275754830051) [(1, 1), (4, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10904910875897794234780415077936570541961075748033633533704166120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (4, 2), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((4541216776696691339137425627753541829732324322750769743059680 : Rat) / 67321479313495425984879586780610574998465487050464258946217) [(1, 1), (4, 2), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-274975893126363050450174493383757132572779009070512773321753285746632417 : Rat) / 21216254956428392392258651141013000377960274248445386270129971639276648) [(1, 1), (4, 2), (11, 1), (13, 1), (15, 1)],
  term ((25999106718296 : Rat) / 827264490153) [(1, 1), (4, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((68039146333527016292551767643569792651011975149463429213104543510 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (4, 2), (11, 1), (13, 1), (15, 3)],
  term ((-36296283381530198602 : Rat) / 37000277874542993) [(1, 1), (4, 2), (11, 1), (13, 2)],
  term ((389947505229842761944 : Rat) / 259001945121800951) [(1, 1), (4, 2), (11, 1), (13, 2), (14, 1)],
  term ((10055112496190615523613175469394604525295764331643336754610590960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (4, 2), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((27456416640 : Rat) / 151763803) [(1, 1), (4, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-7241438305045521702289815036568673812837954433596423816177773550 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (4, 2), (11, 1), (13, 2), (15, 2)],
  term ((-17889487840 : Rat) / 151763803) [(1, 1), (4, 2), (11, 1), (13, 2), (16, 1)],
  term ((-1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (11, 1), (13, 3), (14, 1), (15, 1)],
  term ((117355027860186397177209293980035587652152209793749841357880 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (4, 2), (11, 1), (13, 3), (15, 1)],
  term ((45254405443667665464 : Rat) / 259001945121800951) [(1, 1), (4, 2), (11, 1), (14, 1)],
  term ((-1384792544919375154888221279392915540213740217424365079588508040015884095 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (4, 2), (11, 1), (14, 1), (15, 2)],
  term ((54794217545088 : Rat) / 275754830051) [(1, 1), (4, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((11627623144 : Rat) / 151763803) [(1, 1), (4, 2), (11, 1), (14, 1), (16, 1)],
  term ((-93720912000626928786 : Rat) / 259001945121800951) [(1, 1), (4, 2), (11, 1), (14, 2)],
  term ((11830293031032908468473483683865186808553338303749509653780240 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (4, 2), (11, 1), (14, 2), (15, 2)],
  term ((-11253026820 : Rat) / 151763803) [(1, 1), (4, 2), (11, 1), (14, 2), (16, 1)],
  term ((17640182966144765173718845696280224751698269669172057458510528350078924789 : Rat) / 10608127478214196196129325570506500188980137124222693135064985819638324) [(1, 1), (4, 2), (11, 1), (15, 2)],
  term ((-44179831922824 : Rat) / 275754830051) [(1, 1), (4, 2), (11, 1), (15, 2), (16, 1)],
  term ((-1849941939163898863591590401570112405166223782897842442211175310 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (4, 2), (11, 1), (15, 4)],
  term ((3725436337 : Rat) / 151763803) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-4656472159378857922800085760637488400575627539338503993657280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (11, 2), (12, 1), (15, 1)],
  term ((41047105813667659152 : Rat) / 259001945121800951) [(1, 1), (4, 2), (11, 2), (13, 1)],
  term ((-4874218288265832605772845961973914996012819071203262481412313760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (4, 2), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-11000733133764061254758980729870075068464204095813839375508591450 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (4, 2), (11, 2), (13, 1), (15, 2)],
  term ((2890149120 : Rat) / 151763803) [(1, 1), (4, 2), (11, 2), (13, 1), (16, 1)],
  term ((11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-7433248060812262300103558209090772216633606765276878371559600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (11, 2), (13, 2), (15, 1)],
  term ((-524735260990447134824123138037239024984389119467192750022320653283138675 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (4, 2), (11, 2), (14, 1), (15, 1)],
  term ((-14531338726464 : Rat) / 275754830051) [(1, 1), (4, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-983386969864941428964727354372412579135876314802758883661637600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (4, 2), (11, 2), (14, 1), (15, 3)],
  term ((-76845788455688701138278307225011237815300925920892679564080 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (4, 2), (11, 2), (14, 2), (15, 1)],
  term ((727903284048239223216387078508100936479407549314066866115441052312380330 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (4, 2), (11, 2), (15, 1)],
  term ((120399671314944 : Rat) / 275754830051) [(1, 1), (4, 2), (11, 2), (15, 1), (16, 1)],
  term ((2137617121341518612363693787680997817831327675103603112249985580 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (4, 2), (11, 2), (15, 3)],
  term ((1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (4, 2), (11, 3), (13, 1), (15, 1)],
  term ((260792649270698882781508510251293252238982852323920584909902800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (4, 2), (11, 3), (14, 1), (15, 2)],
  term ((-2160802238844115932009863236618814098166781738678359163371548800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (4, 2), (11, 3), (15, 2)],
  term ((21904222840080 : Rat) / 275754830051) [(1, 1), (5, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6597946783 : Rat) / 151763803) [(1, 1), (5, 2), (9, 1), (14, 1), (16, 1)],
  term ((43706396304392267779 : Rat) / 259001945121800951) [(1, 1), (5, 2), (9, 1), (14, 2)],
  term ((5378758734 : Rat) / 151763803) [(1, 1), (5, 2), (9, 1), (14, 2), (16, 1)],
  term ((-6685445501212977061778584791701882380457530795076490357549750626331594589 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (5, 2), (9, 1), (15, 2)],
  term ((-339757075288560 : Rat) / 275754830051) [(1, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((-169517057 : Rat) / 151763803) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((112774684453615571615 : Rat) / 259001945121800951) [(1, 1), (5, 2), (10, 1), (11, 1)],
  term ((-1348714666807157674522499365140572204676822148784107380354320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((115159554375110428077936196144767190225981875507139606256972350 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 2), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((562502356765632876427929772549309198554784261659455220875920 : Rat) / 9617354187642203712125655254372939285495069578637751278031) [(1, 1), (5, 2), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1190539092493479245018666352960796036393923136171443971864180 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-41672803159245398866 : Rat) / 259001945121800951) [(1, 1), (5, 2), (10, 1), (11, 1), (14, 1)],
  term ((1256428699072951542123181101255045803160250108729888421867782310 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (5, 2), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-2610306556 : Rat) / 151763803) [(1, 1), (5, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1241201616154444033511079542735534111410193461438480559571093180 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 2), (10, 1), (11, 1), (15, 2)],
  term ((7311164962 : Rat) / 151763803) [(1, 1), (5, 2), (10, 1), (11, 1), (16, 1)],
  term ((-56282970980211821728977592215664193877259041822264714737680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (5, 2), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((1934495837280916615561189558626562217655444139341339009418920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (10, 1), (11, 2), (15, 1)],
  term ((-46938125629518110234 : Rat) / 259001945121800951) [(1, 1), (5, 2), (10, 1), (12, 1), (13, 1)],
  term ((36329710873820453704908469759846869196073335854712797705423370 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 2), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-3304939040 : Rat) / 151763803) [(1, 1), (5, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((151762784719717487449061233576276388220322491199247177043960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-14997105462506511390078102866122788255007952787771030870137641064432675 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 1), (5, 2), (10, 1), (12, 1), (15, 1)],
  term ((-6416678142168 : Rat) / 275754830051) [(1, 1), (5, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-51441277022723016070 : Rat) / 259001945121800951) [(1, 1), (5, 2), (10, 1), (13, 1)],
  term ((127512074078569441162 : Rat) / 777005835365402853) [(1, 1), (5, 2), (10, 1), (13, 1), (14, 1)],
  term ((-770217748531315330743962273130785842284298848770937565814376670 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (5, 2), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((8978194720 : Rat) / 455291409) [(1, 1), (5, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1057980748646445416765236355229464385733593370701496517580631400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 2), (10, 1), (13, 1), (15, 2)],
  term ((-3613051784 : Rat) / 151763803) [(1, 1), (5, 2), (10, 1), (13, 1), (16, 1)],
  term ((-137426219361579533169122925411176054650251540613623287174760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((184653907744440733363535911779439640035698348184230091688100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (10, 1), (13, 2), (15, 1)],
  term ((21314131261055703700341448595409505302307144463949090888811642057865423047 : Rat) / 148513784694998746745810557987091002645721919739117703890909801474936536) [(1, 1), (5, 2), (10, 1), (14, 1), (15, 1)],
  term ((-14052215491684 : Rat) / 275754830051) [(1, 1), (5, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2341478788815569651767713800442868806767679099388616797253437742534412447 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (5, 2), (10, 1), (15, 1)],
  term ((30178765557114 : Rat) / 275754830051) [(1, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((207494564124178103772692210021626493027203407505247289285280 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (5, 2), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-2092068966833169898387283093903305101008395043213441178055555200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 2), (10, 2), (11, 1), (15, 2)],
  term ((7221250096848940036 : Rat) / 37000277874542993) [(1, 1), (5, 2), (10, 2), (13, 1)],
  term ((-659990923945154012672189927418830708628257469547127537720595840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 2), (10, 2), (13, 1), (15, 2)],
  term ((3559165120 : Rat) / 151763803) [(1, 1), (5, 2), (10, 2), (13, 1), (16, 1)],
  term ((-23348120726110382684470959011734828956972690953730334929840 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (5, 2), (10, 2), (13, 2), (15, 1)],
  term ((327475631325046536562210390551735563480208834484865961447291673390716580 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 2), (10, 2), (15, 1)],
  term ((116569860696576 : Rat) / 275754830051) [(1, 1), (5, 2), (10, 2), (15, 1), (16, 1)],
  term ((123413653059028303469 : Rat) / 518003890243601902) [(1, 1), (5, 2), (11, 1)],
  term ((-174817807033103331270 : Rat) / 259001945121800951) [(1, 1), (5, 2), (11, 1), (12, 1)],
  term ((-1714911507669309992415780722271992153580920143742614738727600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2390374057795299247778421947827613666745456803793932387313560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5394858667228630698089997460562288818707288595136429521417280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (5, 2), (11, 1), (12, 1), (14, 1)],
  term ((115159554375110428077936196144767190225981875507139606256972350 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 2), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((7974670720 : Rat) / 151763803) [(1, 1), (5, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-380342316945755781724151022432883902785096813213954011559240320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 2), (11, 1), (12, 1), (15, 2)],
  term ((460638217500441712311744784579068760903927502028558425027889400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 2), (11, 1), (12, 1), (15, 4)],
  term ((-12969474324 : Rat) / 151763803) [(1, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((-1370912442573543607347643763521217650023348345138113212309443565072363723 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 2), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-369458564416 : Rat) / 275754830051) [(1, 1), (5, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10904910875897794234780415077936570541961075748033633533704166120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 2), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((4541216776696691339137425627753541829732324322750769743059680 : Rat) / 67321479313495425984879586780610574998465487050464258946217) [(1, 1), (5, 2), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-274975893126363050450174493383757132572779009070512773321753285746632417 : Rat) / 21216254956428392392258651141013000377960274248445386270129971639276648) [(1, 1), (5, 2), (11, 1), (13, 1), (15, 1)],
  term ((25999106718296 : Rat) / 827264490153) [(1, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((68039146333527016292551767643569792651011975149463429213104543510 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (5, 2), (11, 1), (13, 1), (15, 3)],
  term ((-36296283381530198602 : Rat) / 37000277874542993) [(1, 1), (5, 2), (11, 1), (13, 2)],
  term ((389947505229842761944 : Rat) / 259001945121800951) [(1, 1), (5, 2), (11, 1), (13, 2), (14, 1)],
  term ((10055112496190615523613175469394604525295764331643336754610590960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 2), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((27456416640 : Rat) / 151763803) [(1, 1), (5, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-7241438305045521702289815036568673812837954433596423816177773550 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 2), (11, 1), (13, 2), (15, 2)],
  term ((-17889487840 : Rat) / 151763803) [(1, 1), (5, 2), (11, 1), (13, 2), (16, 1)],
  term ((-1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (11, 1), (13, 3), (14, 1), (15, 1)],
  term ((117355027860186397177209293980035587652152209793749841357880 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (5, 2), (11, 1), (13, 3), (15, 1)],
  term ((45254405443667665464 : Rat) / 259001945121800951) [(1, 1), (5, 2), (11, 1), (14, 1)],
  term ((-1384792544919375154888221279392915540213740217424365079588508040015884095 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (5, 2), (11, 1), (14, 1), (15, 2)],
  term ((54794217545088 : Rat) / 275754830051) [(1, 1), (5, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((11627623144 : Rat) / 151763803) [(1, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-93720912000626928786 : Rat) / 259001945121800951) [(1, 1), (5, 2), (11, 1), (14, 2)],
  term ((11830293031032908468473483683865186808553338303749509653780240 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (5, 2), (11, 1), (14, 2), (15, 2)],
  term ((-11253026820 : Rat) / 151763803) [(1, 1), (5, 2), (11, 1), (14, 2), (16, 1)],
  term ((17640182966144765173718845696280224751698269669172057458510528350078924789 : Rat) / 10608127478214196196129325570506500188980137124222693135064985819638324) [(1, 1), (5, 2), (11, 1), (15, 2)],
  term ((-44179831922824 : Rat) / 275754830051) [(1, 1), (5, 2), (11, 1), (15, 2), (16, 1)],
  term ((-1849941939163898863591590401570112405166223782897842442211175310 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (5, 2), (11, 1), (15, 4)],
  term ((3725436337 : Rat) / 151763803) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-4656472159378857922800085760637488400575627539338503993657280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (11, 2), (12, 1), (15, 1)],
  term ((41047105813667659152 : Rat) / 259001945121800951) [(1, 1), (5, 2), (11, 2), (13, 1)],
  term ((-4874218288265832605772845961973914996012819071203262481412313760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 2), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-11000733133764061254758980729870075068464204095813839375508591450 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (5, 2), (11, 2), (13, 1), (15, 2)],
  term ((2890149120 : Rat) / 151763803) [(1, 1), (5, 2), (11, 2), (13, 1), (16, 1)],
  term ((11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-7433248060812262300103558209090772216633606765276878371559600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (11, 2), (13, 2), (15, 1)],
  term ((-524735260990447134824123138037239024984389119467192750022320653283138675 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 2), (11, 2), (14, 1), (15, 1)],
  term ((-14531338726464 : Rat) / 275754830051) [(1, 1), (5, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-983386969864941428964727354372412579135876314802758883661637600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 2), (11, 2), (14, 1), (15, 3)],
  term ((-76845788455688701138278307225011237815300925920892679564080 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (5, 2), (11, 2), (14, 2), (15, 1)],
  term ((727903284048239223216387078508100936479407549314066866115441052312380330 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 2), (11, 2), (15, 1)],
  term ((120399671314944 : Rat) / 275754830051) [(1, 1), (5, 2), (11, 2), (15, 1), (16, 1)],
  term ((2137617121341518612363693787680997817831327675103603112249985580 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (5, 2), (11, 2), (15, 3)],
  term ((1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 2), (11, 3), (13, 1), (15, 1)],
  term ((260792649270698882781508510251293252238982852323920584909902800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 2), (11, 3), (14, 1), (15, 2)],
  term ((-2160802238844115932009863236618814098166781738678359163371548800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 2), (11, 3), (15, 2)],
  term ((-21904222840080 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((6597946783 : Rat) / 151763803) [(1, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-43706396304392267779 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 2), (14, 2)],
  term ((-5378758734 : Rat) / 151763803) [(1, 1), (9, 1), (10, 2), (14, 2), (16, 1)],
  term ((6685445501212977061778584791701882380457530795076490357549750626331594589 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (9, 1), (10, 2), (15, 2)],
  term ((339757075288560 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((169517057 : Rat) / 151763803) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((-21904222840080 : Rat) / 275754830051) [(1, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((6597946783 : Rat) / 151763803) [(1, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-43706396304392267779 : Rat) / 259001945121800951) [(1, 1), (9, 1), (11, 2), (14, 2)],
  term ((-5378758734 : Rat) / 151763803) [(1, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((6685445501212977061778584791701882380457530795076490357549750626331594589 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (9, 1), (11, 2), (15, 2)],
  term ((339757075288560 : Rat) / 275754830051) [(1, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((169517057 : Rat) / 151763803) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((46938125629518110234 : Rat) / 259001945121800951) [(1, 1), (10, 1), (11, 2), (12, 1), (13, 1)],
  term ((-36329710873820453704908469759846869196073335854712797705423370 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((3304939040 : Rat) / 151763803) [(1, 1), (10, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-151762784719717487449061233576276388220322491199247177043960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((14997105462506511390078102866122788255007952787771030870137641064432675 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((6416678142168 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((51441277022723016070 : Rat) / 259001945121800951) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((-127512074078569441162 : Rat) / 777005835365402853) [(1, 1), (10, 1), (11, 2), (13, 1), (14, 1)],
  term ((770217748531315330743962273130785842284298848770937565814376670 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-8978194720 : Rat) / 455291409) [(1, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1057980748646445416765236355229464385733593370701496517580631400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((3613051784 : Rat) / 151763803) [(1, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((137426219361579533169122925411176054650251540613623287174760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-184653907744440733363535911779439640035698348184230091688100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 2), (13, 2), (15, 1)],
  term ((-21314131261055703700341448595409505302307144463949090888811642057865423047 : Rat) / 148513784694998746745810557987091002645721919739117703890909801474936536) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((14052215491684 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((2341478788815569651767713800442868806767679099388616797253437742534412447 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-30178765557114 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-112774684453615571615 : Rat) / 259001945121800951) [(1, 1), (10, 1), (11, 3)],
  term ((1348714666807157674522499365140572204676822148784107380354320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 3), (12, 1), (13, 1), (15, 1)],
  term ((-115159554375110428077936196144767190225981875507139606256972350 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 3), (12, 1), (15, 2)],
  term ((-562502356765632876427929772549309198554784261659455220875920 : Rat) / 9617354187642203712125655254372939285495069578637751278031) [(1, 1), (10, 1), (11, 3), (13, 1), (14, 1), (15, 1)],
  term ((1190539092493479245018666352960796036393923136171443971864180 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 3), (13, 1), (15, 1)],
  term ((41672803159245398866 : Rat) / 259001945121800951) [(1, 1), (10, 1), (11, 3), (14, 1)],
  term ((-1256428699072951542123181101255045803160250108729888421867782310 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (10, 1), (11, 3), (14, 1), (15, 2)],
  term ((2610306556 : Rat) / 151763803) [(1, 1), (10, 1), (11, 3), (14, 1), (16, 1)],
  term ((1241201616154444033511079542735534111410193461438480559571093180 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 3), (15, 2)],
  term ((-7311164962 : Rat) / 151763803) [(1, 1), (10, 1), (11, 3), (16, 1)],
  term ((56282970980211821728977592215664193877259041822264714737680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 1), (11, 4), (14, 1), (15, 1)],
  term ((-1934495837280916615561189558626562217655444139341339009418920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 4), (15, 1)],
  term ((-123413653059028303469 : Rat) / 518003890243601902) [(1, 1), (10, 2), (11, 1)],
  term ((174817807033103331270 : Rat) / 259001945121800951) [(1, 1), (10, 2), (11, 1), (12, 1)],
  term ((1714911507669309992415780722271992153580920143742614738727600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2390374057795299247778421947827613666745456803793932387313560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((5394858667228630698089997460562288818707288595136429521417280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((-115159554375110428077936196144767190225981875507139606256972350 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-7974670720 : Rat) / 151763803) [(1, 1), (10, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((380342316945755781724151022432883902785096813213954011559240320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 1), (12, 1), (15, 2)],
  term ((-460638217500441712311744784579068760903927502028558425027889400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 1), (12, 1), (15, 4)],
  term ((12969474324 : Rat) / 151763803) [(1, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((1370912442573543607347643763521217650023348345138113212309443565072363723 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((369458564416 : Rat) / 275754830051) [(1, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10904910875897794234780415077936570541961075748033633533704166120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((-4541216776696691339137425627753541829732324322750769743059680 : Rat) / 67321479313495425984879586780610574998465487050464258946217) [(1, 1), (10, 2), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((274975893126363050450174493383757132572779009070512773321753285746632417 : Rat) / 21216254956428392392258651141013000377960274248445386270129971639276648) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-25999106718296 : Rat) / 827264490153) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-68039146333527016292551767643569792651011975149463429213104543510 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 3)],
  term ((36296283381530198602 : Rat) / 37000277874542993) [(1, 1), (10, 2), (11, 1), (13, 2)],
  term ((-389947505229842761944 : Rat) / 259001945121800951) [(1, 1), (10, 2), (11, 1), (13, 2), (14, 1)],
  term ((-10055112496190615523613175469394604525295764331643336754610590960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 2), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((-27456416640 : Rat) / 151763803) [(1, 1), (10, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((7241438305045521702289815036568673812837954433596423816177773550 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 2), (11, 1), (13, 2), (15, 2)],
  term ((17889487840 : Rat) / 151763803) [(1, 1), (10, 2), (11, 1), (13, 2), (16, 1)],
  term ((1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 1), (13, 3), (14, 1), (15, 1)],
  term ((-117355027860186397177209293980035587652152209793749841357880 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 2), (11, 1), (13, 3), (15, 1)],
  term ((-45254405443667665464 : Rat) / 259001945121800951) [(1, 1), (10, 2), (11, 1), (14, 1)],
  term ((1384792544919375154888221279392915540213740217424365079588508040015884095 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (10, 2), (11, 1), (14, 1), (15, 2)],
  term ((-54794217545088 : Rat) / 275754830051) [(1, 1), (10, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11627623144 : Rat) / 151763803) [(1, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((93720912000626928786 : Rat) / 259001945121800951) [(1, 1), (10, 2), (11, 1), (14, 2)],
  term ((-11830293031032908468473483683865186808553338303749509653780240 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (10, 2), (11, 1), (14, 2), (15, 2)],
  term ((11253026820 : Rat) / 151763803) [(1, 1), (10, 2), (11, 1), (14, 2), (16, 1)],
  term ((-17640182966144765173718845696280224751698269669172057458510528350078924789 : Rat) / 10608127478214196196129325570506500188980137124222693135064985819638324) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((44179831922824 : Rat) / 275754830051) [(1, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((1849941939163898863591590401570112405166223782897842442211175310 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (10, 2), (11, 1), (15, 4)],
  term ((-3725436337 : Rat) / 151763803) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((-3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((4656472159378857922800085760637488400575627539338503993657280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((-91595856491610239404 : Rat) / 259001945121800951) [(1, 1), (10, 2), (11, 2), (13, 1)],
  term ((4874218288265832605772845961973914996012819071203262481412313760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 2), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((12980705905599523292775550512126567194348976504455221988670378970 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (10, 2), (11, 2), (13, 1), (15, 2)],
  term ((-6449314240 : Rat) / 151763803) [(1, 1), (10, 2), (11, 2), (13, 1), (16, 1)],
  term ((-11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((7596684905895034978894854922172916019332415601952990716068480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 2), (13, 2), (15, 1)],
  term ((524735260990447134824123138037239024984389119467192750022320653283138675 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 2), (11, 2), (14, 1), (15, 1)],
  term ((14531338726464 : Rat) / 275754830051) [(1, 1), (10, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((983386969864941428964727354372412579135876314802758883661637600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 2), (14, 1), (15, 3)],
  term ((76845788455688701138278307225011237815300925920892679564080 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 2), (11, 2), (14, 2), (15, 1)],
  term ((-1055378915373285759778597469059836499959616383798932827562732725703096910 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 2), (11, 2), (15, 1)],
  term ((-236969532011520 : Rat) / 275754830051) [(1, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term ((-2137617121341518612363693787680997817831327675103603112249985580 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (10, 2), (11, 2), (15, 3)],
  term ((-2631904734417206474169411716590104464187159010987610353565920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 3), (13, 1), (15, 1)],
  term ((-260792649270698882781508510251293252238982852323920584909902800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 3), (14, 1), (15, 2)],
  term ((4252871205677285830397146330522119199175176781891800341427104000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 2), (11, 3), (15, 2)],
  term ((-112774684453615571615 : Rat) / 259001945121800951) [(1, 1), (10, 3), (11, 1)],
  term ((1348714666807157674522499365140572204676822148784107380354320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 3), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-115159554375110428077936196144767190225981875507139606256972350 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 3), (11, 1), (12, 1), (15, 2)],
  term ((-562502356765632876427929772549309198554784261659455220875920 : Rat) / 9617354187642203712125655254372939285495069578637751278031) [(1, 1), (10, 3), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1190539092493479245018666352960796036393923136171443971864180 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 3), (11, 1), (13, 1), (15, 1)],
  term ((41672803159245398866 : Rat) / 259001945121800951) [(1, 1), (10, 3), (11, 1), (14, 1)],
  term ((-1256428699072951542123181101255045803160250108729888421867782310 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (10, 3), (11, 1), (14, 1), (15, 2)],
  term ((2610306556 : Rat) / 151763803) [(1, 1), (10, 3), (11, 1), (14, 1), (16, 1)],
  term ((1241201616154444033511079542735534111410193461438480559571093180 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 3), (11, 1), (15, 2)],
  term ((-7311164962 : Rat) / 151763803) [(1, 1), (10, 3), (11, 1), (16, 1)],
  term ((56282970980211821728977592215664193877259041822264714737680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 3), (11, 2), (14, 1), (15, 1)],
  term ((-1934495837280916615561189558626562217655444139341339009418920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 3), (11, 2), (15, 1)],
  term ((46938125629518110234 : Rat) / 259001945121800951) [(1, 1), (10, 3), (12, 1), (13, 1)],
  term ((-36329710873820453704908469759846869196073335854712797705423370 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 3), (12, 1), (13, 1), (15, 2)],
  term ((3304939040 : Rat) / 151763803) [(1, 1), (10, 3), (12, 1), (13, 1), (16, 1)],
  term ((-151762784719717487449061233576276388220322491199247177043960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 3), (12, 1), (13, 2), (15, 1)],
  term ((14997105462506511390078102866122788255007952787771030870137641064432675 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 1), (10, 3), (12, 1), (15, 1)],
  term ((6416678142168 : Rat) / 275754830051) [(1, 1), (10, 3), (12, 1), (15, 1), (16, 1)],
  term ((51441277022723016070 : Rat) / 259001945121800951) [(1, 1), (10, 3), (13, 1)],
  term ((-127512074078569441162 : Rat) / 777005835365402853) [(1, 1), (10, 3), (13, 1), (14, 1)],
  term ((770217748531315330743962273130785842284298848770937565814376670 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (10, 3), (13, 1), (14, 1), (15, 2)],
  term ((-8978194720 : Rat) / 455291409) [(1, 1), (10, 3), (13, 1), (14, 1), (16, 1)],
  term ((-1057980748646445416765236355229464385733593370701496517580631400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 3), (13, 1), (15, 2)],
  term ((3613051784 : Rat) / 151763803) [(1, 1), (10, 3), (13, 1), (16, 1)],
  term ((137426219361579533169122925411176054650251540613623287174760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 3), (13, 2), (14, 1), (15, 1)],
  term ((-184653907744440733363535911779439640035698348184230091688100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 3), (13, 2), (15, 1)],
  term ((-21314131261055703700341448595409505302307144463949090888811642057865423047 : Rat) / 148513784694998746745810557987091002645721919739117703890909801474936536) [(1, 1), (10, 3), (14, 1), (15, 1)],
  term ((14052215491684 : Rat) / 275754830051) [(1, 1), (10, 3), (14, 1), (15, 1), (16, 1)],
  term ((2341478788815569651767713800442868806767679099388616797253437742534412447 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (10, 3), (15, 1)],
  term ((-30178765557114 : Rat) / 275754830051) [(1, 1), (10, 3), (15, 1), (16, 1)],
  term ((-207494564124178103772692210021626493027203407505247289285280 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 4), (11, 1), (13, 1), (15, 1)],
  term ((2092068966833169898387283093903305101008395043213441178055555200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 4), (11, 1), (15, 2)],
  term ((-7221250096848940036 : Rat) / 37000277874542993) [(1, 1), (10, 4), (13, 1)],
  term ((659990923945154012672189927418830708628257469547127537720595840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 4), (13, 1), (15, 2)],
  term ((-3559165120 : Rat) / 151763803) [(1, 1), (10, 4), (13, 1), (16, 1)],
  term ((23348120726110382684470959011734828956972690953730334929840 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 4), (13, 2), (15, 1)],
  term ((-327475631325046536562210390551735563480208834484865961447291673390716580 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 4), (15, 1)],
  term ((-116569860696576 : Rat) / 275754830051) [(1, 1), (10, 4), (15, 1), (16, 1)],
  term ((-123413653059028303469 : Rat) / 518003890243601902) [(1, 1), (11, 3)],
  term ((174817807033103331270 : Rat) / 259001945121800951) [(1, 1), (11, 3), (12, 1)],
  term ((1714911507669309992415780722271992153580920143742614738727600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 3), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2390374057795299247778421947827613666745456803793932387313560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 3), (12, 1), (13, 1), (15, 1)],
  term ((5394858667228630698089997460562288818707288595136429521417280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 3), (12, 1), (13, 1), (15, 3)],
  term ((-113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (11, 3), (12, 1), (14, 1)],
  term ((-115159554375110428077936196144767190225981875507139606256972350 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 3), (12, 1), (14, 1), (15, 2)],
  term ((-7974670720 : Rat) / 151763803) [(1, 1), (11, 3), (12, 1), (14, 1), (16, 1)],
  term ((380342316945755781724151022432883902785096813213954011559240320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 3), (12, 1), (15, 2)],
  term ((-460638217500441712311744784579068760903927502028558425027889400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 3), (12, 1), (15, 4)],
  term ((12969474324 : Rat) / 151763803) [(1, 1), (11, 3), (12, 1), (16, 1)],
  term ((1370912442573543607347643763521217650023348345138113212309443565072363723 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 3), (13, 1), (14, 1), (15, 1)],
  term ((369458564416 : Rat) / 275754830051) [(1, 1), (11, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10904910875897794234780415077936570541961075748033633533704166120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 3), (13, 1), (14, 1), (15, 3)],
  term ((-4541216776696691339137425627753541829732324322750769743059680 : Rat) / 67321479313495425984879586780610574998465487050464258946217) [(1, 1), (11, 3), (13, 1), (14, 2), (15, 1)],
  term ((274975893126363050450174493383757132572779009070512773321753285746632417 : Rat) / 21216254956428392392258651141013000377960274248445386270129971639276648) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((-25999106718296 : Rat) / 827264490153) [(1, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-68039146333527016292551767643569792651011975149463429213104543510 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (11, 3), (13, 1), (15, 3)],
  term ((36296283381530198602 : Rat) / 37000277874542993) [(1, 1), (11, 3), (13, 2)],
  term ((-389947505229842761944 : Rat) / 259001945121800951) [(1, 1), (11, 3), (13, 2), (14, 1)],
  term ((-10055112496190615523613175469394604525295764331643336754610590960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 3), (13, 2), (14, 1), (15, 2)],
  term ((-27456416640 : Rat) / 151763803) [(1, 1), (11, 3), (13, 2), (14, 1), (16, 1)],
  term ((7241438305045521702289815036568673812837954433596423816177773550 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 3), (13, 2), (15, 2)],
  term ((17889487840 : Rat) / 151763803) [(1, 1), (11, 3), (13, 2), (16, 1)],
  term ((1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 3), (13, 3), (14, 1), (15, 1)],
  term ((-117355027860186397177209293980035587652152209793749841357880 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (11, 3), (13, 3), (15, 1)],
  term ((-45254405443667665464 : Rat) / 259001945121800951) [(1, 1), (11, 3), (14, 1)],
  term ((1384792544919375154888221279392915540213740217424365079588508040015884095 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (11, 3), (14, 1), (15, 2)],
  term ((-54794217545088 : Rat) / 275754830051) [(1, 1), (11, 3), (14, 1), (15, 2), (16, 1)],
  term ((-11627623144 : Rat) / 151763803) [(1, 1), (11, 3), (14, 1), (16, 1)],
  term ((93720912000626928786 : Rat) / 259001945121800951) [(1, 1), (11, 3), (14, 2)],
  term ((-11830293031032908468473483683865186808553338303749509653780240 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (11, 3), (14, 2), (15, 2)],
  term ((11253026820 : Rat) / 151763803) [(1, 1), (11, 3), (14, 2), (16, 1)],
  term ((-17640182966144765173718845696280224751698269669172057458510528350078924789 : Rat) / 10608127478214196196129325570506500188980137124222693135064985819638324) [(1, 1), (11, 3), (15, 2)],
  term ((44179831922824 : Rat) / 275754830051) [(1, 1), (11, 3), (15, 2), (16, 1)],
  term ((1849941939163898863591590401570112405166223782897842442211175310 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (11, 3), (15, 4)],
  term ((-3725436337 : Rat) / 151763803) [(1, 1), (11, 3), (16, 1)],
  term ((-3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 4), (12, 1), (14, 1), (15, 1)],
  term ((4656472159378857922800085760637488400575627539338503993657280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 4), (12, 1), (15, 1)],
  term ((-41047105813667659152 : Rat) / 259001945121800951) [(1, 1), (11, 4), (13, 1)],
  term ((4874218288265832605772845961973914996012819071203262481412313760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 4), (13, 1), (14, 1), (15, 2)],
  term ((11000733133764061254758980729870075068464204095813839375508591450 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (11, 4), (13, 1), (15, 2)],
  term ((-2890149120 : Rat) / 151763803) [(1, 1), (11, 4), (13, 1), (16, 1)],
  term ((-11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 4), (13, 2), (14, 1), (15, 1)],
  term ((7433248060812262300103558209090772216633606765276878371559600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 4), (13, 2), (15, 1)],
  term ((524735260990447134824123138037239024984389119467192750022320653283138675 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 4), (14, 1), (15, 1)],
  term ((14531338726464 : Rat) / 275754830051) [(1, 1), (11, 4), (14, 1), (15, 1), (16, 1)],
  term ((983386969864941428964727354372412579135876314802758883661637600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 4), (14, 1), (15, 3)],
  term ((76845788455688701138278307225011237815300925920892679564080 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (11, 4), (14, 2), (15, 1)],
  term ((-727903284048239223216387078508100936479407549314066866115441052312380330 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 4), (15, 1)],
  term ((-120399671314944 : Rat) / 275754830051) [(1, 1), (11, 4), (15, 1), (16, 1)],
  term ((-2137617121341518612363693787680997817831327675103603112249985580 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (11, 4), (15, 3)],
  term ((-1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 5), (13, 1), (15, 1)],
  term ((-260792649270698882781508510251293252238982852323920584909902800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 5), (14, 1), (15, 2)],
  term ((2160802238844115932009863236618814098166781738678359163371548800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 5), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 300 through 399. -/
theorem ep_Q2_041_block_04_0300_0399_valid :
    checkProductSumEq ep_Q2_041_partials_04_0300_0399
      ep_Q2_041_block_04_0300_0399 = true := by
  native_decide

end EpQ2041TermShards

end Patterns

end EndpointCertificate

end Problem97
