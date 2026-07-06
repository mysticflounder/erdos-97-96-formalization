/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 21:700-799

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_21_0700_0799 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 700 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0700 : Poly :=
[
  term ((-854765176539728 : Rat) / 1162780221153193) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 700 for generator 21. -/
def ep_Q2_024_partial_21_0700 : Poly :=
[
  term ((854765176539728 : Rat) / 1162780221153193) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1709530353079456 : Rat) / 1162780221153193) [(1, 2), (5, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 21. -/
theorem ep_Q2_024_partial_21_0700_valid :
    mulPoly ep_Q2_024_coefficient_21_0700
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0701 : Poly :=
[
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (5, 1), (13, 1)]
]

/-- Partial product 701 for generator 21. -/
def ep_Q2_024_partial_21_0701 : Poly :=
[
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (5, 1), (10, 1), (13, 1)],
  term ((-4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 21. -/
theorem ep_Q2_024_partial_21_0701_valid :
    mulPoly ep_Q2_024_coefficient_21_0701
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0701 := by
  native_decide

/-- Coefficient term 702 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0702 : Poly :=
[
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (15, 1)]
]

/-- Partial product 702 for generator 21. -/
def ep_Q2_024_partial_21_0702 : Poly :=
[
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 702 for generator 21. -/
theorem ep_Q2_024_partial_21_0702_valid :
    mulPoly ep_Q2_024_coefficient_21_0702
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0702 := by
  native_decide

/-- Coefficient term 703 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0703 : Poly :=
[
  term ((-427382588269864 : Rat) / 1162780221153193) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 703 for generator 21. -/
def ep_Q2_024_partial_21_0703 : Poly :=
[
  term ((-854765176539728 : Rat) / 1162780221153193) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((427382588269864 : Rat) / 1162780221153193) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 703 for generator 21. -/
theorem ep_Q2_024_partial_21_0703_valid :
    mulPoly ep_Q2_024_coefficient_21_0703
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0703 := by
  native_decide

/-- Coefficient term 704 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0704 : Poly :=
[
  term ((6152558431199985774021492508158074690183 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (8, 1)]
]

/-- Partial product 704 for generator 21. -/
def ep_Q2_024_partial_21_0704 : Poly :=
[
  term ((-6152558431199985774021492508158074690183 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (8, 1)],
  term ((12305116862399971548042985016316149380366 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 704 for generator 21. -/
theorem ep_Q2_024_partial_21_0704_valid :
    mulPoly ep_Q2_024_coefficient_21_0704
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0704 := by
  native_decide

/-- Coefficient term 705 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0705 : Poly :=
[
  term ((-550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (9, 1), (13, 1)]
]

/-- Partial product 705 for generator 21. -/
def ep_Q2_024_partial_21_0705 : Poly :=
[
  term ((-1100697137389097009300529751523727035584 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 705 for generator 21. -/
theorem ep_Q2_024_partial_21_0705_valid :
    mulPoly ep_Q2_024_coefficient_21_0705
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0705 := by
  native_decide

/-- Coefficient term 706 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0706 : Poly :=
[
  term ((3417434689737382686026454554257865562394472036753675263 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 2), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 706 for generator 21. -/
def ep_Q2_024_partial_21_0706 : Poly :=
[
  term ((3417434689737382686026454554257865562394472036753675263 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-3417434689737382686026454554257865562394472036753675263 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 706 for generator 21. -/
theorem ep_Q2_024_partial_21_0706_valid :
    mulPoly ep_Q2_024_coefficient_21_0706
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0706 := by
  native_decide

/-- Coefficient term 707 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0707 : Poly :=
[
  term ((-4859232461021042 : Rat) / 3488340663459579) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 707 for generator 21. -/
def ep_Q2_024_partial_21_0707 : Poly :=
[
  term ((-9718464922042084 : Rat) / 3488340663459579) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((4859232461021042 : Rat) / 3488340663459579) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 707 for generator 21. -/
theorem ep_Q2_024_partial_21_0707_valid :
    mulPoly ep_Q2_024_coefficient_21_0707
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0707 := by
  native_decide

/-- Coefficient term 708 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0708 : Poly :=
[
  term ((-410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (9, 2)]
]

/-- Partial product 708 for generator 21. -/
def ep_Q2_024_partial_21_0708 : Poly :=
[
  term ((410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (9, 2)],
  term ((-820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 708 for generator 21. -/
theorem ep_Q2_024_partial_21_0708_valid :
    mulPoly ep_Q2_024_coefficient_21_0708
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0708 := by
  native_decide

/-- Coefficient term 709 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0709 : Poly :=
[
  term ((89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (12, 1)]
]

/-- Partial product 709 for generator 21. -/
def ep_Q2_024_partial_21_0709 : Poly :=
[
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (10, 1), (12, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 709 for generator 21. -/
theorem ep_Q2_024_partial_21_0709_valid :
    mulPoly ep_Q2_024_coefficient_21_0709
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0709 := by
  native_decide

/-- Coefficient term 710 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0710 : Poly :=
[
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 710 for generator 21. -/
def ep_Q2_024_partial_21_0710 : Poly :=
[
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 710 for generator 21. -/
theorem ep_Q2_024_partial_21_0710_valid :
    mulPoly ep_Q2_024_coefficient_21_0710
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0710 := by
  native_decide

/-- Coefficient term 711 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0711 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 711 for generator 21. -/
def ep_Q2_024_partial_21_0711 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 711 for generator 21. -/
theorem ep_Q2_024_partial_21_0711_valid :
    mulPoly ep_Q2_024_coefficient_21_0711
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0711 := by
  native_decide

/-- Coefficient term 712 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0712 : Poly :=
[
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 2), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 712 for generator 21. -/
def ep_Q2_024_partial_21_0712 : Poly :=
[
  term ((-1054421534548864 : Rat) / 1162780221153193) [(1, 2), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 2), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 712 for generator 21. -/
theorem ep_Q2_024_partial_21_0712_valid :
    mulPoly ep_Q2_024_coefficient_21_0712
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0712 := by
  native_decide

/-- Coefficient term 713 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0713 : Poly :=
[
  term ((25837544794359523259924583983314066333789972713307408873 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 2), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 713 for generator 21. -/
def ep_Q2_024_partial_21_0713 : Poly :=
[
  term ((25837544794359523259924583983314066333789972713307408873 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-25837544794359523259924583983314066333789972713307408873 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 713 for generator 21. -/
theorem ep_Q2_024_partial_21_0713_valid :
    mulPoly ep_Q2_024_coefficient_21_0713
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0713 := by
  native_decide

/-- Coefficient term 714 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0714 : Poly :=
[
  term ((4642662710302105 : Rat) / 3488340663459579) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 714 for generator 21. -/
def ep_Q2_024_partial_21_0714 : Poly :=
[
  term ((9285325420604210 : Rat) / 3488340663459579) [(1, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4642662710302105 : Rat) / 3488340663459579) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 714 for generator 21. -/
theorem ep_Q2_024_partial_21_0714_valid :
    mulPoly ep_Q2_024_coefficient_21_0714
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0714 := by
  native_decide

/-- Coefficient term 715 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0715 : Poly :=
[
  term ((-17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (8, 1), (13, 2)]
]

/-- Partial product 715 for generator 21. -/
def ep_Q2_024_partial_21_0715 : Poly :=
[
  term ((-35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (8, 1), (10, 1), (13, 2)],
  term ((17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 715 for generator 21. -/
theorem ep_Q2_024_partial_21_0715_valid :
    mulPoly ep_Q2_024_coefficient_21_0715
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0715 := by
  native_decide

/-- Coefficient term 716 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0716 : Poly :=
[
  term ((475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 1), (14, 1)]
]

/-- Partial product 716 for generator 21. -/
def ep_Q2_024_partial_21_0716 : Poly :=
[
  term ((950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 1), (10, 1), (14, 1)],
  term ((-475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 716 for generator 21. -/
theorem ep_Q2_024_partial_21_0716_valid :
    mulPoly ep_Q2_024_coefficient_21_0716
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0716 := by
  native_decide

/-- Coefficient term 717 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0717 : Poly :=
[
  term ((-183448520398521727710285568751192685707032009457835592289 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 2), (8, 1), (15, 2)]
]

/-- Partial product 717 for generator 21. -/
def ep_Q2_024_partial_21_0717 : Poly :=
[
  term ((-366897040797043455420571137502385371414064018915671184578 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 2), (8, 1), (10, 1), (15, 2)],
  term ((183448520398521727710285568751192685707032009457835592289 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 717 for generator 21. -/
theorem ep_Q2_024_partial_21_0717_valid :
    mulPoly ep_Q2_024_coefficient_21_0717
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0717 := by
  native_decide

/-- Coefficient term 718 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0718 : Poly :=
[
  term ((25488046036701884 : Rat) / 3488340663459579) [(1, 2), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 718 for generator 21. -/
def ep_Q2_024_partial_21_0718 : Poly :=
[
  term ((50976092073403768 : Rat) / 3488340663459579) [(1, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-25488046036701884 : Rat) / 3488340663459579) [(1, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 718 for generator 21. -/
theorem ep_Q2_024_partial_21_0718_valid :
    mulPoly ep_Q2_024_coefficient_21_0718
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0718 := by
  native_decide

/-- Coefficient term 719 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0719 : Poly :=
[
  term ((826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 2)]
]

/-- Partial product 719 for generator 21. -/
def ep_Q2_024_partial_21_0719 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 2)],
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 719 for generator 21. -/
theorem ep_Q2_024_partial_21_0719_valid :
    mulPoly ep_Q2_024_coefficient_21_0719
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0719 := by
  native_decide

/-- Coefficient term 720 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0720 : Poly :=
[
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 720 for generator 21. -/
def ep_Q2_024_partial_21_0720 : Poly :=
[
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 720 for generator 21. -/
theorem ep_Q2_024_partial_21_0720_valid :
    mulPoly ep_Q2_024_coefficient_21_0720
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0720 := by
  native_decide

/-- Coefficient term 721 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0721 : Poly :=
[
  term ((-42068872695430329090105930332489522598 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 1), (15, 1)]
]

/-- Partial product 721 for generator 21. -/
def ep_Q2_024_partial_21_0721 : Poly :=
[
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((42068872695430329090105930332489522598 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 721 for generator 21. -/
theorem ep_Q2_024_partial_21_0721_valid :
    mulPoly ep_Q2_024_coefficient_21_0721
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0721 := by
  native_decide

/-- Coefficient term 722 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0722 : Poly :=
[
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 722 for generator 21. -/
def ep_Q2_024_partial_21_0722 : Poly :=
[
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 722 for generator 21. -/
theorem ep_Q2_024_partial_21_0722_valid :
    mulPoly ep_Q2_024_coefficient_21_0722
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0722 := by
  native_decide

/-- Coefficient term 723 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0723 : Poly :=
[
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 2), (10, 1), (15, 2)]
]

/-- Partial product 723 for generator 21. -/
def ep_Q2_024_partial_21_0723 : Poly :=
[
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 2), (10, 1), (15, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 2), (10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 723 for generator 21. -/
theorem ep_Q2_024_partial_21_0723_valid :
    mulPoly ep_Q2_024_coefficient_21_0723
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0723 := by
  native_decide

/-- Coefficient term 724 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0724 : Poly :=
[
  term ((-9851670194564511 : Rat) / 2325560442306386) [(1, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 724 for generator 21. -/
def ep_Q2_024_partial_21_0724 : Poly :=
[
  term ((9851670194564511 : Rat) / 2325560442306386) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-9851670194564511 : Rat) / 1162780221153193) [(1, 2), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 724 for generator 21. -/
theorem ep_Q2_024_partial_21_0724_valid :
    mulPoly ep_Q2_024_coefficient_21_0724
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0724 := by
  native_decide

/-- Coefficient term 725 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0725 : Poly :=
[
  term ((60573163266706614744631944042563938612 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (13, 1), (15, 1)]
]

/-- Partial product 725 for generator 21. -/
def ep_Q2_024_partial_21_0725 : Poly :=
[
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-60573163266706614744631944042563938612 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 725 for generator 21. -/
theorem ep_Q2_024_partial_21_0725_valid :
    mulPoly ep_Q2_024_coefficient_21_0725
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0725 := by
  native_decide

/-- Coefficient term 726 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0726 : Poly :=
[
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 2), (15, 2)]
]

/-- Partial product 726 for generator 21. -/
def ep_Q2_024_partial_21_0726 : Poly :=
[
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 2), (10, 1), (15, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 726 for generator 21. -/
theorem ep_Q2_024_partial_21_0726_valid :
    mulPoly ep_Q2_024_coefficient_21_0726
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0726 := by
  native_decide

/-- Coefficient term 727 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0727 : Poly :=
[
  term ((-9851670194564511 : Rat) / 4651120884612772) [(1, 2), (15, 2), (16, 1)]
]

/-- Partial product 727 for generator 21. -/
def ep_Q2_024_partial_21_0727 : Poly :=
[
  term ((-9851670194564511 : Rat) / 2325560442306386) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((9851670194564511 : Rat) / 4651120884612772) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 727 for generator 21. -/
theorem ep_Q2_024_partial_21_0727_valid :
    mulPoly ep_Q2_024_coefficient_21_0727
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0727 := by
  native_decide

/-- Coefficient term 728 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0728 : Poly :=
[
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1), (8, 1)]
]

/-- Partial product 728 for generator 21. -/
def ep_Q2_024_partial_21_0728 : Poly :=
[
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1), (8, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 728 for generator 21. -/
theorem ep_Q2_024_partial_21_0728_valid :
    mulPoly ep_Q2_024_coefficient_21_0728
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0728 := by
  native_decide

/-- Coefficient term 729 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0729 : Poly :=
[
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (8, 1), (11, 1)]
]

/-- Partial product 729 for generator 21. -/
def ep_Q2_024_partial_21_0729 : Poly :=
[
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (8, 1), (10, 1), (11, 1)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 729 for generator 21. -/
theorem ep_Q2_024_partial_21_0729_valid :
    mulPoly ep_Q2_024_coefficient_21_0729
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0729 := by
  native_decide

/-- Coefficient term 730 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0730 : Poly :=
[
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 730 for generator 21. -/
def ep_Q2_024_partial_21_0730 : Poly :=
[
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (9, 1)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 730 for generator 21. -/
theorem ep_Q2_024_partial_21_0730_valid :
    mulPoly ep_Q2_024_coefficient_21_0730
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0730 := by
  native_decide

/-- Coefficient term 731 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0731 : Poly :=
[
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (9, 1), (10, 1)]
]

/-- Partial product 731 for generator 21. -/
def ep_Q2_024_partial_21_0731 : Poly :=
[
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (9, 1), (10, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 731 for generator 21. -/
theorem ep_Q2_024_partial_21_0731_valid :
    mulPoly ep_Q2_024_coefficient_21_0731
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0731 := by
  native_decide

/-- Coefficient term 732 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0732 : Poly :=
[
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (8, 1), (11, 1)]
]

/-- Partial product 732 for generator 21. -/
def ep_Q2_024_partial_21_0732 : Poly :=
[
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (8, 1), (10, 1), (11, 1)],
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 732 for generator 21. -/
theorem ep_Q2_024_partial_21_0732_valid :
    mulPoly ep_Q2_024_coefficient_21_0732
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0732 := by
  native_decide

/-- Coefficient term 733 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0733 : Poly :=
[
  term ((-122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1)]
]

/-- Partial product 733 for generator 21. -/
def ep_Q2_024_partial_21_0733 : Poly :=
[
  term ((122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1)],
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 733 for generator 21. -/
theorem ep_Q2_024_partial_21_0733_valid :
    mulPoly ep_Q2_024_coefficient_21_0733
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0733 := by
  native_decide

/-- Coefficient term 734 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0734 : Poly :=
[
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (10, 1)]
]

/-- Partial product 734 for generator 21. -/
def ep_Q2_024_partial_21_0734 : Poly :=
[
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (10, 1)],
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 734 for generator 21. -/
theorem ep_Q2_024_partial_21_0734_valid :
    mulPoly ep_Q2_024_coefficient_21_0734
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0734 := by
  native_decide

/-- Coefficient term 735 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0735 : Poly :=
[
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 1), (11, 1)]
]

/-- Partial product 735 for generator 21. -/
def ep_Q2_024_partial_21_0735 : Poly :=
[
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 735 for generator 21. -/
theorem ep_Q2_024_partial_21_0735_valid :
    mulPoly ep_Q2_024_coefficient_21_0735
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0735 := by
  native_decide

/-- Coefficient term 736 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0736 : Poly :=
[
  term ((-5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 736 for generator 21. -/
def ep_Q2_024_partial_21_0736 : Poly :=
[
  term ((-11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 736 for generator 21. -/
theorem ep_Q2_024_partial_21_0736_valid :
    mulPoly ep_Q2_024_coefficient_21_0736
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0736 := by
  native_decide

/-- Coefficient term 737 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0737 : Poly :=
[
  term ((-558264426224611819334380279491871956317971781782933742 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 737 for generator 21. -/
def ep_Q2_024_partial_21_0737 : Poly :=
[
  term ((-1116528852449223638668760558983743912635943563565867484 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((558264426224611819334380279491871956317971781782933742 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 737 for generator 21. -/
theorem ep_Q2_024_partial_21_0737_valid :
    mulPoly ep_Q2_024_coefficient_21_0737
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0737 := by
  native_decide

/-- Coefficient term 738 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0738 : Poly :=
[
  term ((336845665822200 : Rat) / 1162780221153193) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 738 for generator 21. -/
def ep_Q2_024_partial_21_0738 : Poly :=
[
  term ((673691331644400 : Rat) / 1162780221153193) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-336845665822200 : Rat) / 1162780221153193) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 738 for generator 21. -/
theorem ep_Q2_024_partial_21_0738_valid :
    mulPoly ep_Q2_024_coefficient_21_0738
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0738 := by
  native_decide

/-- Coefficient term 739 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0739 : Poly :=
[
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1)]
]

/-- Partial product 739 for generator 21. -/
def ep_Q2_024_partial_21_0739 : Poly :=
[
  term ((-259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 739 for generator 21. -/
theorem ep_Q2_024_partial_21_0739_valid :
    mulPoly ep_Q2_024_coefficient_21_0739
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0739 := by
  native_decide

/-- Coefficient term 740 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0740 : Poly :=
[
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (10, 1)]
]

/-- Partial product 740 for generator 21. -/
def ep_Q2_024_partial_21_0740 : Poly :=
[
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (10, 1)],
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 740 for generator 21. -/
theorem ep_Q2_024_partial_21_0740_valid :
    mulPoly ep_Q2_024_coefficient_21_0740
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0740 := by
  native_decide

/-- Coefficient term 741 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0741 : Poly :=
[
  term ((580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (9, 1), (11, 1)]
]

/-- Partial product 741 for generator 21. -/
def ep_Q2_024_partial_21_0741 : Poly :=
[
  term ((1160665166366196213589052782730216702704 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 741 for generator 21. -/
theorem ep_Q2_024_partial_21_0741_valid :
    mulPoly ep_Q2_024_coefficient_21_0741
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0741 := by
  native_decide

/-- Coefficient term 742 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0742 : Poly :=
[
  term ((-60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 742 for generator 21. -/
def ep_Q2_024_partial_21_0742 : Poly :=
[
  term ((-120119693188535354558813178622554671224 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 742 for generator 21. -/
theorem ep_Q2_024_partial_21_0742_valid :
    mulPoly ep_Q2_024_coefficient_21_0742
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0742 := by
  native_decide

/-- Coefficient term 743 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0743 : Poly :=
[
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 743 for generator 21. -/
def ep_Q2_024_partial_21_0743 : Poly :=
[
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 743 for generator 21. -/
theorem ep_Q2_024_partial_21_0743_valid :
    mulPoly ep_Q2_024_coefficient_21_0743
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0743 := by
  native_decide

/-- Coefficient term 744 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0744 : Poly :=
[
  term ((-448228140819559 : Rat) / 1162780221153193) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 744 for generator 21. -/
def ep_Q2_024_partial_21_0744 : Poly :=
[
  term ((-896456281639118 : Rat) / 1162780221153193) [(2, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((448228140819559 : Rat) / 1162780221153193) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 744 for generator 21. -/
theorem ep_Q2_024_partial_21_0744_valid :
    mulPoly ep_Q2_024_coefficient_21_0744
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0744 := by
  native_decide

/-- Coefficient term 745 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0745 : Poly :=
[
  term ((926134959122893448371626358467155948192 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 745 for generator 21. -/
def ep_Q2_024_partial_21_0745 : Poly :=
[
  term ((1852269918245786896743252716934311896384 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-926134959122893448371626358467155948192 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 745 for generator 21. -/
theorem ep_Q2_024_partial_21_0745_valid :
    mulPoly ep_Q2_024_coefficient_21_0745
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0745 := by
  native_decide

/-- Coefficient term 746 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0746 : Poly :=
[
  term ((123791873617191140105857464850579092705757151288775427373 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 746 for generator 21. -/
def ep_Q2_024_partial_21_0746 : Poly :=
[
  term ((123791873617191140105857464850579092705757151288775427373 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-123791873617191140105857464850579092705757151288775427373 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 746 for generator 21. -/
theorem ep_Q2_024_partial_21_0746_valid :
    mulPoly ep_Q2_024_coefficient_21_0746
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0746 := by
  native_decide

/-- Coefficient term 747 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0747 : Poly :=
[
  term ((13766191430316001 : Rat) / 2325560442306386) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 747 for generator 21. -/
def ep_Q2_024_partial_21_0747 : Poly :=
[
  term ((13766191430316001 : Rat) / 1162780221153193) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13766191430316001 : Rat) / 2325560442306386) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 747 for generator 21. -/
theorem ep_Q2_024_partial_21_0747_valid :
    mulPoly ep_Q2_024_coefficient_21_0747
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0747 := by
  native_decide

/-- Coefficient term 748 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0748 : Poly :=
[
  term ((60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 748 for generator 21. -/
def ep_Q2_024_partial_21_0748 : Poly :=
[
  term ((-60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((120119693188535354558813178622554671224 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (10, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 748 for generator 21. -/
theorem ep_Q2_024_partial_21_0748_valid :
    mulPoly ep_Q2_024_coefficient_21_0748
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0748 := by
  native_decide

/-- Coefficient term 749 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0749 : Poly :=
[
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 749 for generator 21. -/
def ep_Q2_024_partial_21_0749 : Poly :=
[
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (10, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 749 for generator 21. -/
theorem ep_Q2_024_partial_21_0749_valid :
    mulPoly ep_Q2_024_coefficient_21_0749
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0749 := by
  native_decide

/-- Coefficient term 750 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0750 : Poly :=
[
  term ((448228140819559 : Rat) / 1162780221153193) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 750 for generator 21. -/
def ep_Q2_024_partial_21_0750 : Poly :=
[
  term ((-448228140819559 : Rat) / 1162780221153193) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((896456281639118 : Rat) / 1162780221153193) [(2, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 750 for generator 21. -/
theorem ep_Q2_024_partial_21_0750_valid :
    mulPoly ep_Q2_024_coefficient_21_0750
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0750 := by
  native_decide

/-- Coefficient term 751 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0751 : Poly :=
[
  term ((-926134959122893448371626358467155948192 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 751 for generator 21. -/
def ep_Q2_024_partial_21_0751 : Poly :=
[
  term ((926134959122893448371626358467155948192 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (10, 1), (13, 1)],
  term ((-1852269918245786896743252716934311896384 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 751 for generator 21. -/
theorem ep_Q2_024_partial_21_0751_valid :
    mulPoly ep_Q2_024_coefficient_21_0751
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0751 := by
  native_decide

/-- Coefficient term 752 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0752 : Poly :=
[
  term ((-123791873617191140105857464850579092705757151288775427373 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 752 for generator 21. -/
def ep_Q2_024_partial_21_0752 : Poly :=
[
  term ((123791873617191140105857464850579092705757151288775427373 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-123791873617191140105857464850579092705757151288775427373 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 752 for generator 21. -/
theorem ep_Q2_024_partial_21_0752_valid :
    mulPoly ep_Q2_024_coefficient_21_0752
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0752 := by
  native_decide

/-- Coefficient term 753 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0753 : Poly :=
[
  term ((-13766191430316001 : Rat) / 2325560442306386) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 753 for generator 21. -/
def ep_Q2_024_partial_21_0753 : Poly :=
[
  term ((13766191430316001 : Rat) / 2325560442306386) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13766191430316001 : Rat) / 1162780221153193) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 753 for generator 21. -/
theorem ep_Q2_024_partial_21_0753_valid :
    mulPoly ep_Q2_024_coefficient_21_0753
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0753 := by
  native_decide

/-- Coefficient term 754 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0754 : Poly :=
[
  term ((30029923297133838639703294655638667806 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 754 for generator 21. -/
def ep_Q2_024_partial_21_0754 : Poly :=
[
  term ((60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-30029923297133838639703294655638667806 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 754 for generator 21. -/
theorem ep_Q2_024_partial_21_0754_valid :
    mulPoly ep_Q2_024_coefficient_21_0754
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0754 := by
  native_decide

/-- Coefficient term 755 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0755 : Poly :=
[
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 755 for generator 21. -/
def ep_Q2_024_partial_21_0755 : Poly :=
[
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 755 for generator 21. -/
theorem ep_Q2_024_partial_21_0755_valid :
    mulPoly ep_Q2_024_coefficient_21_0755
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0755 := by
  native_decide

/-- Coefficient term 756 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0756 : Poly :=
[
  term ((448228140819559 : Rat) / 2325560442306386) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 756 for generator 21. -/
def ep_Q2_024_partial_21_0756 : Poly :=
[
  term ((448228140819559 : Rat) / 1162780221153193) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-448228140819559 : Rat) / 2325560442306386) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 756 for generator 21. -/
theorem ep_Q2_024_partial_21_0756_valid :
    mulPoly ep_Q2_024_coefficient_21_0756
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0756 := by
  native_decide

/-- Coefficient term 757 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0757 : Poly :=
[
  term ((-463067479561446724185813179233577974096 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 757 for generator 21. -/
def ep_Q2_024_partial_21_0757 : Poly :=
[
  term ((-926134959122893448371626358467155948192 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (10, 1), (13, 1)],
  term ((463067479561446724185813179233577974096 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 757 for generator 21. -/
theorem ep_Q2_024_partial_21_0757_valid :
    mulPoly ep_Q2_024_coefficient_21_0757
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0757 := by
  native_decide

/-- Coefficient term 758 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0758 : Poly :=
[
  term ((-123791873617191140105857464850579092705757151288775427373 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 758 for generator 21. -/
def ep_Q2_024_partial_21_0758 : Poly :=
[
  term ((-123791873617191140105857464850579092705757151288775427373 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (9, 1), (10, 1), (15, 1)],
  term ((123791873617191140105857464850579092705757151288775427373 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 758 for generator 21. -/
theorem ep_Q2_024_partial_21_0758_valid :
    mulPoly ep_Q2_024_coefficient_21_0758
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0758 := by
  native_decide

/-- Coefficient term 759 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0759 : Poly :=
[
  term ((-13766191430316001 : Rat) / 4651120884612772) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 759 for generator 21. -/
def ep_Q2_024_partial_21_0759 : Poly :=
[
  term ((-13766191430316001 : Rat) / 2325560442306386) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((13766191430316001 : Rat) / 4651120884612772) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 759 for generator 21. -/
theorem ep_Q2_024_partial_21_0759_valid :
    mulPoly ep_Q2_024_coefficient_21_0759
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0759 := by
  native_decide

/-- Coefficient term 760 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0760 : Poly :=
[
  term ((-290166291591549053397263195682554175676 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 2)]
]

/-- Partial product 760 for generator 21. -/
def ep_Q2_024_partial_21_0760 : Poly :=
[
  term ((290166291591549053397263195682554175676 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 2)],
  term ((-580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 760 for generator 21. -/
theorem ep_Q2_024_partial_21_0760_valid :
    mulPoly ep_Q2_024_coefficient_21_0760
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0760 := by
  native_decide

/-- Coefficient term 761 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0761 : Poly :=
[
  term ((-580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 2), (10, 1)]
]

/-- Partial product 761 for generator 21. -/
def ep_Q2_024_partial_21_0761 : Poly :=
[
  term ((580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 2), (10, 1)],
  term ((-1160665166366196213589052782730216702704 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 2), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 761 for generator 21. -/
theorem ep_Q2_024_partial_21_0761_valid :
    mulPoly ep_Q2_024_coefficient_21_0761
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0761 := by
  native_decide

/-- Coefficient term 762 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0762 : Poly :=
[
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (8, 1)]
]

/-- Partial product 762 for generator 21. -/
def ep_Q2_024_partial_21_0762 : Poly :=
[
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (8, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 762 for generator 21. -/
theorem ep_Q2_024_partial_21_0762_valid :
    mulPoly ep_Q2_024_coefficient_21_0762
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0762 := by
  native_decide

/-- Coefficient term 763 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0763 : Poly :=
[
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (8, 1), (11, 1)]
]

/-- Partial product 763 for generator 21. -/
def ep_Q2_024_partial_21_0763 : Poly :=
[
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (8, 1), (10, 1), (11, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 763 for generator 21. -/
theorem ep_Q2_024_partial_21_0763_valid :
    mulPoly ep_Q2_024_coefficient_21_0763
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0763 := by
  native_decide

/-- Coefficient term 764 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0764 : Poly :=
[
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1)]
]

/-- Partial product 764 for generator 21. -/
def ep_Q2_024_partial_21_0764 : Poly :=
[
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 764 for generator 21. -/
theorem ep_Q2_024_partial_21_0764_valid :
    mulPoly ep_Q2_024_coefficient_21_0764
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0764 := by
  native_decide

/-- Coefficient term 765 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0765 : Poly :=
[
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1), (10, 1)]
]

/-- Partial product 765 for generator 21. -/
def ep_Q2_024_partial_21_0765 : Poly :=
[
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1), (10, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 765 for generator 21. -/
theorem ep_Q2_024_partial_21_0765_valid :
    mulPoly ep_Q2_024_coefficient_21_0765
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0765 := by
  native_decide

/-- Coefficient term 766 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0766 : Poly :=
[
  term ((-24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 1)]
]

/-- Partial product 766 for generator 21. -/
def ep_Q2_024_partial_21_0766 : Poly :=
[
  term ((24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 1)],
  term ((-49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 766 for generator 21. -/
theorem ep_Q2_024_partial_21_0766_valid :
    mulPoly ep_Q2_024_coefficient_21_0766
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0766 := by
  native_decide

/-- Coefficient term 767 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0767 : Poly :=
[
  term ((-157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 767 for generator 21. -/
def ep_Q2_024_partial_21_0767 : Poly :=
[
  term ((-315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 767 for generator 21. -/
theorem ep_Q2_024_partial_21_0767_valid :
    mulPoly ep_Q2_024_coefficient_21_0767
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0767 := by
  native_decide

/-- Coefficient term 768 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0768 : Poly :=
[
  term ((905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 768 for generator 21. -/
def ep_Q2_024_partial_21_0768 : Poly :=
[
  term ((1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 768 for generator 21. -/
theorem ep_Q2_024_partial_21_0768_valid :
    mulPoly ep_Q2_024_coefficient_21_0768
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0768 := by
  native_decide

/-- Coefficient term 769 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0769 : Poly :=
[
  term ((3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 769 for generator 21. -/
def ep_Q2_024_partial_21_0769 : Poly :=
[
  term ((6527709106782976 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 769 for generator 21. -/
theorem ep_Q2_024_partial_21_0769_valid :
    mulPoly ep_Q2_024_coefficient_21_0769
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0769 := by
  native_decide

/-- Coefficient term 770 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0770 : Poly :=
[
  term ((122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (8, 1)]
]

/-- Partial product 770 for generator 21. -/
def ep_Q2_024_partial_21_0770 : Poly :=
[
  term ((-122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (8, 1)],
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 770 for generator 21. -/
theorem ep_Q2_024_partial_21_0770_valid :
    mulPoly ep_Q2_024_coefficient_21_0770
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0770 := by
  native_decide

/-- Coefficient term 771 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0771 : Poly :=
[
  term ((-24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1)]
]

/-- Partial product 771 for generator 21. -/
def ep_Q2_024_partial_21_0771 : Poly :=
[
  term ((-49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 771 for generator 21. -/
theorem ep_Q2_024_partial_21_0771_valid :
    mulPoly ep_Q2_024_coefficient_21_0771
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0771 := by
  native_decide

/-- Coefficient term 772 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0772 : Poly :=
[
  term ((-157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 772 for generator 21. -/
def ep_Q2_024_partial_21_0772 : Poly :=
[
  term ((-315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 772 for generator 21. -/
theorem ep_Q2_024_partial_21_0772_valid :
    mulPoly ep_Q2_024_coefficient_21_0772
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0772 := by
  native_decide

/-- Coefficient term 773 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0773 : Poly :=
[
  term ((905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 773 for generator 21. -/
def ep_Q2_024_partial_21_0773 : Poly :=
[
  term ((1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 773 for generator 21. -/
theorem ep_Q2_024_partial_21_0773_valid :
    mulPoly ep_Q2_024_coefficient_21_0773
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0773 := by
  native_decide

/-- Coefficient term 774 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0774 : Poly :=
[
  term ((3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 774 for generator 21. -/
def ep_Q2_024_partial_21_0774 : Poly :=
[
  term ((6527709106782976 : Rat) / 1162780221153193) [(3, 1), (5, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 774 for generator 21. -/
theorem ep_Q2_024_partial_21_0774_valid :
    mulPoly ep_Q2_024_coefficient_21_0774
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0774 := by
  native_decide

/-- Coefficient term 775 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0775 : Poly :=
[
  term ((157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 775 for generator 21. -/
def ep_Q2_024_partial_21_0775 : Poly :=
[
  term ((-157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 1), (10, 1), (13, 1)],
  term ((315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 775 for generator 21. -/
theorem ep_Q2_024_partial_21_0775_valid :
    mulPoly ep_Q2_024_coefficient_21_0775
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0775 := by
  native_decide

/-- Coefficient term 776 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0776 : Poly :=
[
  term ((-905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 776 for generator 21. -/
def ep_Q2_024_partial_21_0776 : Poly :=
[
  term ((905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 776 for generator 21. -/
theorem ep_Q2_024_partial_21_0776_valid :
    mulPoly ep_Q2_024_coefficient_21_0776
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0776 := by
  native_decide

/-- Coefficient term 777 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0777 : Poly :=
[
  term ((-3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 777 for generator 21. -/
def ep_Q2_024_partial_21_0777 : Poly :=
[
  term ((3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6527709106782976 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 777 for generator 21. -/
theorem ep_Q2_024_partial_21_0777_valid :
    mulPoly ep_Q2_024_coefficient_21_0777
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0777 := by
  native_decide

/-- Coefficient term 778 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0778 : Poly :=
[
  term ((78908208967256020638431158193382195448 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 778 for generator 21. -/
def ep_Q2_024_partial_21_0778 : Poly :=
[
  term ((157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 1), (10, 1), (13, 1)],
  term ((-78908208967256020638431158193382195448 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 778 for generator 21. -/
theorem ep_Q2_024_partial_21_0778_valid :
    mulPoly ep_Q2_024_coefficient_21_0778
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0778 := by
  native_decide

/-- Coefficient term 779 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0779 : Poly :=
[
  term ((-452824946243456057718851545758264321159544336659511640 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 779 for generator 21. -/
def ep_Q2_024_partial_21_0779 : Poly :=
[
  term ((-905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((452824946243456057718851545758264321159544336659511640 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 779 for generator 21. -/
theorem ep_Q2_024_partial_21_0779_valid :
    mulPoly ep_Q2_024_coefficient_21_0779
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0779 := by
  native_decide

/-- Coefficient term 780 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0780 : Poly :=
[
  term ((-1631927276695744 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 780 for generator 21. -/
def ep_Q2_024_partial_21_0780 : Poly :=
[
  term ((-3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1631927276695744 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 780 for generator 21. -/
theorem ep_Q2_024_partial_21_0780_valid :
    mulPoly ep_Q2_024_coefficient_21_0780
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0780 := by
  native_decide

/-- Coefficient term 781 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0781 : Poly :=
[
  term ((12329420463575023800351311507033664732 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (9, 2)]
]

/-- Partial product 781 for generator 21. -/
def ep_Q2_024_partial_21_0781 : Poly :=
[
  term ((-12329420463575023800351311507033664732 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (9, 2)],
  term ((24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 781 for generator 21. -/
theorem ep_Q2_024_partial_21_0781_valid :
    mulPoly ep_Q2_024_coefficient_21_0781
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0781 := by
  native_decide

/-- Coefficient term 782 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0782 : Poly :=
[
  term ((24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (9, 2), (10, 1)]
]

/-- Partial product 782 for generator 21. -/
def ep_Q2_024_partial_21_0782 : Poly :=
[
  term ((-24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (9, 2), (10, 1)],
  term ((49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (9, 2), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 782 for generator 21. -/
theorem ep_Q2_024_partial_21_0782_valid :
    mulPoly ep_Q2_024_coefficient_21_0782
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0782 := by
  native_decide

/-- Coefficient term 783 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0783 : Poly :=
[
  term ((-148463915429989232827957433590977261265 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (7, 1), (8, 1)]
]

/-- Partial product 783 for generator 21. -/
def ep_Q2_024_partial_21_0783 : Poly :=
[
  term ((148463915429989232827957433590977261265 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (7, 1), (8, 1)],
  term ((-296927830859978465655914867181954522530 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (7, 1), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 783 for generator 21. -/
theorem ep_Q2_024_partial_21_0783_valid :
    mulPoly ep_Q2_024_coefficient_21_0783
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0783 := by
  native_decide

/-- Coefficient term 784 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0784 : Poly :=
[
  term ((-117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (9, 1), (13, 1)]
]

/-- Partial product 784 for generator 21. -/
def ep_Q2_024_partial_21_0784 : Poly :=
[
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 784 for generator 21. -/
theorem ep_Q2_024_partial_21_0784_valid :
    mulPoly ep_Q2_024_coefficient_21_0784
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0784 := by
  native_decide

/-- Coefficient term 785 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0785 : Poly :=
[
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 785 for generator 21. -/
def ep_Q2_024_partial_21_0785 : Poly :=
[
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (7, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 785 for generator 21. -/
theorem ep_Q2_024_partial_21_0785_valid :
    mulPoly ep_Q2_024_coefficient_21_0785
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0785 := by
  native_decide

/-- Coefficient term 786 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0786 : Poly :=
[
  term ((-1121361337158702 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 786 for generator 21. -/
def ep_Q2_024_partial_21_0786 : Poly :=
[
  term ((-2242722674317404 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1121361337158702 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 786 for generator 21. -/
theorem ep_Q2_024_partial_21_0786_valid :
    mulPoly ep_Q2_024_coefficient_21_0786
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0786 := by
  native_decide

/-- Coefficient term 787 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0787 : Poly :=
[
  term ((-94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (9, 2)]
]

/-- Partial product 787 for generator 21. -/
def ep_Q2_024_partial_21_0787 : Poly :=
[
  term ((94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (9, 2)],
  term ((-189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 787 for generator 21. -/
theorem ep_Q2_024_partial_21_0787_valid :
    mulPoly ep_Q2_024_coefficient_21_0787
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0787 := by
  native_decide

/-- Coefficient term 788 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0788 : Poly :=
[
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (12, 1)]
]

/-- Partial product 788 for generator 21. -/
def ep_Q2_024_partial_21_0788 : Poly :=
[
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (10, 1), (12, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 788 for generator 21. -/
theorem ep_Q2_024_partial_21_0788_valid :
    mulPoly ep_Q2_024_coefficient_21_0788
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0788 := by
  native_decide

/-- Coefficient term 789 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0789 : Poly :=
[
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 789 for generator 21. -/
def ep_Q2_024_partial_21_0789 : Poly :=
[
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 789 for generator 21. -/
theorem ep_Q2_024_partial_21_0789_valid :
    mulPoly ep_Q2_024_coefficient_21_0789
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0789 := by
  native_decide

/-- Coefficient term 790 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0790 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (7, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 790 for generator 21. -/
def ep_Q2_024_partial_21_0790 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (7, 1), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 790 for generator 21. -/
theorem ep_Q2_024_partial_21_0790_valid :
    mulPoly ep_Q2_024_coefficient_21_0790
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0790 := by
  native_decide

/-- Coefficient term 791 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0791 : Poly :=
[
  term ((-1581632301823296 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 791 for generator 21. -/
def ep_Q2_024_partial_21_0791 : Poly :=
[
  term ((-3163264603646592 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 791 for generator 21. -/
theorem ep_Q2_024_partial_21_0791_valid :
    mulPoly ep_Q2_024_coefficient_21_0791
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0791 := by
  native_decide

/-- Coefficient term 792 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0792 : Poly :=
[
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 792 for generator 21. -/
def ep_Q2_024_partial_21_0792 : Poly :=
[
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 792 for generator 21. -/
theorem ep_Q2_024_partial_21_0792_valid :
    mulPoly ep_Q2_024_coefficient_21_0792
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0792 := by
  native_decide

/-- Coefficient term 793 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0793 : Poly :=
[
  term ((-106291408585995 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 793 for generator 21. -/
def ep_Q2_024_partial_21_0793 : Poly :=
[
  term ((-212582817171990 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((106291408585995 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 793 for generator 21. -/
theorem ep_Q2_024_partial_21_0793_valid :
    mulPoly ep_Q2_024_coefficient_21_0793
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0793 := by
  native_decide

/-- Coefficient term 794 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0794 : Poly :=
[
  term ((16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (13, 2)]
]

/-- Partial product 794 for generator 21. -/
def ep_Q2_024_partial_21_0794 : Poly :=
[
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (10, 1), (13, 2)],
  term ((-16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 794 for generator 21. -/
theorem ep_Q2_024_partial_21_0794_valid :
    mulPoly ep_Q2_024_coefficient_21_0794
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0794 := by
  native_decide

/-- Coefficient term 795 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0795 : Poly :=
[
  term ((608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (14, 1)]
]

/-- Partial product 795 for generator 21. -/
def ep_Q2_024_partial_21_0795 : Poly :=
[
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (10, 1), (14, 1)],
  term ((-608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 795 for generator 21. -/
theorem ep_Q2_024_partial_21_0795_valid :
    mulPoly ep_Q2_024_coefficient_21_0795
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0795 := by
  native_decide

/-- Coefficient term 796 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0796 : Poly :=
[
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(3, 1), (7, 1), (8, 1), (15, 2)]
]

/-- Partial product 796 for generator 21. -/
def ep_Q2_024_partial_21_0796 : Poly :=
[
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 23644041155898808945036612648379641461034231099511730) [(3, 1), (7, 1), (8, 1), (10, 1), (15, 2)],
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(3, 1), (7, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 796 for generator 21. -/
theorem ep_Q2_024_partial_21_0796_valid :
    mulPoly ep_Q2_024_coefficient_21_0796
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0796 := by
  native_decide

/-- Coefficient term 797 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0797 : Poly :=
[
  term ((1048479305353675 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 797 for generator 21. -/
def ep_Q2_024_partial_21_0797 : Poly :=
[
  term ((2096958610707350 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1048479305353675 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 797 for generator 21. -/
theorem ep_Q2_024_partial_21_0797_valid :
    mulPoly ep_Q2_024_coefficient_21_0797
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0797 := by
  native_decide

/-- Coefficient term 798 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0798 : Poly :=
[
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 2)]
]

/-- Partial product 798 for generator 21. -/
def ep_Q2_024_partial_21_0798 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 2)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 798 for generator 21. -/
theorem ep_Q2_024_partial_21_0798_valid :
    mulPoly ep_Q2_024_coefficient_21_0798
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0798 := by
  native_decide

/-- Coefficient term 799 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0799 : Poly :=
[
  term ((-123007490483570609696505280535880061756 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1)]
]

/-- Partial product 799 for generator 21. -/
def ep_Q2_024_partial_21_0799 : Poly :=
[
  term ((123007490483570609696505280535880061756 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1)],
  term ((-246014980967141219393010561071760123512 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 799 for generator 21. -/
theorem ep_Q2_024_partial_21_0799_valid :
    mulPoly ep_Q2_024_coefficient_21_0799
        ep_Q2_024_generator_21_0700_0799 =
      ep_Q2_024_partial_21_0799 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_21_0700_0799 : List Poly :=
[
  ep_Q2_024_partial_21_0700,
  ep_Q2_024_partial_21_0701,
  ep_Q2_024_partial_21_0702,
  ep_Q2_024_partial_21_0703,
  ep_Q2_024_partial_21_0704,
  ep_Q2_024_partial_21_0705,
  ep_Q2_024_partial_21_0706,
  ep_Q2_024_partial_21_0707,
  ep_Q2_024_partial_21_0708,
  ep_Q2_024_partial_21_0709,
  ep_Q2_024_partial_21_0710,
  ep_Q2_024_partial_21_0711,
  ep_Q2_024_partial_21_0712,
  ep_Q2_024_partial_21_0713,
  ep_Q2_024_partial_21_0714,
  ep_Q2_024_partial_21_0715,
  ep_Q2_024_partial_21_0716,
  ep_Q2_024_partial_21_0717,
  ep_Q2_024_partial_21_0718,
  ep_Q2_024_partial_21_0719,
  ep_Q2_024_partial_21_0720,
  ep_Q2_024_partial_21_0721,
  ep_Q2_024_partial_21_0722,
  ep_Q2_024_partial_21_0723,
  ep_Q2_024_partial_21_0724,
  ep_Q2_024_partial_21_0725,
  ep_Q2_024_partial_21_0726,
  ep_Q2_024_partial_21_0727,
  ep_Q2_024_partial_21_0728,
  ep_Q2_024_partial_21_0729,
  ep_Q2_024_partial_21_0730,
  ep_Q2_024_partial_21_0731,
  ep_Q2_024_partial_21_0732,
  ep_Q2_024_partial_21_0733,
  ep_Q2_024_partial_21_0734,
  ep_Q2_024_partial_21_0735,
  ep_Q2_024_partial_21_0736,
  ep_Q2_024_partial_21_0737,
  ep_Q2_024_partial_21_0738,
  ep_Q2_024_partial_21_0739,
  ep_Q2_024_partial_21_0740,
  ep_Q2_024_partial_21_0741,
  ep_Q2_024_partial_21_0742,
  ep_Q2_024_partial_21_0743,
  ep_Q2_024_partial_21_0744,
  ep_Q2_024_partial_21_0745,
  ep_Q2_024_partial_21_0746,
  ep_Q2_024_partial_21_0747,
  ep_Q2_024_partial_21_0748,
  ep_Q2_024_partial_21_0749,
  ep_Q2_024_partial_21_0750,
  ep_Q2_024_partial_21_0751,
  ep_Q2_024_partial_21_0752,
  ep_Q2_024_partial_21_0753,
  ep_Q2_024_partial_21_0754,
  ep_Q2_024_partial_21_0755,
  ep_Q2_024_partial_21_0756,
  ep_Q2_024_partial_21_0757,
  ep_Q2_024_partial_21_0758,
  ep_Q2_024_partial_21_0759,
  ep_Q2_024_partial_21_0760,
  ep_Q2_024_partial_21_0761,
  ep_Q2_024_partial_21_0762,
  ep_Q2_024_partial_21_0763,
  ep_Q2_024_partial_21_0764,
  ep_Q2_024_partial_21_0765,
  ep_Q2_024_partial_21_0766,
  ep_Q2_024_partial_21_0767,
  ep_Q2_024_partial_21_0768,
  ep_Q2_024_partial_21_0769,
  ep_Q2_024_partial_21_0770,
  ep_Q2_024_partial_21_0771,
  ep_Q2_024_partial_21_0772,
  ep_Q2_024_partial_21_0773,
  ep_Q2_024_partial_21_0774,
  ep_Q2_024_partial_21_0775,
  ep_Q2_024_partial_21_0776,
  ep_Q2_024_partial_21_0777,
  ep_Q2_024_partial_21_0778,
  ep_Q2_024_partial_21_0779,
  ep_Q2_024_partial_21_0780,
  ep_Q2_024_partial_21_0781,
  ep_Q2_024_partial_21_0782,
  ep_Q2_024_partial_21_0783,
  ep_Q2_024_partial_21_0784,
  ep_Q2_024_partial_21_0785,
  ep_Q2_024_partial_21_0786,
  ep_Q2_024_partial_21_0787,
  ep_Q2_024_partial_21_0788,
  ep_Q2_024_partial_21_0789,
  ep_Q2_024_partial_21_0790,
  ep_Q2_024_partial_21_0791,
  ep_Q2_024_partial_21_0792,
  ep_Q2_024_partial_21_0793,
  ep_Q2_024_partial_21_0794,
  ep_Q2_024_partial_21_0795,
  ep_Q2_024_partial_21_0796,
  ep_Q2_024_partial_21_0797,
  ep_Q2_024_partial_21_0798,
  ep_Q2_024_partial_21_0799
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_21_0700_0799 : Poly :=
[
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (5, 1), (10, 1), (13, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((-1709530353079456 : Rat) / 1162780221153193) [(1, 2), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (5, 1), (13, 1)],
  term ((1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (15, 1)],
  term ((427382588269864 : Rat) / 1162780221153193) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-6152558431199985774021492508158074690183 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (8, 1)],
  term ((-1100697137389097009300529751523727035584 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((3417434689737382686026454554257865562394472036753675263 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-9718464922042084 : Rat) / 3488340663459579) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (9, 1), (13, 1)],
  term ((-3417434689737382686026454554257865562394472036753675263 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((4859232461021042 : Rat) / 3488340663459579) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (9, 2)],
  term ((-820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (9, 2), (10, 1)],
  term ((12305116862399971548042985016316149380366 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (8, 1), (10, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (10, 1), (12, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(1, 2), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((25837544794359523259924583983314066333789972713307408873 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((9285325420604210 : Rat) / 3488340663459579) [(1, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (8, 1), (10, 1), (13, 2)],
  term ((950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 1), (10, 1), (14, 1)],
  term ((-366897040797043455420571137502385371414064018915671184578 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 2), (8, 1), (10, 1), (15, 2)],
  term ((50976092073403768 : Rat) / 3488340663459579) [(1, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (12, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (8, 1), (12, 1), (15, 2)],
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-25837544794359523259924583983314066333789972713307408873 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((-4642662710302105 : Rat) / 3488340663459579) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (8, 1), (13, 2)],
  term ((-475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 1), (14, 1)],
  term ((183448520398521727710285568751192685707032009457835592289 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 2), (8, 1), (15, 2)],
  term ((-25488046036701884 : Rat) / 3488340663459579) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 2)],
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 2), (10, 1)],
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 1), (10, 2), (15, 1)],
  term ((42068872695430329090105930332489522598 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 1), (15, 1)],
  term ((242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (10, 2), (13, 1), (15, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 2), (10, 2), (15, 2)],
  term ((-9851670194564511 : Rat) / 1162780221153193) [(1, 2), (10, 2), (15, 2), (16, 1)],
  term ((-60573163266706614744631944042563938612 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (13, 1), (15, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 2), (15, 2)],
  term ((9851670194564511 : Rat) / 4651120884612772) [(1, 2), (15, 2), (16, 1)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1), (8, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1), (8, 1), (10, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (8, 1), (10, 1), (11, 1)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (8, 1), (11, 1)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (9, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (9, 1), (10, 2)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (8, 1), (10, 1), (11, 1)],
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (8, 1), (11, 1)],
  term ((122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1)],
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (10, 2)],
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-1116528852449223638668760558983743912635943563565867484 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((673691331644400 : Rat) / 1162780221153193) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 1), (11, 1)],
  term ((5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (8, 1), (13, 1)],
  term ((558264426224611819334380279491871956317971781782933742 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (7, 1), (8, 1), (15, 1)],
  term ((-336845665822200 : Rat) / 1162780221153193) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1)],
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (10, 2)],
  term ((1160665166366196213589052782730216702704 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (9, 1), (11, 1)],
  term ((-120119693188535354558813178622554671224 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-896456281639118 : Rat) / 1162780221153193) [(2, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1852269918245786896743252716934311896384 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((123791873617191140105857464850579092705757151288775427373 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((13766191430316001 : Rat) / 1162780221153193) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((448228140819559 : Rat) / 1162780221153193) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-926134959122893448371626358467155948192 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (11, 1), (13, 1)],
  term ((-123791873617191140105857464850579092705757151288775427373 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term ((-13766191430316001 : Rat) / 2325560442306386) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((120119693188535354558813178622554671224 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((896456281639118 : Rat) / 1162780221153193) [(2, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1852269918245786896743252716934311896384 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (10, 2), (13, 1)],
  term ((-123791873617191140105857464850579092705757151288775427373 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (9, 1), (10, 2), (15, 1)],
  term ((-13766191430316001 : Rat) / 1162780221153193) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-30029923297133838639703294655638667806 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (12, 1), (13, 1)],
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-448228140819559 : Rat) / 2325560442306386) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((463067479561446724185813179233577974096 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (13, 1)],
  term ((123791873617191140105857464850579092705757151288775427373 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 1), (9, 1), (15, 1)],
  term ((13766191430316001 : Rat) / 4651120884612772) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((290166291591549053397263195682554175676 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 2)],
  term ((-1160665166366196213589052782730216702704 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 2), (10, 2)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (8, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (8, 1), (10, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (8, 1), (10, 1), (11, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (8, 1), (11, 1)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1), (10, 2)],
  term ((24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 1)],
  term ((-49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 1), (10, 1)],
  term ((-315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((6527709106782976 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 1)],
  term ((-905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1)],
  term ((-3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (8, 1)],
  term ((-49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1)],
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (8, 1), (10, 1)],
  term ((-315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((6527709106782976 : Rat) / 1162780221153193) [(3, 1), (5, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1)],
  term ((-905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1)],
  term ((-3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 1), (10, 2), (13, 1)],
  term ((-1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (10, 2), (15, 1)],
  term ((-6527709106782976 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-78908208967256020638431158193382195448 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((452824946243456057718851545758264321159544336659511640 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((1631927276695744 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12329420463575023800351311507033664732 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (9, 2)],
  term ((49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (9, 2), (10, 2)],
  term ((148463915429989232827957433590977261265 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (7, 1), (8, 1)],
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (7, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2242722674317404 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((1121361337158702 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (9, 2)],
  term ((-189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (9, 2), (10, 1)],
  term ((-296927830859978465655914867181954522530 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (7, 1), (8, 1), (10, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (10, 1), (12, 1)],
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-3163264603646592 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-212582817171990 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (10, 1), (13, 2)],
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (10, 1), (14, 1)],
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 23644041155898808945036612648379641461034231099511730) [(3, 1), (7, 1), (8, 1), (10, 1), (15, 2)],
  term ((2096958610707350 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (12, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((106291408585995 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (13, 2)],
  term ((-608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (14, 1)],
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(3, 1), (7, 1), (8, 1), (15, 2)],
  term ((-1048479305353675 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 2)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 2), (10, 1)],
  term ((123007490483570609696505280535880061756 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1)],
  term ((-246014980967141219393010561071760123512 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 700 through 799. -/
theorem ep_Q2_024_block_21_0700_0799_valid :
    checkProductSumEq ep_Q2_024_partials_21_0700_0799
      ep_Q2_024_block_21_0700_0799 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
